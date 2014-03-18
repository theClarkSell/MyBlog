---
layout: post 
title: "TfsAlert and Security"
subTitle: 
heroImageUrl: 
date: 2006-11-5
tags: ["TfsAlert","VSTS"]
keywords: 
---

After releasing [TfsAlert](http://www.codeplex.com/Wiki/View.aspx?ProjectName=TfsAlert) 0.3.0.0 I realized I'd failed to mention how security works.&nbsp; BIG OPPS, Sorry!!!&nbsp; [TfsAlert](http://www.codeplex.com/Wiki/View.aspx?ProjectName=TfsAlert) will not get into the business of managing your user account.&nbsp; Windows already provides such a facility and&nbsp;I believe leveraging that is just a better&nbsp;more secure choice.&nbsp; However [TfsAlert](http://www.codeplex.com/Wiki/View.aspx?ProjectName=TfsAlert) will maintain knowledge about your TfsUserName.&nbsp; It does so to&nbsp;properly create the Tfs event subscription.&nbsp; Having said that you still need to properly authenticate just to subscribe, no different than any of the other Tfs tools.

So how do we manage security?&nbsp; Simple, we just add the _server\username \ password _into _Control Panel -> User Accounts -> Manage User Accounts -> Advanced -> Manage Passwords.&nbsp; _I do realize this may be shut down by a companies GPO but if not we have found this to work very nicely.&nbsp; If your one of those people ( like&nbsp;I ) who use multiple Tfs servers at a variety of locations you would always be prompted for your credentials just to start up the IDE.&nbsp; This all goes away once your account is loaded into that Windows facility.