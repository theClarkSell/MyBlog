---
layout: post 
title: "Blogging again????"
subTitle: 
heroImageUrl: 
date: 2009-5-22
tags: ["MSBuild","TeamBuild"]
keywords: 
---

You know sometimes it's just sad how fast time can go by.  Looking back it's been well over a year maybe two since I last blogged.  WOW, that's not cool.  So what the hell happened, well LIFE I guess.  Let's see:

![question-mark1a.jpg](thumbnail.aspx?q=664275258942&id=76e13843c66fbcd2adfc6c6dabbc7509 "question-mark1a.jpg")

*   <div align="left">I had my second child ( girl, Addison ).  We are blessed to have one of each and both healthy.  </div> <li> <div align="left">I got to meet Bill Gates, Steve Ballmer and all of the rest of the Microsoft executives </div> <li> <div align="left">Bought a Honda ( needed a 4 door with 2 kids ) </div> <li> <div align="left">This fiscal year I will have billed over 2300 hours which doesn't account for my other job.  Can you say Year of the Death March!!! </div> <li> <div align="left">Ran into Sieg from the Deadliest Catch at SeaTac </div> <li> <div align="left">Learned how to make the perfect Margarita! </div> 

Regardless a lot has happened and it's time to talk technology again.  I love it and really miss doing it. With all of the great stuff here upon us now, it's time to start sharing. I was reading MSDN Magazine the other day when I ran across an article about [MSBuild and best practices](http://msdn.microsoft.com/en-us/magazine/dd483291.aspx) which really got me thinking.  There were two items that really stuck out for me:

1.  Compilation of large source trees.  I think it's a must read but caution readers that "large" can mean many different things.  <li>Reference Management 

While both were explained pretty well, lets put #2 into practice.  *I'M LAZY* ( in a good way of course ). I would much rather write something once rather than screw with it time and time again, especially the stuff you have to do like build work.  

So lets talk assembly references....

Assembly references can be easy as you want it to be but sometimes a little prep work will go a long way. The .NET compilers and runtime both have a specific order in which they look for references.  If you look in your framework folder for Microsoft.Common.Targets you will find the following:
 > The SearchPaths property is set to find assemblies in the following order:  [![legos](legos_thumb.jpg "legos")](http://csell.net/content/binary/WindowsLiveWriter/Bloggingagain_130CA/legos_2.jpg)
> 
> 1.  Files from current project - indicated by {CandidateAssemblyFiles}  <li>$(ReferencePath) - the reference path property, which comes from the .USER file.  <li>The hintpath from the referenced item itself, indicated by {HintPathFromItem}.  <li>The directory of MSBuild's "target" runtime from GetFrameworkPath.  The "target" runtime folder is the folder of the runtime that MSBuild is a part of.  <li>Registered assembly folders, indicated by {Registry:*,*,*}  <li>Legacy registered assembly folders, indicated by {AssemblyFolders}  <li>Look in the application's output folder (like bin\debug)  <li>Resolve to the GAC.  <li>Treat the reference's Include as if it were a real file name. 

So what if your not one of those nine?!?!?

Since it's all just angle brackets we can extend the "out of the box" search paths.  As it was explained in the article you can override the property _AssemblySearchPaths.  _Aaron had a great post on [MSBuild Property Evaluation](http://blogs.msdn.com/aaronhallberg/archive/2007/07/16/msbuild-property-evaluation.aspx), it's something you should read.  Overriding a property is as simple as importing your own target file into the stack and then resetting the property ( for most cases ).  You could also just add a the same property further down the stack in the same file.  Both are essentially the same. With MSBuild the *stack is always important*.  If you were to import your target file or override a property to early you might change the way the entire build system works.  There are a number of properties that work like:
 > <AssemblySearchPaths Condition=" '$(AssemblySearchPaths)' == ''"> 

This is a very common practice throughout MSBuild implementations.  As you can tell it's just a way or protecting yourself from a change in behavior **upstream**. Remember MSBuild parses top down to you have no influence what might be done afterwards.  In our case what we want to do is import our targets file **after** the Microsoft.Common.Targets file in the csproj or vbproj file(s).
 > <Import Project="$(MSBuildBinPath)\Microsoft.CSharp.targets" /> 
> 
> <Import Project="..\MyTargets.targets" /> ***NEW*** 

By doing so AssemblySearchPaths will be "" and initialize itself as expected.  So if we want to add to it it's as simple as ( snip from MyTargets.Targets ): 
 > .... 
>     <PropertyGroup> 
> 
>       <AssemblySearchPaths> 
>           $(AssemblySearchPaths); 
>           C:\binaries\; 
>       </AssemblySearchPaths> 
>     </PropertyGroup> 
> .... 

1.  Define a Property Group  <li>Define the Property ( AssemblySearchPaths )  <li>Set it to itself and add to itself 

Important point, **Reference Paths are folders not files**.  So now if you compile from the cmd line or from VS you will have your paths in the stack. The easiest way to see what is going in is to simply run **msbuild.exe /t:rebuild /v:diag **on your sln file.  That will dump everything that took place during the execution from MSBuild. Even the order of folders it searched for.  You will actually be able to see the reference pats listed that it couldn't find.

But we are not done yet.  We have a hardcoded path and remember, I'm lazy. How about we bootstrap ourselves into the build process and read the file system building the search paths based on a "root" folder you specify?  Then any machine should work without any change.
 > <pre class="brush: csharp; ruler: true;"><font size="1"><font size="2" face="t"><Project InitialTargets="bootstrap" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">> 
> 
> 		<PropertyGroup>> 
> 				<referencePath>$(SolutionDir)..\MyBinaries\**\*.*</referencePath>> 
> 		</PropertyGroup>> 
> 
> 		<Target Name="bootstrap">> 
> 
> 		<CreateItem Include ="$(referencePath)">> 
> 			<Output ItemName="binariesFound" TaskParameter="Include"/>> 
> 		</CreateItem>> 
> 
> 		</Target>> 
> 
> 	<PropertyGroup>> 
> 			<AssemblySearchPaths>> 
> 				$(AssemblySearchPaths);> 
> 				**@(binariesFound->'%(RootDir)%(Directory)');**        > 
> 			</AssemblySearchPaths>> 
> 		</PropertyGroup>> 
> 
> </Project></font></font></pre>

Important points:

1.  **InitialTargets **was set. This gives us the ability to run *first*.  Why? Well we want to read the file system and build the list of folders. 
<li>We create an item during the execution of the target rather than statically. 
<li>We later transform that target just adding the folder rather than the whole file path.

Team Build has a similar concept but much easier.  At the bottom of any tfsbuild.proj fiile there is a commented collection called **AdditionalReferencePath. **It works the same it's just that the Team Build process does it all for you already.