---
layout: post 
title: "Converting a csproj into a test csproj"
subTitle: 
heroImageUrl: 
date: 2006-1-21
tags: ["MSBuild","Unit Testing","VSTS"]
keywords: 
---

**Short answer.**

It's as simple as adding one line to your csproj which in turn tells the IDE to treat that project like a test project.&nbsp; Add the following line to your main PropertyGroup:

> <SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent"><ProjectGuid>{04082EBA-C85C-4336-B3FD-9891096BAA0F}</ProjectGuid></SPAN>

<SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent"><FONT face=Verdana color=#003300 size=2>Then just reference Microsoft.VisualStudio.QualityTools.UnitTestFramework.dll and you are on your way.&nbsp; <SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent"><FONT face=Verdana color=#003300 size=2>Be sure to verify that Guid between releases.&nbsp; </FONT></SPAN></FONT></SPAN>

<SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent"><FONT face=Verdana color=#003300 size=2>**Long Answer.**</FONT></SPAN>

<SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent"><FONT face=Verdana color=#003300 size=2>When I start a project I create the base set of known assemblies that project will need.&nbsp; I also add an additional test project which will contain any Scenario, Load&nbsp;and Stored Procedure tests.&nbsp; Then I convert all assemblies to test projects.&nbsp; I am a firm believer in&nbsp;Test Driven Development.&nbsp; IMHO it is the only way to properly write code.&nbsp; Having said that&nbsp;over the years I have developed my own set of TDD practices; one of which is the physical placement of your unit test&nbsp;classes in the assembly their testing.&nbsp; Why? Well I will explain that in a future post call Unit Testing with Partial Classes.</FONT></SPAN>

<SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent"><FONT face=Verdana color=#003300 size=2>With any decision there are of course trade-offs. In this case the trade-off is around the IDE interaction with hosting type projects, ie exe or&nbsp;web.&nbsp; After you convert an exe to a test project, when&nbsp;you decide to run ( F5 ) it will actually fire off Test Manager rather than the launch app.&nbsp; If you are a TDD&nbsp;bigot like me&nbsp;this is actually the&nbsp;correct action; if your not, I know your already complaining.&nbsp;&nbsp;BUT all is not lost!&nbsp;&nbsp;There is a little tool us TDD bigots keep&nbsp;in our back pocket at all times, [TestDriven.Net](http://testdriven.net/).&nbsp; This is an Visual Studio add-in and it allows you to execute your unit tests with just a right click.&nbsp; If you choose to use this tool it isn't necessary to convert your project to a test project but rather just reference the Microsoft.VisualStudio.QualityTools.UnitTestFramework.dll.&nbsp; This will allow you to fire your app as intended and run your tests with the same project configuration.</FONT></SPAN>

<SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent"><FONT face=Verdana color=#003300 size=2>**Disclaimer:** this is not a Microsoft recommend practice.&nbsp; You can find more information about the Visual Studio Team System Testing Framework [here](http://msdn2.microsoft.com/en-us/library/ms304624(en-us,vs.80).aspx).</FONT></SPAN>