---
layout: post 
title: "ExpectedException Exception Message Validation"
subTitle: 
heroImageUrl: 
date: 2006-1-16
tags: ["Unit Testing","VSTS"]
keywords: 
---

<SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent"><FONT face=Verdana>While you cannot validate you exception's message in the ExpectedException attribute all is not lost.&nbsp; Lets walk through three scenarios. </FONT></SPAN>

<SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent"><FONT face=Verdana><SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent"><FONT face=Verdana>In all three tests you will see an Assert.Fail in the try block.&nbsp; You need this statement in case the target doesn't throw any exceptions, therefor failing the test.&nbsp; The first example is a passing test, throw and exception with a message, catch it and compare the message string.&nbsp;</FONT></SPAN></FONT></SPAN>

<SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">&nbsp;&nbsp;&nbsp;[TestMethod]
<SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">&nbsp;&nbsp;&nbsp;public</SPAN> <SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">void</SPAN> PassingException()
&nbsp;&nbsp;&nbsp;{
<SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;const</SPAN> <SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">string</SPAN> expectedExceptionMessage <SPAN style="FONT-SIZE: 11px; COLOR: red; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">=</SPAN> <SPAN style="FONT-SIZE: 11px; COLOR: #666666; FONT-FAMILY: Courier New; BACKGROUND-COLOR: #e4e4e4">"Foobar Message"</SPAN>;

<SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;try</SPAN>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
<SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;throw</SPAN> <SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">new</SPAN> ApplicationException( expectedExceptionMessage );
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assert.Fail( <SPAN style="FONT-SIZE: 11px; COLOR: #666666; FONT-FAMILY: Courier New; BACKGROUND-COLOR: #e4e4e4">"Expected an exception to get thrown by target"</SPAN> );
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}

<SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;catch</SPAN> ( ApplicationException ex )
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assert.AreEqual<<SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">string</SPAN>>( expectedExceptionMessage, ex.Message );
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;&nbsp;&nbsp;}&nbsp;&nbsp;</SPAN><SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">
</SPAN>

<SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent"><FONT face=Verdana>Here we see the&nbsp;same test failing only because the message contained in the exception is different.
</FONT>

&nbsp;&nbsp;&nbsp;[TestMethod]
<SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">&nbsp;&nbsp;&nbsp;public</SPAN> <SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">void</SPAN> FailingOnExceptionMessage()
&nbsp;&nbsp;&nbsp;{
<SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;const</SPAN> <SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">string</SPAN> expectedExceptionMessage <SPAN style="FONT-SIZE: 11px; COLOR: red; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">=</SPAN> <SPAN style="FONT-SIZE: 11px; COLOR: #666666; FONT-FAMILY: Courier New; BACKGROUND-COLOR: #e4e4e4">"Foobar Message"</SPAN>;

<SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;try</SPAN>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
<SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;throw</SPAN> <SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">new</SPAN> ApplicationException( <SPAN style="FONT-SIZE: 11px; COLOR: #666666; FONT-FAMILY: Courier New; BACKGROUND-COLOR: #e4e4e4">"Invalid"</SPAN> );
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assert.Fail( <SPAN style="FONT-SIZE: 11px; COLOR: #666666; FONT-FAMILY: Courier New; BACKGROUND-COLOR: #e4e4e4">"Expected an exception to get thrown by target"</SPAN> );
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}

<SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;catch</SPAN> ( ApplicationException ex )
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assert.AreEqual<<SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">string</SPAN>>( expectedExceptionMessage, ex.Message );
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;&nbsp;&nbsp;}

<FONT face=Verdana>While this last test follows the same pattern seen above the test is really only testing for the type of exception being throw.&nbsp; This should be refactored to use the ExpectedException attribute.</FONT>

&nbsp;&nbsp;&nbsp;[TestMethod]
<SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">&nbsp;&nbsp;&nbsp;public</SPAN> <SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">void</SPAN> FailingOnExceptionType()
&nbsp;&nbsp;&nbsp;{
<SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;const</SPAN> <SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">string</SPAN> expectedExceptionMessage <SPAN style="FONT-SIZE: 11px; COLOR: red; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">=</SPAN> <SPAN style="FONT-SIZE: 11px; COLOR: #666666; FONT-FAMILY: Courier New; BACKGROUND-COLOR: #e4e4e4">"Foobar Message"</SPAN>;

<SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;try</SPAN>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
<SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;throw</SPAN> <SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">new</SPAN> Exception( expectedExceptionMessage );
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assert.Fail( <SPAN style="FONT-SIZE: 11px; COLOR: #666666; FONT-FAMILY: Courier New; BACKGROUND-COLOR: #e4e4e4">"Expected an exception to get thrown by target"</SPAN> );
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}

<SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;catch</SPAN> ( ApplicationException ex )
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}

<FONT color=#0000ff>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;catch</FONT>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assert.Fail(&nbsp;<SPAN style="FONT-SIZE: 11px; COLOR: #666666; FONT-FAMILY: Courier New; BACKGROUND-COLOR: #e4e4e4">"Incorrect Exception type was thrown by target"</SPAN>&nbsp;);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;&nbsp;&nbsp;}

<SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent"><FONT face=Verdana>Same test refactored, this test still fails but only to illustrate that example.</FONT></SPAN>

<SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">&nbsp;&nbsp;&nbsp;[TestMethod, ExpectedException ( <SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">typeof</SPAN> ( ApplicationException) )]
<SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">&nbsp;&nbsp;&nbsp;public</SPAN> <SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">void</SPAN> FailingOnExceptionType()
&nbsp;&nbsp;&nbsp;{
<SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;throw</SPAN> <SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">new</SPAN> Exception( <SPAN style="FONT-SIZE: 11px; COLOR: #666666; FONT-FAMILY: Courier New; BACKGROUND-COLOR: #e4e4e4">"..."</SPAN> );
&nbsp;&nbsp;&nbsp;}</SPAN>
</SPAN>