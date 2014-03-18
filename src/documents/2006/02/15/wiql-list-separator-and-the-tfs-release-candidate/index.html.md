---
layout: post 
title: "WIQL List Separator and the TFS Release Candidate"
subTitle: 
heroImageUrl: 
date: 2006-2-15
tags: ["VSTS"]
keywords: 
---

This past release of TFS brought us the much needed friendly names in the Team Foundation Client&nbsp;user drop down lists.&nbsp; Before that change, your WIQL query may have looked like this:

> <SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent"><SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent"><Wiql>
> &nbsp;&nbsp;&nbsp;&nbsp;SELECT [System.Id], [System.Title] 
> &nbsp;&nbsp;&nbsp;&nbsp;FROM WorkItems WHERE [System.TeamProject] <SPAN style="FONT-SIZE: 11px; COLOR: red; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">=</SPAN> @project 
> &nbsp;&nbsp;&nbsp;&nbsp;AND [System.AssignedTo] IN ('UserIdA', ''UserIdB') 
> &nbsp;&nbsp;&nbsp;&nbsp;ORDER BY [System.Id]
> </Wiql></SPAN></SPAN>

<SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent"><FONT face=Verdana color=#003300 size=2>As you can see we are searching for any Work Item assigned to UserIdA and UserIdB.&nbsp; The user list is delimited by a comma ( this will become important later ).&nbsp; After the release canidate release&nbsp;that same query may now look like the following:</FONT></SPAN>

> <SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent"><Wiql>
> &nbsp;&nbsp;&nbsp;&nbsp;...
> &nbsp;&nbsp;&nbsp;&nbsp;AND [System.AssignedTo] IN ('FirstNameUserA LastNameUserA', 'FirstNameUserB LastNameUserB')&nbsp;
> &nbsp;&nbsp;&nbsp;&nbsp;...
> </Wiql></SPAN>

<SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent"><FONT face=Verdana color=#003300 size=2>The only change to this query was the replacement of the alias with the users First Name Last Name.&nbsp; This query assumes&nbsp;your&nbsp;Active Directory&nbsp;is setup to display First Name Last&nbsp;Name rather than Last Name, First&nbsp;Name.&nbsp; If your Active Directory is setup like the latter then your query will look like:</FONT></SPAN>
<SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent">
> <SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent"><Wiql>
> &nbsp;&nbsp;&nbsp;&nbsp;...
> &nbsp;&nbsp;&nbsp;&nbsp;AND [System.AssignedTo] IN ('LastNameUserA, FirstNameUserA', 'LastNameUserB, FirstNameUserB')&nbsp;
> &nbsp;&nbsp;&nbsp;&nbsp;...
> </Wiql></SPAN>

<SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent"></SPAN><SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent"><FONT face=Verdana size=2>With that setup the name actually introduces a comma which invalidates the list separator.&nbsp; This query is now broken.&nbsp; All is not lost.&nbsp; </FONT></SPAN>

<SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent"><FONT face=Verdana size=2>We can change the List Separator from a comma to a semi colon. Control Panel -> Regional and Language Options -> Customize, on the numbers tab and you will find the List Separator setting.&nbsp; Do realize this change may adversely effect other applications which may use the List Separator.</FONT></SPAN>

<SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent"><FONT face=Verdana size=2></FONT></SPAN>&nbsp;

> </SPAN>![](CustomizeRegionalOptions.jpg)

&nbsp;

Your query will now change as follows:

> <SPAN style="FONT-SIZE: 11px; COLOR: black; FONT-FAMILY: Courier New; BACKGROUND-COLOR: transparent"><Wiql>
> &nbsp;&nbsp;&nbsp;&nbsp;...&nbsp;
> &nbsp;&nbsp;&nbsp;&nbsp;AND [System.AssignedTo] IN ('LastNameUserA, FirstNameUserA'; 'LastNameUserB, FirstNameUserB')&nbsp;
> &nbsp;&nbsp;&nbsp;&nbsp;...
> </Wiql></SPAN>