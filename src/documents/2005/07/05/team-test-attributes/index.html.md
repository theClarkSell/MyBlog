---
layout: post 
title: "Team Test Attributes"
subTitle: 
heroImageUrl: 
date: 2005-7-5
keywords: 
---

A quick breakdown of the [<FONT color=#667755>Team Test</FONT>](http://msdn2.microsoft.com/library/ms182409(en-us,vs.80).aspx) attributes compared to [<FONT color=#667755>NUnit</FONT>](http://nunit.org/) attributes with a few examples.

All [<FONT color=#667755>Team Test</FONT>](http://msdn2.microsoft.com/library/ms182409(en-us,vs.80).aspx) attributes are found in the following namespace:
<SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">Microsoft.VisualStudio.QualityTools.UnitTesting.Framework</SPAN>

**Attribute Quick List**

<TABLE cellSpacing=2 cellPadding=2 border=3>
<TBODY>
<TR>
<TD>**Team Test**</TD>
<TD>**NUnit**</TD></TR>
<TR>
<TD>TestClass</TD>
<TD>TestFixture</TD></TR>
<TR>
<TD>AssemblyInitialize </TD>
<TD>N/A</TD></TR>
<TR>
<TD>AssemblyCleanup </TD>
<TD>N/A</TD></TR>
<TR>
<TD>ClassInitialize </TD>
<TD>TestFixtureSetUp</TD></TR>
<TR>
<TD>ClassCleanup </TD>
<TD>TestFixtureTearDown</TD></TR>
<TR>
<TD>TestInitialize </TD>
<TD>SetUp</TD></TR>
<TR>
<TD>TestCleanup </TD>
<TD>TearDown</TD></TR>
<TR>
<TD>TestMethod</TD>
<TD>Test</TD></TR></TBODY></TABLE>

AssemblyInitalize and AssemblyCleanup are new. There are no equivalent attributes in [<FONT color=#667755>NUnit</FONT>](http://nunit.org/). These attributes run at AppDomain load and dispose.
`
``

<SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">[ AssemblyInitialize ]
<SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">public</SPAN> <SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">static</SPAN> <SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">void</SPAN> AssemblyInitialize()
{ }

[ AssemblyCleanup ]
<SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">public</SPAN> <SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">static</SPAN> <SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">void</SPAN> AssemblyCleanup()
{ }</SPAN>
`

Acting just like the NUnit TestFixtureSetUp and TestFixtureTearDown with the only one minor difference. Both methods have to be static and the ClassInitialize takes in one parameter. ClassInitialize will execute before any TestInitialize and TestMethod after the AssemblyInitialize while ClassCleanup executes after the TestMethod and TestCleanup but before the AssemblyCleanup.
`
``

<SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">[ ClassInitialize ]
<SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">public</SPAN> <SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">static</SPAN> <SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">void</SPAN> ClassInitialize(TestContext t)
{ }

[ ClassCleanup ]
<SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">public</SPAN> <SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">static</SPAN> <SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">void</SPAN> ClassCleanup()
{ }</SPAN>
`

TestInitialize executes before each test and TestCleanup executes after each test for every TestMethod.
`<SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent"></SPAN>`

`<SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">[ TestInitialize ]
<SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">public</SPAN> <SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">void</SPAN> TestInitalize()
{ }

[ TestCleanup ]
<SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">public</SPAN> <SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">void</SPAN> TestCleanup()
{ }</SPAN>
`

`
`&nbsp;