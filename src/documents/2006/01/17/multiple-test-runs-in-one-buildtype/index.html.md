---
layout: post 
title: "Multiple Test Runs in one BuildType"
subTitle: 
heroImageUrl: 
date: 2006-1-17
tags: ["MSBuild","TeamBuild"]
keywords: 
---

<SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent"><FONT face=Verdana>If you are using TeamBuild then this post is for you.&nbsp; </FONT></SPAN>

<SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent"><FONT face=Verdana>In TeamExplorer when you create a new&nbsp;build type it will create a&nbsp;*.proj file.&nbsp; During the creation of&nbsp;this build type, you will be asked which TestLists you would like executed in that build type.&nbsp;&nbsp;Once completed if you open&nbsp;that proj file, you will see an item group that looks something like the following:</FONT></SPAN>

<SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent"></SPAN><SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent"><ItemGroup>
&nbsp;&nbsp;<MetaDataFile Include=<SPAN style="FONT-SIZE: 11px; COLOR: #666666; FONT-FAMILY: Courier New; BACKGROUND-COLOR: #e4e4e4">"$(SolutionRoot)\TestProject1\TestProject1.vsmdi"</SPAN>>
&nbsp;&nbsp;&nbsp; <TestList>TestList1;TestList2</TestList>
&nbsp; </MetaDataFile>
</ItemGroup></SPAN>

<SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent"><FONT face=Verdana>For this build type&nbsp;there are actually 2&nbsp;different&nbsp;TestLists, TestList1 and TestList2.&nbsp; These&nbsp;TestLists will get executed and reported on in the build.&nbsp; With the out of box ItemGroup configuration both&nbsp;lists will actually roll up into one&nbsp;set of test results; but what if you wanted to&nbsp;to actually have multiple test runs for a given build.&nbsp;</FONT></SPAN>
<SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">

<SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent"><FONT face=Verdana>We can make a very slight modification to that generated code block and actually get a separate&nbsp;test run per test list.</FONT></SPAN>

<SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent"><PropertyGroup>
&nbsp; <VsmdiPath>$(SolutionRoot)\TestProject1\TestProject1.vsmdi</VsmdiPath>
</PropertyGroup>

<ItemGroup>
&nbsp; <MetaDataFile Include=<SPAN style="FONT-SIZE: 11px; COLOR: #666666; FONT-FAMILY: Courier New; BACKGROUND-COLOR: #e4e4e4">"$(VsmdiPath)"</SPAN>>
&nbsp;&nbsp;&nbsp; <TestList>TestList1</TestList>
&nbsp; </MetaDataFile>

&nbsp; <MetaDataFile Include=<SPAN style="FONT-SIZE: 11px; COLOR: #666666; FONT-FAMILY: Courier New; BACKGROUND-COLOR: #e4e4e4">"$(VsmdiPath)"</SPAN>>
&nbsp;&nbsp;&nbsp; <TestList>TestList2</TestList>
&nbsp; </MetaDataFile>
</ItemGroup></SPAN>

<SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent"><FONT face=Verdana>More to come....</FONT></SPAN>

</SPAN>