---
layout: post 
title: "Crash Course on WCF Web API and SyndicationFeedFormatter"
subTitle: 
heroImageUrl: 
date: 2011-6-20
tags: ["DeveloperSmackdown","SyndicationFeedFormatter","wcf","Web","Web Api","Web Services"]
keywords: 
---

As you know [Mark](http://marknic.net) and I run a podcast called [Developer Smackdown](http://developersmackdown.com/). One of our driving goals was and still is to write the site from scratch and build everything around it. It's one of the things that I do to keep my skills fresh and real world. Our site started as MVC back in the early days and has gone through ever upgrade as well as converting all the views to Razor. There are a number of services and supporting utilities allowing us to do things like move mp3's around and orchestrate the post production process. While Developer Smackdown is certainly no [This Developer Life](http://thisdeveloperslife.com/) we still have a substantial loyal listener base and when things go bad ( which they do ) we hate it.

## Why Now?

A few weeks back the server I have hosted all of my sites on finally died. To be honest part of me was glad. I have personally maintained a set of physical servers since 1999 and if I am honest while I learned a lot it was a bigger headache that I realized. That isn't a knock against the technology stacks used, and while you might assume I just ran Windows and IIS I also ran Linux and Apache until about 2 years ago. The headache stemmed from all of the things I don't know. I enjoy development, not setting up AD, DHCP, LDAP, DNS, blaa blaa blaa. While my quasi datacenter did the job, it was quickly again and slowly dying. My main WebServer was an HP DL380 with 6 scsi drives. While things like storage and memory is much cheaper than it used to be, ski drives for servers are still expensive. On the flip side the windows hosting space is drastically cheaper than it used to be. I was already debating on a migration and when the drive died on me, my mind was made up. Time to move to a proper hosting provider.

## Getting Started

This should be no big deal right? It's just it's IIS to IIS, right?&#160; Copy some files, change DNS etc. Of course that didn't turn out to be the case. We have a series of services that do things like redirect you to the correct MP3 and supply the RSS feed. We had been using the [WCF Rest Starter Kit](http://www.asp.net/downloads/starter-kits/wcf-rest) for this but now suddenly the .svc extension didn't work. I spent a few hours looking into things before I gave up. I kept getting a 404 for some odd reason and finally in the middle of the night I just said screw it.&#160; We had just finished doing a [podcast with Glenn Block](http://developersmackdown.com/Archives/Show/47) about the new [WCF Web Api](http://wcf.codeplex.com/wikipage?title=WCF HTTP "WCF HTTP") and I said here is a perfect example to just bite the bullet and get upgraded. So I did. Installing is easy with [NuGet](http://nuget.org/):

<font color="#000000">**Install-Package WebApi.All**</font>

## Implementation?

My services are simple, I know that. Our main service is the RSS and ATOM feeds. To produce these we use a WCF object called **_SyndicationFeedFormatter_** in **_[System.ServiceModel.Syndication](http://msdn.microsoft.com/en-us/library/system.servicemodel.syndication.aspx)_**. There are two objects that implement that base class, **_Atom10FeedFormatter_** and **_Rss20FeedFormatter_**. With the WCF Rest Starter Kit we basically just created one of these objects and would return it in the feed. WCF took care of the rest. It looked similar to this:&#160; 
  > <pre class="code">[<span style="color: #2b91af">ServiceContract</span>]
> [<span style="color: #2b91af">ServiceKnownType</span>(<span style="color: blue">typeof</span>(<span style="color: #2b91af">Atom10FeedFormatter</span><<span style="color: #2b91af">PodcastFeed</span>>))]
> [<span style="color: #2b91af">ServiceKnownType</span>(<span style="color: blue">typeof</span>(<span style="color: #2b91af">Rss20FeedFormatter</span><<span style="color: #2b91af">PodcastFeed</span>>))]
> <span style="color: blue">public class </span><span style="color: #2b91af">PodcastServices
> </span>{
>     [<span style="color: #2b91af">OperationContract</span>]
>     [<span style="color: #2b91af">WebGet</span>(UriTemplate = <span style="color: #a31515">"GetFeed"</span>, BodyStyle = <span style="color: #2b91af">WebMessageBodyStyle</span>.Bare)]
>     <span style="color: blue">public </span><span style="color: #2b91af">SyndicationFeedFormatter </span>GetFeed()
>     {
>         <span style="color: #2b91af">PodcastFeed </span>feed = <span style="color: red">_feedRepository</span>.BuildFullFeed();
>         <span style="color: #2b91af">SyndicationFeedFormatter </span>formatter = <span style="color: blue">new </span><span style="color: #2b91af">Atom10FeedFormatter</span><<span style="color: #2b91af">PodcastFeed</span>>( feed );
>         <span style="color: blue">return </span>formatter;
>     }
> 
> }</pre>

Nothing special, mind you I cut some of the code for brevity purposes. When GetFeed is called we build up a few objects and then pass that object to the formatter that will ultimately be returned. WCF knew about the formatter and would format the object such that it was a valid RSS or ATOM feed and that was it.

BUT that now didn't work with Web Api. After talking some with Glenn he pointed me in a few directions. Since Web Api didn't have any knowledge about the formatter I was going to need to handle that explicitly and return it. At first I thought this was going to be a nightmare but it turned out to be nothing at all.

## New Implementation

After installing ( <font color="#000000">**Install-Package WebApi.All **) I had to rework the method a little differently, while the overall class declaration stayed the same.&#160; The new method now didn't require the [BodyStyle](http://msdn.microsoft.com/en-us/library/system.servicemodel.web.webgetattribute.bodystyle.aspx) for the [WebGet](http://msdn.microsoft.com/en-us/library/system.servicemodel.web.webgetattribute.aspx), sweet I like removing code. The bigger change was I was not going to return a HttpResponseMessage and take in a HttpRequestMessage, these are found in System.Net.Http.</font>

> <pre class="code">[<span style="color: #2b91af">ServiceContract</span>]
> [<span style="color: #2b91af">ServiceKnownType</span>(<span style="color: blue">typeof</span>(<span style="color: #2b91af">Atom10FeedFormatter</span><<span style="color: #2b91af">PodcastFeed</span>>))]
> [<span style="color: #2b91af">ServiceKnownType</span>(<span style="color: blue">typeof</span>(<span style="color: #2b91af">Rss20FeedFormatter</span><<span style="color: #2b91af">PodcastFeed</span>>))]
> <span style="color: blue">public class </span><span style="color: #2b91af">PodcastServices
> </span>{
>     [<span style="color: #2b91af">OperationContract</span>]
>     [<span style="color: #2b91af">WebGet</span>(UriTemplate = <span style="color: #a31515">"GetFeed"</span>)]
>     <span style="color: blue">public </span><span style="color: #2b91af">HttpResponseMessage </span>GetFeed(<span style="color: #2b91af">HttpRequestMessage </span>httpRequestMessage)
>     {
>         <span style="color: green">// Do Epic Here
>     </span>}
> }</pre>

The first thing to notice is I am now taking an HttpReqestMessage.&#160; This is something that Web Api is actually passing to us.&#160; In previous versions of WCF we would have to use WebOperationContext.Current.&#160; While that worked it made it very hard to do things like automated testing.&#160; Now we can actually create an HttpRequestMessage and pass it in yourself.&#160; Vey nice! As the method signature assumes we are going to take on the responsibility to create and return the response message.

> <pre class="code">[<span style="color: #2b91af">OperationContract</span>]
> [<span style="color: #2b91af">WebGet</span>(UriTemplate = <span style="color: #a31515">"GetFeed"</span>)]
> <span style="color: blue">public </span><span style="color: #2b91af">HttpResponseMessage </span>GetFeed(<span style="color: #2b91af">HttpRequestMessage </span>httpRequestMessage)
> {
>     <span style="color: green">// Get the Feed.
>     </span><span style="color: #2b91af">PodcastFeed </span>feed = <span style="color: red">_feedRepository</span>.BuildFullFeed();
> 
>     <span style="color: blue">string </span>query = <span style="color: #2b91af">HttpUtility</span>.ParseQueryString(httpRequestMessage.RequestUri.Query).Get(<span style="color: #a31515">"format"</span>);
> 
>     <span style="color: #2b91af">SyndicationFeedFormatter </span>formatter = <span style="color: blue">null</span>;
> 
>     <span style="color: blue">if </span>(<span style="color: blue">string</span>.Equals(query,
>                         <span style="color: #2b91af">Enum</span>.GetName(<span style="color: blue">typeof</span>(<span style="color: red">strings</span>.SyndicationFormats), <span style="color: red">strings</span>.SyndicationFormats.ATOM),
>                         <span style="color: #2b91af">StringComparison</span>.InvariantCultureIgnoreCase)) <span style="color: green">// "/?format=atom" )
>         </span>formatter = <span style="color: blue">new </span><span style="color: #2b91af">Atom10FeedFormatter</span><<span style="color: #2b91af">PodcastFeed</span>>(feed);
>     <span style="color: blue">else
>         </span>formatter = <span style="color: blue">new </span><span style="color: #2b91af">Rss20FeedFormatter</span><<span style="color: #2b91af">PodcastFeed</span>>(feed);
> 
>     <span style="color: blue">var </span>memoryStream = <span style="color: blue">new </span><span style="color: #2b91af">MemoryStream</span>();
> 
>     <span style="color: blue">var </span>settings = <span style="color: blue">new </span><span style="color: #2b91af">XmlWriterSettings</span>();
>     settings.Encoding = <span style="color: #2b91af">Encoding</span>.UTF8;
>     settings.ConformanceLevel = <span style="color: #2b91af">ConformanceLevel</span>.Document;
>     settings.Indent = <span style="color: blue">true</span>;
> 
>     <span style="color: blue">using </span>(<span style="color: blue">var </span>xmlWriter = <span style="color: #2b91af">XmlWriter</span>.Create(memoryStream, settings))
>     {
>         formatter.WriteTo(xmlWriter);
>         xmlWriter.Flush();
>         xmlWriter.Close();
>     }
> 
>     memoryStream.Seek(0, <span style="color: #2b91af">SeekOrigin</span>.Begin);
> 
>     <span style="color: #2b91af">HttpResponseMessage </span>httpResponseMessage = <span style="color: blue">new </span><span style="color: #2b91af">HttpResponseMessage</span>();
> 
>     httpResponseMessage.Content = <span style="color: blue">new </span><span style="color: #2b91af">StreamContent</span>(memoryStream);
>     httpResponseMessage.Content.Headers.ContentLength = memoryStream.Length;
> 
>     <span style="color: blue">return </span>httpResponseMessage;
> }</pre>

Basically start with building a feed. Once we have the feed we need to get some user input to figure out which formatter to use. The formatter actually has a WriteTo method on it, we can just have the formatter write to an XmlWrite in a MemoryStream. Then we just need to create the HttpResponseMessage of which we will return to the caller.&#160; The HttpResponseMessage has a Content property which is of course the Content. Content will take and object called StreamContent and we just need to give it the MemoryStream we created earlier. Next we just need to set some of the headers and return the message.

Now we have a service, but we need to wire it up. In our Global.asax.cs Application_Start we need to register a route. This route will map the url segment to the class which has our operations. You will also notice I am mapping the old url with the .svc extension just to make sure anyone using that url still works. 

> <pre class="code"><span style="color: #2b91af">RouteTable</span>.Routes.MapServiceRoute<<span style="color: #2b91af">PodcastServices</span>>(<span style="color: #a31515">"Services/PodcastServices.svc"</span>);
> <span style="color: #2b91af">RouteTable</span>.Routes.MapServiceRoute<<span style="color: #2b91af">PodcastServices</span>>(<span style="color: #a31515">"Services/PodcastServices"</span>);</pre>

That was it. I got to remove all of that old WCF configuration stuff. It just works. 

## More Information

*   Web Api Download: [http://nuget.org/List/Packages/WebApi.All](http://nuget.org/List/Packages/WebApi.All)
*   WCF on CodePlex: [http://wcf.codeplex.com/](http://wcf.codeplex.com/)
*   Developer Smackdown Podcast with Glenn: [http://developersmackdown.com/Archives/Show/47](http://developersmackdown.com/Archives/Show/47)
*   Genn's Blog:&#160; [http://blogs.msdn.com/b/gblock/](http://blogs.msdn.com/b/gblock/)