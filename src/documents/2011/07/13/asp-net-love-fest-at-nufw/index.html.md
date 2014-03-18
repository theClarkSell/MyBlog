---
layout: post 
title: "ASP.NET Love Fest at NUFW"
subTitle: 
heroImageUrl: 
date: 2011-7-13
tags: ["ASP.NET","Community","IIS Express","MVC","NuGet","Razor","Scaffolding","Web","WebMatrix"]
keywords: 
---

Last night I had the opportunity to virtually present to the [NUFW users group](http://nufw.net/) on ASP.NET. Personally since .NET 4.0 released, it feels like the ASP.NET team has managed to push out a metric ton. 

When I speak about "**newer technologies**" my goal is pretty simple. Put a new tool(s) in your toolbox. It's unrealistic for me to think you might become an expert in less than 60 minutes, especially for something you might have never even heard of. When I am done, I want you to look into your tool box, and know I just put a new wrench in it. I want you to know what it's for and how it relates to you and your other tools. You will have seen me use it but now you really need to pick it up, see how it feels and start to understand how you can incorporate that into your daily life.&#160; Now if we had more time, depending on the context, it might be different.

And, yes I like car analogies.

I don't know about you but personally it's very easy for me to become overwhelmed by all of the new things being release in and around the web. Last night I attempted to string together a story that covered all of the following:

*   [WebMatrix](http://asp.net/webmatrix)*   WebDeploy*   Razor*   [NuGet](http://nuget.org/)*   Helpers*   ASP.NET Web Pages*   ASP.NET Web Forms*   ASP.NET MVC*   Some HTML5 Tooling*   MVC Scaffolding*   IIS Express  

Seriously, that is a lot of stuff?!?!! Ironically after having talked so much about it over the past 6 months I realize while the list is a lot of bullets those LEGO pieces all snap together really nicely. Last night we opened with WebMatrix. Since it's the newest and mostly has the most FUD around it, why not start there. What people most often don't realize is pretty much everything talked about in WebMatrix is transferable to something like MVC3\. WebMatrix is built on top of ASP.NET, in fact the project structure is just an [ASP.NET WebSite project](http://msdn.microsoft.com/en-us/library/dd547590.aspx). It uses SQL Compact, WebDeploy, Razor, IIS Express and so on. I love to teach things like Razor concepts ( such as [layout](http://www.asp.net/webmatrix/tutorials/3-creating-a-consistent-look) ) in WebMatrix. It's just simple and very fast. 

Once you realize it's all related in some way you might then ask, why should I care? Very valid. It's a compliment to Visual Studio and in fact you can take a WebMatrix Project and open it directly in Visual Studio. I personally like to show sites such as [this blog](http://csell.net) and our [WebCamps Site](http://crwebcamps.ms/) as examples of sites that I have chosen to build in WebMatrix as the primary editor. Having said that I did use Visual Studio for some of it as well. One is PHP and the other is ASP.NET. Both were done in less than two weeks. It's the simple, get things done approach where I might not care about some of ceremony of things. Don't get me wrong, I love MVC. [Developer Smackdown](http://developersmackdown.com/) is an MVC site and that was absolutely the right decision. Before jumping into MVC I like to finish showing Helpers, and the Open Source Integration.

When I start to talk about MVC, I like to start with a blank slate, just an empty project. From there I will install MVCScaffolding using NuGet and we build out a simple podcast site administration site. Since I run a podcast, you might see why I got this route. Once I have the site running I like to explain the following:

*   What just happened? Put a break point in the controller and talk through the call stack? Talk about the MVC implementation in ASP.NET
*   Talk about MVC vs WebForms vs WebPages
*   Talk through Scaffolding and how to use it and customize templates.
*   Look at the assets created with Scaffolding and compare that to what we build using WebMatrix
*   What is Routing and how does it work? How does it work compared to what we saw in WebMatrix?
*   How did EF create the DB without there being a DB?
*   Install other things through NuGet and see how that all fits together. Even show your own NuGet store.  

If you're overwhelmed, your not alone but it's not as daunting as it might appear. Just start building something to see how things work. I think it's a totally valid approach to start with a blank slate and use scaffolding to build out a shell site to see what happens. Here is a list of links and resources either mentioned last night or related to what we talked about:

*   [Web Forms: Reports of my Death are Greatly Exaggerated](http://channel9.msdn.com/events/MIX/MIX11/FRM15)&#160;*   [Introduction to WebMatrix](http://csell.net/2011/04/04/introduction-to-webmatrix-the-article/)*   [Moving your Web Application from WebMatrix to ASP.NET MVC 3](http://csell.net/2011/05/16/moving-your-web-app-from-webmatrix-to-asp-net-mvc-3/)*   [Microsoft Hosting Partners \ Providers](http://web.ms/hosting)*   [NuGet.org](http://nuget.org)*   [WebMatrix and Razor Documentation](http://asp.net/webmatrix)*   [Introducing WebFarm Framework](http://weblogs.asp.net/scottgu/archive/2010/09/08/introducing-the-microsoft-web-farm-framework.aspx)*   [OData](http://odata.org)*   [WCF WebAPI](http://wcf.codeplex.com/)*   [Some of the best documentation on Web Deploy](http://vishaljoshi.blogspot.com/)*   [IIS Express Overview](http://learn.iis.net/page.aspx/868/iis-express-overview/)*   [WebCamps](http://webcamps.ms/)*   [crWebCamps](http://crwebcamps.ms/)*   [Steve Sanderson](http://blog.stevensanderson.com/)
*   [Scott Hanselman](http://hanselman.com)
*   [Phil Haack](http://haacked.com/)
*   [David Ebbo](http://blog.davidebbo.com/)  

NuGet Packages I used:

*   [Twitter Helper](http://nuget.org/List/Packages/Twitter.Helper)*   [ie9.helper](http://nuget.org/List/Packages/IE9.Helper)*   [MVCScaffolding](http://nuget.org/List/Packages/MvcScaffolding)*   [EFCodeFirst.SqlServerCompact](http://nuget.org/List/Packages/EFCodeFirst.SqlServerCompact)*   [Elmah](http://nuget.org/List/Packages/elmah)*   [Disqus](http://nuget.org/List/Packages/Disqus.Helper)  

Where can you download the tooling:

*   [Microsoft Web Platform Installer](http://www.microsoft.com/web/downloads/platform.aspx) - almost everything below you can just download and install from this.*   [Microsoft WebMatrix](http://on.csell.net/wminstall)*   [Standalone IIS Express Download](http://www.microsoft.com/web/gallery/install.aspx?appid=IISExpress), also comes bundled with WebMatrix or the MVC 3 Update.*   [ASP.NET MVC 3](http://www.asp.net/mvc/mvc3), [download link](http://www.microsoft.com/web/gallery/install.aspx?appid=MVC3)*   [Visual Studio 2010 Service Pack](http://www.microsoft.com/download/en/details.aspx?id=23691)*   [Visual Studio MVC tooling update](http://haacked.com/archive/2011/04/12/introducing-asp-net-mvc-3-tools-update.aspx), [download link](http://www.microsoft.com/download/en/details.aspx?displaylang=en&id=1491)*   [Visual Studio Web Standards Update](http://www.hanselman.com/blog/AnnouncingTheWebStandardsUpdateHTML5SupportForTheVisualStudio2010Editor.aspx), [download link](http://visualstudiogallery.msdn.microsoft.com/a15c3ce9-f58f-42b7-8668-53f6cdc2cd83)  

My demo's are located at: [http://on.csell.net/mydemos](http://on.csell.net/mydemos)