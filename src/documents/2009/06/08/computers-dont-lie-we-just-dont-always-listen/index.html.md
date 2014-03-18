---
layout: post 
title: "Computers don’t lie, we just don’t always listen"
subTitle: 
heroImageUrl: 
date: 2009-6-8
keywords: 
---

[![frustratedNerd](frustratedNerd_thumb.jpg "frustratedNerd")](http://csell.net/content/binary/WindowsLiveWriter/Computersdontliewejustdontlisten_9CF4/frustratedNerd_2.jpg)  

This past week I did one of those TFS restores to swap out hardware.&nbsp; Things went great except for SSRS.&nbsp; Who knows what went wrong but looking back, the journey to resolution was interesting.&nbsp; All to often we see the error and start to hunt and peck.&nbsp; Sometimes we end up down dead end roads other times we are just lucky.&nbsp; Reflecting back, hind sight is always 20/20.&nbsp; In this case the solution was somewhat obvious from the start.

Let the journey begin..

Stand alone TFS installations usually have 2 main IIS Web Sites.&nbsp; #1\. Default, which will include SharePoint and Reporting Services.&nbsp; #2\. Which is TFS.&nbsp; During the restore process I had a problem where _TfsAdminUtil.exe RestoreDT_ was actually having problems talking with SSRS.&nbsp; I kept getting the following:
  > .....
> 
> Exception Message: Client found response content type of 'text/html; charset=utf-8', but expected 'text/xml'.
> 
> .....
> 
> The file you are attempting to save or retrieve has been blocked from this Web site by the server administrators.&nbsp;&nbsp; 
> 
> .... 

Well after a while I just gave up and reconfigured TFS by hand.&nbsp; I knew that decision was going to bite me in the rear later on but at 2am with time running out, it was time to get-er-done. So once the rest of the restore was done I kicked off a new project creation and guess what, SAME &^%$^# ERROR...&nbsp; After some sleep it was time to hit it again.&nbsp; Looking back at the error what struck me as odd was the error seems to imply that SharePoint was getting the web request rather than SSRS.&nbsp; Sure enough after some digging around a bit more in IIS, IIS Logs, TFS it turned out my SSRS installation was actually instanced so instead of the normal [http://server/Reports](http://server/Reports), it was [http://server/Reports_TFS](http://server/Reports_TFS).&nbsp; Well that fix was easy, _tfsadminutil.exe configureConnections _did that.&nbsp; Re-ran "Create New Project" and it failed again but this time a bit farther down the stack.

This time the project creation wizard was saying it was looking for [http://server/reports](http://server/reports) still but everything was configured to be .../reports_tfs. I have no clue where that was coming from but my solution was to just reconfigure SSRS IIS apps to drop the notion of the instance.&nbsp; Re-Ran the Creation Wizard and now SSRS was hooped. The SSRS manager couldn't find the SSRS services.&nbsp; Well that must have meant somewhere in SSRS land it was in fact still pointed to .../Reports_TFS.&nbsp; Sure enough in the config file for SSRS the URL was there.&nbsp; Fixed that..

Re-Ran the Project Creation Wizard, Failed.&nbsp; At this point I was ready for a drink.&nbsp; Now SSRS was hooped trying to create db objects.&nbsp; Well it was trying to create db objects that were not on the new instanced SSRS installation.&nbsp; I searched around for a bit and said screw it.&nbsp; Lets just rename the db to remove the ...$tfs instance name and reconfigure SSRS to point at the new DB name.&nbsp; Once that was done.

&nbsp;
[![success](success_thumb.jpg "success")](http://csell.net/content/binary/WindowsLiveWriter/Computersdontliewejustdontlisten_9CF4/success_2.jpg)  

&nbsp;

Moral of the story, more often that not the that error we sometimes just ignore is always a great pointer.&nbsp; Just don't ignore it so fast.