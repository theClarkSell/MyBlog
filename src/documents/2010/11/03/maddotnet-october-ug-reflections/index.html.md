---
layout: post 
title: "MADdotNET October UG Reflections"
subTitle: 
heroImageUrl: 
date: 2010-11-3
tags: ["asp.net","Community","Helpers","WebMatrix"]
keywords: 
---

The topic of conversation?  The state of the web.

Yep, it's November and I am going to talk about October. Shocking, right.  Clark is following up on something way to late. For that I do sincerely apologize.  Now onto the good news.  Not only will I follow up with what we talked about at the meeting but I will include some new things that has happened since.

First and foremost I finally am posting my demo's to a place people can grab them. They are now up at [BitBucket](http://bitbucket.org) @ [https://bitbucket.org/csell5/demos](http://bit.ly/csdemos "https://bitbucket.org/csell5/demos") I won't claim any type of quality or state they might be in, nor are they things that would ever be considered production ready. They are just demo's\spikes, which I use to facilitate conversation, and teach concepts.

"**Distributions Engines**" Honestly I can't come up with a better category for where to get STUFF.  Right now there are three places and they each compliment one another.

1.  [Microsoft's Web Platform Installer](http://www.microsoft.com/web/getstarted/) - This is where you get stuff that I would say is officially packaged for Windows.
2.  Visual Studio Extension Manager - This is where you get stuff to augment Visual Studio or your development experience.
3.  [NuGet](http://nuget.codeplex.com/) ( formally NuPack ) - This is where you get 3rd party libraries to develop against.[![](4420825483_7faeb18815_m.jpg)](http://asp.net/webmatrix)  

These three things are areas you should know intimately.

Honestly right now the fire hose is WIDE open.  I can't keep up with it.  If you look at the web space alone we have [Silverlight](http://silverlight.net) ( now 4 version ), [MVC](http://asp.net/mvc) now 3 versions, WebForms, [WebMatrix](http://asp.net/webmatrix), WebDeploy, new found collaboration with open source efforts like [JQuery](http://jquery.com) and [NuGet](http://nuget.codeplex.com) and a whole pile of other things. I have talked about the Lego pieces before. As developers we have a lot and if one was missing we know how to just build them.  Today it really feels like we are starting to see all the pieces naturally line up.

[**WebMatrix**](http://asp.net/webmatrix). Honestly since it's hit the streets I have been using it. Regardless of what anyone might say I think it has a place in our professional web developers life.  Go take a look at the new [DeveloperSmackdown](http://developersmackdown.com/).  I did all of my mock up in [WebMatrix](http://asp.net/webmatrix) and then ported it over to MVC3\. It has other applicability too, this was just one example.

As you might remember the upgrade scenario in [WebMatrix](http://asp.net/webmatrix) is to open your current [WebMatrix](http://asp.net/webmatrix) site as a WebSite project in Visual Studio.  While that works out of the box seamlessly I see things a bit different.  I personally think, when the time has come to "upgrade" you will need to go to MVC3 or above.  Now it's not as straight forward as opening your site but I think it just makes more sense.  Again just my humble opinion.  I will be blogging a lot more about that particular scenario and holding some 1 day workshops around the specific topic too.

[**WebMatrix**](http://asp.net/webmatrix)** Helpers.** There is also a notion of a "helper".  The whole premise is creating the ability to share nuggets\packages of code that allow you to quickly stand up a site.  Of course the underlying theme is fostering a community that will in fact create these over time.  Don't overthink it, helpers are nothing crazy. It's just code and it's code packaged such that it's easily reusable.  It's also not limited to [WebMatrix](http://asp.net/webmatrix). since it's just .NET there is really nothing stopping you from calling it ASP.NET.

If you browse to your local [WebMatrix](http://asp.net/webmatrix) site http:\\localhost\???\_admin you will prompted with a login. This will prompt you with a page to where you can automatically download and install helpers. Guess what is feeding that, NuGet. This is the list of helper ( that I know about ):

*   UrlShortener, [http://urlshortenerhelper.codeplex.com/](http://urlshortenerhelper.codeplex.com/ "http://urlshortenerhelper.codeplex.com/")
*   FaceBook, [http://www.jamessenior.com/2010/10/05/new-facebook-helpers-in-webmatrix-beta-2/](http://www.jamessenior.com/2010/10/05/new-facebook-helpers-in-webmatrix-beta-2/)
*   OData, [http://odatahelper.codeplex.com/](http://odatahelper.codeplex.com/ "http://odatahelper.codeplex.com/")
*   PayPal, [http://paypalhelper.codeplex.com/](http://paypalhelper.codeplex.com/)
*   Windows Azure Storage, [http://azurestoragehelper.codeplex.com/](http://azurestoragehelper.codeplex.com/ "http://azurestoragehelper.codeplex.com/")
*   Simple CMS, [http://simpleblogcms.codeplex.com/](http://simpleblogcms.codeplex.com/ "http://simpleblogcms.codeplex.com/")
*   Of course there is a slew of built in ones too.  

Here is a list of great WebMatrix resources:

*   [http://www.asp.net/webmatrix](http://www.asp.net/webmatrix "http://www.asp.net/webmatrix")
*   IIS Express, [http://learn.iis.net/page.aspx/860/using-iis-express/](http://learn.iis.net/page.aspx/860/using-iis-express/ "http://learn.iis.net/page.aspx/860/using-iis-express/")
*   WebCamp TV, [http://channel9.msdn.com/Shows/Web+Camps+TV](http://channel9.msdn.com/Shows/Web+Camps+TV "http://channel9.msdn.com/Shows/Web+Camps+TV")
*   James Senior, [http://www.jamessenior.com/](http://www.jamessenior.com/ "http://www.jamessenior.com/")  

**ASP.NET MVC 3.  **MVC3 is really shaping up to be a very cool release.  I am not going to go into much detail about it here since numerous others already have.  Check out the links below.

*   Phil Hack, [http://haacked.com](http://haacked.com)*   Scott Hanselmen, [http://www.hanselman.com/blog/](http://www.hanselman.com/blog/ "http://www.hanselman.com/blog/")
*   Scott Guthrie, [http://weblogs.asp.net/scottgu/](http://weblogs.asp.net/scottgu/ "http://weblogs.asp.net/scottgu/")
*   John Galloway, [http://weblogs.asp.net/jgalloway/](http://weblogs.asp.net/jgalloway/ "http://weblogs.asp.net/jgalloway/")
*   The Full Stack, [http://channel9.msdn.com/Series/The-Full-Stack](http://channel9.msdn.com/Series/The-Full-Stack "http://channel9.msdn.com/Series/The-Full-Stack")
*   Erik Porter, [http://erikporter.com/](http://erikporter.com/ "http://erikporter.com/")
*   Brandon Satrom, [http://userInexperience.com](http://userInexperience.com)  

**@Razor **is the new view engine \ syntax that is releasing with both WebMatrix and MVC3\. You can find out more here:[http://www.asp.net/webmatrix/tutorials/2-introduction-to-asp-net-web-programming-using-the-razor-syntax](http://www.asp.net/webmatrix/tutorials/2-introduction-to-asp-net-web-programming-using-the-razor-syntax "http://www.asp.net/webmatrix/tutorials/2-introduction-to-asp-net-web-programming-using-the-razor-syntax")

**WebDeploy**, this is our new web deployment engine. I will blog more about this in another post.

[**Web\Virtual Hosting**](http://www.microsoft.com/web/hosting/home)**.**  I think we can thank efforts like cloud computing for what is happening in this space.  If you have ever been to my little plot on earth you know I have a rack in my basement running 4 servers plus a bunch of other crap. You know what, it's time to turn some of that off, and maybe be a bit more green.  We launched a great section on our website that lists all of the different options there really are. Check it out: [http://web.ms/hosting](http://web.ms/hosting).

I was asked a great question after the meeting on this very topic. How do I choose? </scratching my head>  "Well it depends." Ok, that was a bit of a consulting answer but it really does.  With no context about what one needs how do you answer it? Personally, architect for the cloud and when it makes sense move to it.  I know that is easier said than done but you better know what is going on in that space.  Look "the cloud" ( and I am just going to talk about [Windows Azure](http://www.microsoft.com/windowsazure/) ) will ultimately be the way to scale better than anything else, but maybe you're not big enough to really afford it. Let's take a look at my podcast [http://DeveloperSmackdown.com](http://DeveloperSmackdown.com).  A year ago we started out of my house. Today we have had over 12k downloads and thousands of visitors to the site. While that number sounds big it's really not.  We also don't generate any revenue, although we are starting to look for sponsors if you're interested.  Remember that context pieces I mentioned?  We have always architected for a long term Azure solution but today we have a hybrid.  Our MP3's sit in Azure Blob storage while our web portion resides somewhere else.  Once traffic and sponsorship increase enough we will holistically move to Azure.  When that time comes the move will be painless.

At PDC there were a number of new announcements around Azure. I just want to highlight a couple, [a VM instance and an extra small compute instance](http://www.microsoft.com/windowsazure/compute/default.aspx). The Azure team also provides an [ROI calculator](http://www.microsoft.com/windowsazure/economics/default.aspx) to help you determine your potential costs.

**![](3346862563_e8016a1f90_o.jpg)Long live Silverlight**. Before I end I just want to quickly address one other topic, you guessed it, [Silverlight](http://silverlight.net).  It seems as if the media decided to stir up nonsense around [Silverlight](http://silverlight.net) vs. HTML5.  Simply put, it's not going anywhere.  More people are working on the [Silverlight](http://silverlight.net) team than ever. Hell we just launched our Phone with it. I quote the new [commercial REALLY](http://www.youtube.com/watch?v=EHlN21ebeak). I mean come on let's be honest.  HTML5 is great and it's here too, but both are going to have to play together. If you want to take full advantage of HTML5 you will need more than some little plugin, you need a new browser.  How many people are running IE6 still?  Exactly. Granted the people reading this won't but I think you get my point.  Let's also reflect on why things like [Silverlight](http://silverlight.net) and [Flash](http://en.wikipedia.org/wiki/Adobe_Flash) and why it exists at all. Well because the web standard just can't move fast enough.  How many releases of the html spec have there been since [Silverlight](http://silverlight.net) 1.0.  Exactly.  Now the bigger question is how do those Lego pieces all fit together. Well, all of us smart developers get to figure that out.

**Now, Go Code!**

* images courtesy of:

*   [http://www.flickr.com/photos/bouzafr/4420825483/](http://www.flickr.com/photos/bouzafr/4420825483/)
*   [http://www.flickr.com/photos/begley/3346862563/sizes/o/in/photostream/](http://www.flickr.com/photos/begley/3346862563/sizes/o/in/photostream/)