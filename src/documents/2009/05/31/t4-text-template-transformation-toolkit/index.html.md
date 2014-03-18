---
layout: post 
title: "T4 – Text Template Transformation Toolkit"
subTitle: 
heroImageUrl: 
date: 2009-5-31
tags: ["Code Generation","T4"]
keywords: 
---

[![matrix](matrix_thumb.jpg "matrix")](http://csell.net/content/binary/WindowsLiveWriter/T4TextTemplateTransformationToolkit_12BA4/matrix_2.jpg)  

Chances are you have never heard of T4.&nbsp; Don't worry, most haven't.&nbsp; This tool was introduced when the DSL tools hit the market.&nbsp; As the name implies, it's a code generation engine.&nbsp; It's my understanding, T4 is used under the scenes by the DSL tools to generate out it's artifacts. This is also the tool that things like Linq to SQL and the Entity framework use to generate its artifacts.&nbsp; Very Cool, and a bit daunting at first.

There are a number of great resources on Code Generation. I don't want to recover what has been written better than I could but I do want to talk about the start of my journey with T4.&nbsp; So like anyone I hit the ole WWW in search for answers.&nbsp; The following resources got me rolling:

*   [T4 (Text Template Transformation Toolkit) Code Generation - Best Kept Visual Studio Secret](http://www.hanselman.com/blog/T4TextTemplateTransformationToolkitCodeGenerationBestKeptVisualStudioSecret.aspx)  <li>[PNP Guidance](http://www.pnpguidance.net/Tag/T4.aspx)  <li>[MSDN](http://msdn.microsoft.com/en-us/library/bb126445.aspx)  <li>[Kathleen Dollard's Blog](http://msmvps.com/blogs/kathleen/)  <li>[Oleg Sych's blog](http://www.olegsych.com/) and especially [T4 Tutorial: Creating your First Code Generator](http://www.olegsych.com/2008/09/t4-tutorial-creatating-your-first-code-generator/)  <li>Hanselminutes ["Code Generation and T4 with Kathleen Dollard"](http://www.hanselminutes.com/default.aspx?showID=170)  <li>[Clarius's Visual T4](http://www.visualt4.com/) 

Needless to say you don't really need anything to get started.&nbsp; I don't want to rehash anything already stated above, but I do want to cover a few good little hints I have learned so far.

*   You can include other TT files.
*   <#@ include file="core.tt" #>*   "Class level functions".&nbsp; These have listed at the **bottom** of the TT file in a <=+ => **if **there are other code blocks in the TT file. <li>Set your output file type.&nbsp; While you don't really need it in VS if you are using the command line it will still save a few headaches. It can be whatever type of file type you want.&nbsp;
        *   <#@ output extension="XML" #> <li>Assembly References.&nbsp; Just like a normal .NET program you have to reference what you need.&nbsp; I was a bit surprised I had to reference System.Core for some Linq Queries.

*   <#@ assembly name="System.Core" #>*   Imports.&nbsp; Nothing different from a using statement in C#

*   <#@ import namespace="System.Xml.Linq"#>*   You can't pass in parameters into the T4 Engine. Well you can, but not with the host that ships out of the box.&nbsp; Kathleen Dollard is actually working on a host that will address that situation but I have cheated in the meantime.&nbsp; I have an settings file ( like a config ) which I set the setting file from my own host which in turn calls the T4 Engine.&nbsp; The the templates just read that file getting whatever dynamic settings they need.  <li>I have been driving my templates with Powershell.&nbsp; <li>You can specify template framework versions, although you don't have to. 

I will indeed post more on T4.&nbsp; It's just amazing and we all should use it more.&nbsp; As I do it more and more I find myself coming up ***MUCH*** more creative ways to generate the same artifact with less.

More to come.....