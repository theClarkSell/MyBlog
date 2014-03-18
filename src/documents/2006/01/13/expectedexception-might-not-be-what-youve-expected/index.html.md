---
layout: post 
title: "ExpectedException might not be what you've expected"
subTitle: 
heroImageUrl: 
date: 2006-1-13
tags: ["Unit Testing","VSTS"]
keywords: 
---

If you've switched from NUnit to the VSTS Unit Testing then I am pretty sure you've used the [ExpectedException](http://msdn2.microsoft.com/en-us/library/microsoft.visualstudio.testtools.unittesting.expectedexceptionattribute.aspx) attribute. If you haven't it looks something like this:

> <SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">[ExpectedException( <SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">typeof</SPAN>( ApplicationException ), <SPAN style="FONT-SIZE: 11px; COLOR: #666666; FONT-FAMILY: Courier New; BACKGROUND-COLOR: #e4e4e4">"Message"</SPAN> )]</SPAN>

<SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent"><FONT face=Verdana color=#003300 size=2>Using it with a test would look like the following:</FONT></SPAN>
<SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">
> <SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">[TestMethod, ExpectedException( <SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">typeof</SPAN> ( ApplicationException ) ) ]
> <SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">public</SPAN> <SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">void</SPAN> ut1()
> {
> <SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">&nbsp;&nbsp;&nbsp;throw</SPAN> <SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">new</SPAN> ApplicationException();
> }
> 
> [TestMethod, ExpectedException( <SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">typeof</SPAN>( ApplicationException ), <SPAN style="FONT-SIZE: 11px; COLOR: #666666; FONT-FAMILY: Courier New; BACKGROUND-COLOR: #e4e4e4">"foo"</SPAN> )]
> <SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">public</SPAN> <SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">void</SPAN> ut2()
> {
> <SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">&nbsp;&nbsp;&nbsp;throw</SPAN> <SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">new</SPAN> ApplicationException(<SPAN style="FONT-SIZE: 11px; COLOR: #666666; FONT-FAMILY: Courier New; BACKGROUND-COLOR: #e4e4e4">"bar"</SPAN>);
> }
> </SPAN>

<SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent"><FONT face=Verdana color=#003300 size=2>You would naturally expect&nbsp;test ut1 to pass and ut2 to fail.&nbsp; ut2 should fail&nbsp;on the bases that the message&nbsp;contained within the exception was in fact&nbsp;different.&nbsp; Not true.&nbsp; Both actually pass and not because of a bug but rather a new feature introduced to the attribute.&nbsp; The [Message](http://msdn2.microsoft.com/en-us/library/microsoft.visualstudio.testtools.unittesting.expectedexceptionattribute.message.aspx)&nbsp;property is actually&nbsp;a message that prints&nbsp;out with the test when it fails;&nbsp;just like the optional&nbsp;message property you find on all of the [Assert methods](http://msdn2.microsoft.com/en-us/library/ms245282(en-US,VS.80).aspx).</FONT></SPAN>
<SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">

<SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">&nbsp;&nbsp;&nbsp;Assert.IsTrue( <SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">false</SPAN> == <SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">true</SPAN>, <SPAN style="FONT-SIZE: 11px; COLOR: #666666; FONT-FAMILY: Courier New; BACKGROUND-COLOR: #e4e4e4">"Developer put explanation if this test was to fail"</SPAN> );</SPAN>
</SPAN><FONT face=Verdana color=#003300 size=2></FONT>

<SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent"><FONT face=Verdana color=#003300 size=2>That message will print with the output of the test like so: </FONT></SPAN>

> <SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent"><FONT face=Verdana color=#003300 size=2>Error&nbsp;1&nbsp;TestCase 'ExpectedExceptionTest.ExpectedException.ut3' failed: <FONT color=#ff0000>Assert.IsTrue failed. Developer put explanation if this test was to fail
> </FONT>at ExpectedExceptionTest.ExpectedException.ut3() in C:\MyPrograms\ExpectedException\ExpectedExceptionTest\ExpectedException.cs:line 26&nbsp;C:\MyPrograms\ExpectedException\ExpectedExceptionTest\ExpectedException.cs&nbsp;26&nbsp;
> </FONT></SPAN>

<SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent"><FONT face=Verdana color=#003300 size=2>Lets correct ut2:</FONT></SPAN>
<SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent"><FONT face=Verdana color=#003300 size=2>
> <SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">[TestMethod, ExpectedException( <SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">typeof</SPAN>( ApplicationException ), <SPAN style="FONT-SIZE: 11px; COLOR: #666666; FONT-FAMILY: Courier New; BACKGROUND-COLOR: #e4e4e4">"I failed because I am looking for the wrong excpeption type"</SPAN> )]
> <SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">public</SPAN> <SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">void</SPAN> newUt2()
> {
> <SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">&nbsp;&nbsp;&nbsp;throw</SPAN> <SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">new</SPAN> Exception( <SPAN style="FONT-SIZE: 11px; COLOR: #666666; FONT-FAMILY: Courier New; BACKGROUND-COLOR: #e4e4e4">"foobar"</SPAN> );
> }</SPAN></FONT></SPAN>

<SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent"><FONT face=Verdana color=#003300 size=2>This will in fact fail because the Exception type thrown was different.&nbsp; When it fails we will see that message in the output.</FONT></SPAN>

<SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent"><FONT face=Verdana color=#003300 size=2>Having said all that, there is in fact a&nbsp;bug.&nbsp; When you run a test with that [ExpectedException](http://msdn2.microsoft.com/en-us/library/microsoft.visualstudio.testtools.unittesting.expectedexceptionattribute.aspx)&nbsp;attribute in&nbsp;Visual Studio you will not see the message on the failure output; if you run it in MSTest.exe you will.</FONT></SPAN>

</SPAN>[ExpectedException.cs (.75 KB)](http://csell.net/content/binary/ExpectedException.cs)