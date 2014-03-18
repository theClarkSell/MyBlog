---
layout: post 
title: "System.Diagnostics Tracing and DebugView"
subTitle: 
heroImageUrl: 
date: 2005-10-21
keywords: 
---

The other day I ran across [<FONT color=#667755>DebugView </FONT>](http://www.sysinternals.com/Utilities/DebugView.html)by [<FONT color=#667755>Sysinternals</FONT>](http://sysinternals.com/). After playing with it for a few I suddenly had a re-found love for [<FONT color=#667755>System.Diagnostics</FONT>](http://msdn2.microsoft.com/en-us/library/15t15zda(en-US,VS.80).aspx).

"DebugView is an application that lets you monitor debug output on your local system, or any computer on the network that you can reach via TCP/IP. It is capable of displaying both kernel-mode and Win32 debug output, so you don't need a debugger to catch the debug output your applications or device drivers generate, nor do you need to modify your applications or drivers to use non-standard debug output APIs." from [<FONT color=#667755>Sysinternals</FONT>](http://sysinternals.com/)

This means you have a nice little exe you can carry on a thumb drive and collect those trace events at runtime on from any machine. Let's look at some code.

First define a TraceSwitch. This switch gives you the ability to determine when to throw an event. You can define multiple switches.
`

> <P><SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent"><SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">public</SPAN> <SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">static</SPAN> TraceSwitch GeneralTraceSwitch <SPAN style="FONT-SIZE: 11px; COLOR: red; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">=</SPAN> <SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">new</SPAN> TraceSwitch("General", "My Trace Switch"); 
> 
> <SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">if</SPAN> ( GeneralTraceSwitch.TraceError )
> &nbsp; Trace.TraceError( "YOUR ERROR MSG" );</SPAN>`

Now let's setup configuration. There are two major sections, listeners and switches. Listeners define where System.Tracing should send your events. The example below sends events to both the EventLog and a text file. Having said that has no influence on DebugView, you do not have to define a listener for DebugView to pick them up. The switches section defines the level of events to throw. 1 is the minimal number of events, while 4 is everything.

`

> <P><SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent"><configuration > 
> &nbsp;<system.diagnostics >
> 
> &nbsp; <trace autoflush="<SPAN style="FONT-SIZE: 11px; COLOR: blue; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">true</SPAN>" indentsize="0″ >
> &nbsp;&nbsp;&nbsp; <listeners >
> &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<add name="EventLogTraceListener" type="System.Diagnostics.EventLogTraceListener" initializeData="Team Build"/>
> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <add name="TextWriterTraceListener" type="System.Diagnostics.TextWriterTraceListener" initializeData=".\ci.log" />
> &nbsp;&nbsp;&nbsp; </listeners >
> &nbsp; </trace >
> 
> &nbsp; <switches >
> &nbsp;&nbsp;&nbsp; <add name="General" value="4″ />
> &nbsp; </switches >
> <FONT size=1>&nbsp;</FONT></SPAN><SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent"><FONT size=1>&nbsp;</FONT></SPAN>
> 
> <SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent"></system.diagnostics >
> </configuration >
> 
> </SPAN>`