---
layout: post 
title: "TFS Event Filtering"
subTitle: 
heroImageUrl: 
date: 2006-11-1
tags: ["TFS Eventing","TfsAlert"]
keywords: 
---

With today's release of [TfsAlert](http://www.codeplex.com/Wiki/View.aspx?ProjectName=TfsAlert) a question will no doubt get asked; what really is a Filter Expression?&nbsp; Short answer, an expression to filter events sent from TFS. 

Long answer.

Formally known as Visual Studio Event Filter Language or VSEFL, it feels very much like a SQL expression and/or like WIQL. These filters are added with the creation of the subscription itself.&nbsp; This becomes really important when you're consuming any part of the TFS eventing system.&nbsp; Let's use [TfsAlert](http://www.codeplex.com/Wiki/View.aspx?ProjectName=TfsAlert) for example.&nbsp; It's 100% driven by the TFS eventing system and while&nbsp;there are a number of events once can subscribe to lets just focus on two and further provide some concrete examples.

*   CheckinEvent  <li>WorkItemChangedEvent 

Lets also assume you have a TFS server which has more than one TFS project and more than one person using it.&nbsp; Given that&nbsp;when you startup [TfsAlert](http://www.codeplex.com/Wiki/View.aspx?ProjectName=TfsAlert) without any subscription filters you're going to get a number of events, some of which I am sure you don't care about.&nbsp; The following questions usually come next.&nbsp; How can I

*   filter&nbsp;a CheckinEvent for my set of team project(s)?  <li>filter&nbsp;only WorkItems assigned to me across any TFS project?  <li>filter WorkItems for my area? 

A typical CheckinEvent filter usually looks something like the following:
 > <pre>" TeamProject = 'Project Name' "</pre><pre>" TeamProject MATCH 'Project Name A'Project Name B' "</pre>

Those two expression actually answer that first question. The expression simply states we want to filter on TeamProject where the it either = 'Project Name' or MATCH all project which equal _Project Name A_ or _Project Name B._ The "key" ( in this case TeamProject) is derived from that events schema.&nbsp; So what operators are available?

<table border="1">
<tbody>
<tr>
<td>= (equals)</td>
<td>String, Int, Enum, Date, Bool</td></tr>
<tr>
<td>< (less than)</td>
<td>Int, Enum, Date</td></tr>
<tr>
<td><=</td>
<td>Int, Enum, Date</td></tr>
<tr>
<td>> (greater than)</td>
<td>Int, Enum, Date</td></tr>
<tr>
<td>>= </td>
<td>Int, Enum, Date</td></tr>
<tr>
<td>Under (Quickly match file specs)</td>
<td>String</td></tr>
<tr>
<td>Match (Regular Expression Match)</td>
<td>String</td></tr>
<tr>
<td>Like (Simple match)</td>
<td>String</td></tr></tbody></table>

Matching is pretty easy and all completed on the server side before the event is ever sent.&nbsp; What you really need to understand is each particular events schema.&nbsp; That events schema ultimately defines the actual event and what you have the ability to filter on.&nbsp; When TFS installs you can find the default schemas @ %ProgramFiles%\Microsoft Visual Studio 2005 Team Foundation Server\Web Services\Services\v1.0\Transforms.&nbsp; You can further create your own event types, but I will save that for another post.

This release of TfsAlert will actually publish the message you've received to the event log just so you can easily look at it.&nbsp; This will really help when you want to build some filter expressions.&nbsp; This can also be turned off by setting the _value_ attribute from 3 to 0.

> <span style="color: #0000ff"><</span><span style="color: #800000">switches</span><span style="color: #0000ff">></span>
> &nbsp; <span style="color: #0000ff"><</span><span style="color: #800000">add</span> <span style="color: #ff0000">name</span>=<span style="color: #0000ff">"General"</span> <span style="color: #ff0000">value</span>=<span style="color: #0000ff">"3"</span> <span style="color: #0000ff">/></span>
> <span style="color: #0000ff"></</span><span style="color: #800000">switches</span><span style="color: #0000ff">></span>

Want to dive deeper, all the eventing information you ever wanted to know can be found @ [http://msdn2.microsoft.com/en-us/library/aa398965.aspx](http://msdn2.microsoft.com/en-us/library/aa398965.aspx "http://msdn2.microsoft.com/en-us/library/aa398965.aspx")