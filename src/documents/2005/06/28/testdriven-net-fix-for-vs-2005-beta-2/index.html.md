---
layout: post 
title: "TestDriven.Net Fix for VS 2005 Beta 2"
subTitle: 
heroImageUrl: 
date: 2005-6-28
keywords: 
---

I have been without [TestDriven.Net](http://www.testdriven.net/) for a while and it' s been killing me. I can't explain why the following change works but it works.

<LI>Copied the version of Microsoft.VisualStudio.QualityTools.Tips.UnitTest.ObjectModel.dll that was installed with the version of the IDE into the root of "C:\Program Files\TestDriven.NET 1.0" and "C:\Program Files\TestDriven.NET 1.0\QualityTools" 
<LI>Updated the TestDriven.Config AssemblyPath to remove "QualityTools\". 

Original:
`

> testrunner Name="QualityTools" AssemblyPath=**"QualityTools\TestDriven.QualityTools.dll" **TypeName="TestDriven.QualityTools.QualityToolsTestRunner"
> targetframework AssemblyName="Microsoft.VisualStudio.QualityTools.UnitTestFramework"
> testrunner

`

Modified:
`

> testrunner Name="QualityTools" AssemblyPath=**"TestDriven.QualityTools.dll"** TypeName="TestDriven.QualityTools.QualityToolsTestRunner"
> targetframework AssemblyName="Microsoft.VisualStudio.QualityTools.UnitTestFramework"
> testrunner`</LI>