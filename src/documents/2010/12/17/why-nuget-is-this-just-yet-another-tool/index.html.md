---
layout: post 
title: "Why NuGet? Is this just yet another tool?"
subTitle: 
heroImageUrl: 
date: 2010-12-17
tags: ["asp.net","NuGet"]
keywords: 
---

<font size="3" face="Segoe UI">Unfamiliar with what </font>[<font size="3" face="Segoe UI">NuGet</font>](http://nuget.codeplex.com/)<font size="3" face="Segoe UI"> is? Well this post is aimed at dispelling some of the myths out there. At the time of writing this, NuGet is in Beta and has not released V1\. </font>

<font size="3" face="Segoe UI"></font>

<font size="3" face="Segoe UI"></font>

<font size="3" face="Segoe UI">Lets just start with what is </font>[<font size="3" face="Segoe UI">NuGet</font>](http://nuget.codeplex.com/)<font size="3" face="Segoe UI">? Well the </font>[<font size="3" face="Segoe UI">NuGet</font>](http://nuget.codeplex.com/)<font size="3" face="Segoe UI"> team defines it like so:</font>
  > <font size="3" face="Segoe UI">"NuGet is a free, open source developer focused <font style="background-color: #ffff00">package management system</font> for the <font style="background-color: #ffff00">.NET</font> platform intent on <font style="background-color: #ffff00">simplifying</font> the process of <font style="background-color: #ffff00">incorporating</font> third party <font style="background-color: #ffff00">libraries</font> into a .NET application during <font style="background-color: #ffff00">development</font>. NuGet is a member of the ASP.NET Gallery in the <u>[Outercurve](http://outercurve.org/)</u><u></u><u>[Foundation](http://outercurve.org/)</u>."</font>  

<font size="3" face="Segoe UI"></font>

<font size="3" face="Segoe UI">I have taken their definition and highlighted a few key areas.&#160; By far this isn't something new to .NET or even our industry.&#160; In fact this started as a </font>[<font size="3" face="Segoe UI">RubyGems</font>](http://rubygems.org/)<font size="3" face="Segoe UI"> clone but before we dive into the details of NuGet, I want to address a bit of naming history.&#160; A long time ago like earlier this year, there were actually two efforts going on.&#160; A community effort called Nu or Nubular or and an internal Microsoft project called NPack.&#160; As some point worlds collided and both project joined forces.&#160; The result of that marriage was now called NuPack.&#160; Well, as it turns out "NuPack" was actually something already in development by some guys over at Caltech. They already have an effort called </font>[<font size="3" face="Segoe UI">NUPACK</font>](http://nupack.org)<font size="3" face="Segoe UI"> otherwise known as the Nucleic Acid Project.&#160; Given that, the team opened up a naming vote to the community. And the winner was..... NuGet.</font>

<font size="3" face="Segoe UI"></font>

<font size="3" face="Segoe UI"></font>

<font size="3" face="Segoe UI">We've established NuGet as a package manager\framework\delivery mechanism.&#160; NuGet is targeted for the application developer either consuming or producing.&#160; It allows one to package their assets in something called a .nupack file ( zip file really ).&#160; That nupack file can then be found and installed over the web.&#160; To install NuGet you will need to visit the Visual Studio Extension Manager and install it right from there.&#160; That will create a new not only a new Project Reference Dialog but a Package Manager Console Window.&#160; Once installed go to the package manager window and type "_List-Package_".&#160; Find your package and type "_Install-Package { packageName }_". You can find more information on getting started here: [http://nuget.codeplex.com/documentation?title=Getting%20Started](http://nuget.codeplex.com/documentation?title=Getting%20Started "Getting%20Started")</font>

<font size="3" face="Segoe UI"></font>

<font size="3" face="Segoe UI">But don't we have a number already? Why another? Right now ( for me and taking the eye of a developer ) there are really 4 different delivery methods that seem to stand tall:</font>

*   <font size="3" face="Segoe UI">WebPI or the WebPlatform Installer </font>
*   <font size="3" face="Segoe UI">NuGet </font>
*   <font size="3" face="Segoe UI">Visual Studio Extension Manager </font>
*   <font size="3" face="Segoe UI">exe's, msi's, zip's etc&#160; </font>  

<font size="3" face="Segoe UI"></font>

<font size="3" face="Segoe UI">I think in the coming years we will see things like "AppStores or Marketplaces" become a major leader too.&#160; So which one do you pick?&#160; Is there overlap?&#160; Interesting enough there really is overlap and in fact some even use each other.&#160; </font>

<font size="3" face="Segoe UI"></font>

[<font size="3" face="Segoe UI">![image](image_thumb.png "image")</font>](http://csell.net/content/binary/Windows-Live-Writer/NuGet-Nuggets_B7C1/image_2.png)

<font size="3" face="Segoe UI">Is there only one choice?&#160; No of course not.&#160; It could depend on so many items. Do they have to install offline? Do they program against it? Do you have to be in multiple channel? Should you be in multiple channel? Just to name a few. I was putting together a NuGet presentation when I ran across this paraphrased quote:</font>
  > ### **<font size="3" face="Segoe UI">Choice is affected by context.</font>**  > _<font size="3" face="Segoe UI">Song-Oh Yoon and Itamar Simonson. "Choice Set Configuration as a Determinant of Preference Attribution and Strength" Journal of Consumer Research: August 2008.</font>_  

<font size="3" face="Segoe UI">SPOT ON! This quote came from an article where they explored consumer buying decisions and how context was extremely important but of course "that context" is the tricky part. I guess that consultants response of "It just depends" has some validity. Stay with me now, take this photo for example: </font>
  > [<font size="3" face="Segoe UI">![](42624981_cb6c1448b5.jpg)</font>](http://www.flickr.com/photos/pupski/42624981/)
> 
> [<font size="3" face="Segoe UI">http://www.flickr.com/photos/pupski/42624981/</font>](http://www.flickr.com/photos/pupski/42624981/ "http://www.flickr.com/photos/pupski/42624981/")  

<font size="3" face="Segoe UI">Simple enough right?&#160; Maybe at first glance, but lets look closer:</font>

*   <font size="3" face="Segoe UI">Is 1901 a year or an address? </font>
*   <font size="3" face="Segoe UI">Is SAM a person or a thing? </font>
*   <font size="3" face="Segoe UI">Name of what, owner, person, builder, building name? </font>  

<font size="3" face="Segoe UI">So what does this all really have to do with Package and Distribution methods\frameworks? Well the context around where, why, when, how do you ship you're software "_just depends_" and will be different for each user, channel or application.</font>

<font size="3" face="Segoe UI">Let's break down each of those options listed above:</font>

1.  <font size="3" face="Segoe UI">.exe, .msi, .zip whatever... </font>
        *   <font size="3" face="Segoe UI">Installed to Operating System </font>
    *   <font size="3" face="Segoe UI">Lots of choices </font>
    *   <font size="3" face="Segoe UI">Usually chained with other packages </font>
    *   <font size="3" face="Segoe UI">Stands and installs by itself </font>
    *   <font size="3" face="Segoe UI">No native distribution channel </font>
    *   <font size="3" face="Segoe UI">No free marketing </font>
    *   <font size="3" face="Segoe UI">Manual Updates, ie need another package and user input </font>
    *   <font size="3" face="Segoe UI">Examples packages include: </font>
            *   <font size="3" face="Segoe UI">WebPI </font>
        *   <font size="3" face="Segoe UI">Visual Studio </font>
        *   <font size="3" face="Segoe UI">Office&#160; </font>2.  <font size="3" face="Segoe UI">WebPI</font></a></a><font size="3" face="Segoe UI"> </font>
        *   <font size="3" face="Segoe UI">Catalogue of products </font>
    *   <font size="3" face="Segoe UI">Install stands on it's own </font>
    *   <font size="3" face="Segoe UI">Packages install to operating system </font>
    *   <font size="3" face="Segoe UI">Install through WebPI distribute channel </font>
    *   <font size="3" face="Segoe UI">Installation Simplified </font>
    *   <font size="3" face="Segoe UI">Drive by, Marketing </font>
    *   <font size="3" face="Segoe UI">Example Packages include: </font>
            *   <font size="3" face="Segoe UI">WebPI </font>
        *   <font size="3" face="Segoe UI">MVC </font>
        *   <font size="3" face="Segoe UI">IIS Modules </font>
        *   <font size="3" face="Segoe UI">WordPress </font>3.  <font size="3" face="Segoe UI">Visual Studio Extension Manager </font>
        *   <font size="3" face="Segoe UI">Part of Visual Studio </font>
    *   <font size="3" face="Segoe UI">Packages install into Visual Studio </font>
    *   <font size="3" face="Segoe UI">Packages are targeted to augmenting the development experience </font>
    *   <font size="3" face="Segoe UI">Automatic updating </font>
    *   <font size="3" face="Segoe UI">Drive by marketing </font>
    *   <font size="3" face="Segoe UI">Example packages include </font>
            *   <font size="3" face="Segoe UI">nuget </font>
        *   <font size="3" face="Segoe UI">Visual Studio Powertools </font>
        *   <font size="3" face="Segoe UI">JetBrains Resharper </font>
        *   <font size="3" face="Segoe UI">NuGet </font>4.  <font size="3" face="Segoe UI">NuGet </font>
        *   <font size="3" face="Segoe UI">Packages are usually "libraries" </font>
    *   <font size="3" face="Segoe UI">Packages are meant to be developed against </font>
    *   <font size="3" face="Segoe UI">Multiple hosting strategies </font>
    *   <font size="3" face="Segoe UI">Channel = Web </font>
    *   <font size="3" face="Segoe UI">Drive by marketing </font>
    *   <font size="3" face="Segoe UI">Easy tooling integration with things like Visual Studio, </font>[<font size="3" face="Segoe UI">WebMatrix</font>](http://asp.net/webmatrix)<font size="3" face="Segoe UI"> </font>
    *   <font size="3" face="Segoe UI">Example packages include: </font>
            *   <font size="3" face="Segoe UI">ELMAH </font>
        *   <font size="3" face="Segoe UI">Entity Framework </font>
        *   <font size="3" face="Segoe UI">SQL Compact </font>
        *   <font size="3" face="Segoe UI">UrlShortenerHelper </font>  

<font size="3" face="Segoe UI"></font>

<font size="3" face="Segoe UI"></font>

<font size="3" face="Segoe UI">Of course those there are of course are plenty more one can add to the mix. Through that process though, what I realized is some dovetail on one another.&#160; NuGet and WebPI both use one mechanism to get install and provide yet another to something or someone else.</font>

#### <font face="Segoe UI">&#160;</font>

#### [<font face="Segoe UI">![image](image9_thumb.png "image")</font>](http://csell.net/content/binary/Windows-Live-Writer/NuGet-Nuggets_B7C1/image9.png)

<font face="Segoe UI">For me I like to think of them like this:</font>

1.  <font size="3" face="Segoe UI">EXE etc, Most control, you own your distribution, can install offline </font>
2.  <font size="3" face="Segoe UI">WebPI, broad sweeping things that install into the OS.&#160; While Visual Studio might be able to be installed through WebPI it's most likely just to big and complicated for it. .NET and PHP runtimes are great examples. </font>
3.  <font size="3" face="Segoe UI">Visual Studio Extension Manager - Things that augment your development experience in Visual Studio. Of course VS itself of #1 </font>
4.  <font size="3" face="Segoe UI">NuGet, Things you program against.&#160; They shouldn't need to be part of program files. They in fact should be part of your source control. Of course there is context that should go around that statement too. </font>  

<font size="3" face="Segoe UI"></font>

<font size="3" face="Segoe UI">So the framework and mechanisms are all in place. Where does your software fit?&#160; As I am writing the [UrlShortenerHelper](http://urlshortenerhelper.codeplex.com/) for ASP.NET WebPages it sure is nice to just be able to type "install-package UrlShortener" and have the thing installed from either a public or private feed.</font>

<font size="3" face="Segoe UI"></font>

<font size="3" face="Segoe UI"></font>

&#160;

<font size="3" face="Segoe UI">NuGet, I can't speak for others but I am sure glad you're here.&#160; </font>