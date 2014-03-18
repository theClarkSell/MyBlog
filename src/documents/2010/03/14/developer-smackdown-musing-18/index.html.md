---
layout: post 
title: "Developer Smackdown Musing #18"
subTitle: 
heroImageUrl: 
date: 2010-3-14
tags: ["DeveloperSmackdown","mix","MVC","Silverlight"]
keywords: 
---

#### MIX10 - Live from MIX day 1

Today is the pre-conference sessions and we talk about the new Silverlight 4.0 capabilities and a little about ASP.Net MVC 2.0.

**Listen here -> [Play Now](http://www.podtrac.com/pts/redirect.mp3/DeveloperSmackdown.com/Services/PodcastServices.svc/GetPodcast/ds_018.mp3)**

#### Show Notes

##### [Silverlight](http://silverlight.net/) 4, New Features

This is a non-comprehensive but still big list of new features coming with Silverlight 4

*   Out of browser:&#160; Version 3 provides this capability BUT you were in a very restricted sandbox.&#160; In V4 you now have access to much more of the system resources which means you are in an elevated trust mode.
        *   Native Integration: means you can do COM interops.&#160; For example, from Silverlight, you could launch Excel, control it, pass data into it and retrieve data from it.*   Full Keyboard in full screen mode: Useful in kiosk applications*   File Access: Read/write to the file system*   Full File Path on Open/Save dialogs*   Cross Domain Capable: For example, if you want to interact withTwitter.&#160; In the past, you would have to do work arounds like creating intermediate services that you would interact with.&#160; Now you can go directly to Twitter and call the API's.*   Enhanced bound data validation:&#160; You can declaratively set up individual field validations as well as cross-field validations.&#160; There's a new ValidatesOnDataErrors property within a bound data entity that tells the framework to initiate a notify event when there's a validation error.*   More out of the box controls - too many to list here*   More out of the box media capabilities*   Socket-level programming
        *   UDP Multicasting*   TCP Streaming Sockets*   TCP WCF Capability using net.tcp protocol giving you WCF programming model and great performance*   Right-click: you can program against the right-mouse down and right-mouse up events so you can do things like context-menus instead of just getting the Silverlight configuration dialog*   Drop targets: you can build a Silverlight app to be a drop target so drag pictures from your file system into the app is possible*   MEF integration: You will be able to compose applications at runtime with the Managed Extensibility Framework  

There's more but even this list has a lot of great stuff.

##### ASP.Net MVC 2.0

As mentioned previously, ASP.Net MVC 2.0 has been RTM'd.&#160; So, you can go get it from the official web site [here](http://www.asp.net/mvc/).&#160; I sat in on a boot-camp session today but had to leave.&#160; The presenter was just not hitting on all cylinders and it got a little painful to watch.&#160; I came away with a couple tips before I had to bail though:

*   Go download and install the RTM release.&#160; You can get it [here](http://www.asp.net/mvc/).*   The old ASP.Net syntax of **<%= Html.Encode(item.Title) %>** has been deprecated.&#160; The new syntax is **<%: item.Title %>**.&#160; Not a huge change but definitely simpler.*   Use ViewModel's to interact with the data rather than straight up with the models themselves.&#160; This lets you provide only what is necessary to the view.*   Especially when working with VS2010/.NET 4.0 and interacting with databases, use Entity Framework to create the models.&#160; EF 4.0 is a definite improvement and works well with MVC (that includes working through ViewModels from the point above).  

If you want to use ASP.Net MVC 2.0 and need some training, there are several tutorials/videos out on the [site](http://www.asp.net/mvc/).

#### Resources:

*   [Silverlight.net](http://silverlight.net/)
*   [Silverlight.tv](http://channel9.msdn.com/shows/silverlighttv/)
*   [John Papa's web site (Silverlight)](http://johnpapa.net/)
*   [Mike Taulty's blog (Silverlight)](http://mtaulty.com/)
*   [ASP.Net MVC 2.0](http://www.asp.net/mvc/)