---
layout: post 
title: "DeveloperSmackdown.com Musing #14"
subTitle: 
heroImageUrl: 
date: 2010-3-4
keywords: 
---

#### Is Your Robot Looking At My Hinie?

Mark and Clark talk about doing home automation using Z-Wave and MS Robotics Studio. Clark wants to turn his house into a robot and they talk about how to get started with home automation. Tips and tricks include quickly changing editor font size in Visual Studio 08 - great support for code demos. Woopra web site analytics are also discussed.

### Listen here -> [Play Now](http://www.podtrac.com/pts/redirect.mp3/DeveloperSmackdown.com/Services/PodcastServices.svc/GetPodcast/ds_014.mp3 "Play Now")

###    

* * *

#### Show Notes

#### 

##### Episode 14 - Home Automation

Clark has been researching home automation and wireless control.&#160; The 3 technologies we talk about are:

1.  [X-10](http://en.wikipedia.org/wiki/X10_%28industry_standard%29)2.  [Instinion](http://en.wikipedia.org/wiki/INSTEON)3.  [Z-Wave](http://en.wikipedia.org/wiki/Zwave)
        1.  Most Expensive2.  Newest of the 33.  Uses a control stick to transmit to the peer to peer Z-Wave network4.  Managed Z-wave .NET SDK available through [ControlThink](http://controlthink.com/)  

Mark has had some experience with [Microsoft Robotics Studio](http://www.microsoft.com/robotics/) so we talked about the possibility of using it to turn your house into a robot (home automation).

There are two main components that everything else is built upon. The [CCR (Concurrency and Control Runtime)](http://www.microsoft.com/robotics/) and the [DSS (Decentralized Software Services)](http://msdn.microsoft.com/en-us/library/bb483056.aspx). The CCR provides the base multi-threaded messaging system and the DSS manages the creation and communication of the services.

Example Robots/Controllers that I've played around with that can use the Robotics Studio:

*   [Lego NXT](http://mindstorms.lego.com/en-us/Default.aspx)*   [Robotics Connection](http://www.roboticsconnection.com/)*   [Tons of other possibilities](http://www.microsoft.com/robotics/default.aspx#FindPartner)  

##### Z-Wave Resources

*   [CocoonTech.com - Active Z-Wave Forum](http://www.cocoontech.com/portal/)*   [ControlThink.com](http://controlthink.com/) - Managed Library for creating .NET Z-Wave applications, USB Dongles,*   [ThinkEssentials](http://www.controlthink.com/thinkessentials/) (Z-Wave device control client - if you don't want to write your own software)*   [Leviton](http://www.leviton.com/) - Owns ControlThink, lighting controls, Forum*   [SmartHome.com](http://www.smarthome.com/_/index.aspx) - wide array of smarthome products*   [ASIHome.com](http://www.asihome.com/ASIshop/index.php) - Z-Wave Products  

##### Random Thoughts

Hopefully, there's a new and improved web site in the near future. One possibility is [Oxite](http://www.codeplex.com/oxite) which runs [VisitMIX](http://visitmix.com/) and [MicrosoftPDC.com](http://microsoftpdc.com/) web sites.

##### Tips and Tricks

Use simple key combinations to increase or decrease the font size in the Visual Studio 2008 editor. 

This is useful when giving demonstrations where you need to get down and dirty in the code. When you display your code, and need to quickly increase the font size for easier viewing then do these steps to set things up ahead of time:

In the menu, go to "Tools/Options.", then "Environment/Keyboard". In the "Show Commands Containing" textbox type in "FontSize" and you should see three entries in a selection box.

"DecreaseTextEditorFontSize" and "IncreaseTextEditorFontSize" are pretty obvious what they will do whereas "UpdateTextEditorFontSizeToMatchDisplayProperties" is a little obscure but it will reset the font size to its normal setting.

Click in the "Press shortcut keys:" textbox - you can then enter key combinations and assign them to the selected commands. For example, select/click on "IncreaseTextEditorFontSize", then click in the "Press shortcut keys:" textbox and type the Ctrl+Shift+UpArrow keys. Then when you click the "Assign" button it will save that combo. Do the same with "Decrease" and Ctrl+Shift+DownArrow. And then do the same with "Update.ToMatch" and Ctrl+Shift+RightArrow - or any combination you decide makes sense.

You will then be able to talk and quickly and easily increase/decrease the font size.

[Woopra](http://www.woopra.com/) - Website Analytics being used for [CSell.net](http://csell.net/), [MarkNic.net](http://marknic.net/) and [DeveloperSmackdown.com](http://developersmackdown.com/). Woopra offers a level of free tracking and analysis for web sites and web services.

Hey, let us know what you're thinking.&#160; Ideas, experiences, examples, questions, whatever!&#160; ping us at: [webmaster@developersmackdown.com](mailto:webmaster@developersmackdown.com)