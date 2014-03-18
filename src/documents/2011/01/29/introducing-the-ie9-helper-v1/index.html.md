---
layout: post 
title: "Introducing the IE9.Helper V1"
subTitle: 
heroImageUrl: 
date: 2011-1-29
tags: ["Helpers","ie9","Web","WebMatrix"]
keywords: 
---

For those who want to skip the documentation part and get to the downloading:

&#160;

_**Why, Why Not.**_ The other day [Mark Nichols](http://MarkNic.com) and I were recording a [Developer Smackdown](http://developersmackdown.com/) podcast about ASP.NET Helpers when we had this idea. Why not make the new IE9 features so easy to add you don't even have to think about it?&#160; So we did, and the IE9.Helper was born.

**_Background_.** IE9 has a number of new developer features which are pretty neat. You can find the full list of features here:&#160; [http://msdn.microsoft.com/library/gg131029.aspx](http://msdn.microsoft.com/library/gg131029.aspx "http://msdn.microsoft.com/library/gg131029.aspx").&#160; We decided to pick off a few just to get started, specifically: **Site Pinning**, **Adding to the Start Menu**, **Dynamic Overlays**, **Window Activation**.

_**Goal.** _So you're sitting there asking yourself: this stuff wasn't hard in the first place. Your right it really isn't, but we figured we could make it even easier to incorporate it into your site. Maybe even just drop a line and be done. We didn't quite get there and I am *sure* there is room for improvement, so please let us know.

_**Installing.**_ Everything is packaged into a [NuGet](http://nuget.org/) package. The package will appear in both the standard feed as well as your [WebMatrix](http://asp.net/webmatrix) feed as the **IE9.Helper 1.0.0\. **The package installs 1 cshtml file into your app_code folder.&#160; The IE9.cshtml file contains all the helpers, functions and other goodness needed.
  > PM> **install-package IE9.Helper**  

_**Sample:** _We did create a simple sample site which has everything already wired up. You can find that download here: [http://ie9helper.codeplex.com/releases/view/59985](http://ie9helper.codeplex.com/releases/view/59985)

Now that we have the package installed, it's time to get going. You can break things down into three parts, **initialization**, calling the **helpers** and **identification**. 

_**_appStart.cshtml**._&#160; This is where we configure things.&#160; To be honest, this is the one place where I would like to clean things up. Yesterday we were too entrenched in the problem space so we left it for now. Here is the _appstart.cshtml from the sample project:
  > <pre class="code"><span style="background: yellow">@</span><span style="color: blue">using </span>System.Collections.Generic;> 
> <span style="background: yellow">@</span><span style="color: blue">using </span>System.Dynamic;> 
> 
> <span style="background: yellow">@{> 
> 
> </span>    <span style="color: blue">var </span>jumplistItems = <span style="color: blue">new </span><span style="color: #2b91af">List</span><<span style="color: blue">dynamic</span>>();> 
> 
> 		<span style="color: blue">dynamic </span>firstItem = <span style="color: blue">new </span><span style="color: #2b91af">ExpandoObject</span>();> 
> 		firstItem.Name = <span style="color: #a31515">"Page #1"</span>;  > 
> 		firstItem.Action = <span style="color: #a31515">"/Page1"</span>;  > 
> 		firstItem.Icon = <span style="color: #a31515">"./fav.ico"</span>;  > 
> 
> 		jumplistItems.Add( firstItem );> 
> 
> 		<span style="color: blue">dynamic </span>secondItem = <span style="color: blue">new </span><span style="color: #2b91af">ExpandoObject</span>();> 
> 		secondItem.Name = <span style="color: #a31515">"Page #2"</span>;  > 
> 		secondItem.Action = <span style="color: #a31515">"/page2"</span>;  > 
> 		secondItem.Icon = <span style="color: #a31515">"./green.ico"</span>;> 
> 
> 		jumplistItems.Add( secondItem );> 
> 
> 		<span style="color: blue">dynamic </span>thirdItem = <span style="color: blue">new </span><span style="color: #2b91af">ExpandoObject</span>();> 
> 		thirdItem.Name = <span style="color: #a31515">"Page #3"</span>;  > 
> 		thirdItem.Action = <span style="color: #a31515">"/page3"</span>;  > 
> 		thirdItem.Icon = <span style="color: #a31515">"./blue.ico"</span>;> 
> 
> 		jumplistItems.Add( thirdItem );> 
> 
> 		<span style="color: #2b91af">IE9</span>.Initialize(> 
> 				applicationName: <span style="color: #a31515">"ie9 helper demo"</span>,> 
> 				applicationColor: <span style="color: #a31515">"#FF8000"</span>,> 
> 				jumplistItems: jumplistItems> 
> 		); > 
> <span style="background: yellow">}> 
> </span></pre>

@##$%@#$ , WHAT! I thought you were making this easier? Point taken but lets break this down. At the bottom you see IE9.Initialize passing in three parameters. We will make the jumplistItems optional in the next release ( coming in the next day or so ).&#160; This is where we are setting the Application Name, Application Color and the Jumplist Items. The rest is where we are creating a List of dynamic items which will represent the Jumplist items in your pinned site.&#160; Each Item has a **Name**, **Action** ( or url ) and the **Icon** ( the icon .ico ) that will display on the side of the link.

**_Helpers._** With that out of the way lets get to using it. There are only two helpers, **AddJumpLists() **and **AddMetaTagsAndEvents(). **Why two? We we figured maybe there would be someone who didn't want to add JumpList items. If we turn out to be wrong, we will just combine them.&#160; You simply call these helpers like so:

> <pre class="code"><span style="color: black">@</span><span style="color: #232323">IE9.AddJumpLists()</span></pre>> 
> 
> 	<pre class="code"><span style="color: #232323"></span><span style="color: black">@</span><span style="color: #232323">IE9.AddMetaTagsAndEvents()</span></pre>

Now these two helpers you would** add into your <head> of your site**, typically in your master layout. In our sample, we created an optional section and implement that section in the page. ***I WOULDN'T DO THAT!* **We only did it in the sample so we were not jumping between pages.

**_Attribution Time_. **By calling the two helpers we've essentially added a bunch of jQuery functions and the IE9 meta tags.&#160; At this point we could start pinning the site but we don't have anything using those functions such that we could overlay an icon.&#160; Our jQuery functions will search for the following **4 class **names and implement their **click function**:

1.  ie9AddOverlay2.  ie9ClearOverlay3.  ie9AddToStart4.  ie9WindowActivate

Let's create a button that will add the site to the start menu:

> <pre class="code"><span style="color: blue"><</span><span style="color: maroon">button </span><span style="color: red">class</span><span style="color: blue">="ie9AddToStart"></span>Add to Start<span style="color: blue"></</span><span style="color: maroon">button</span><span style="color: blue">>> 
> </span></pre>

&#160;

**_ie9AddToStart_**, **_ie9ClearOverlay_**, **_ie9WindowActivate_** all work exactly the same. 

**_ie9AddOverlay_**, is a little different.&#160; Since overlays are really meant to be dynamic ( meaning I can overlay any ICO I want at anytime ), we need to do more than just implement the click event, we also need to know what ICO to overlay.&#160; HTML5 to the rescue. Below you see we have added the class ie9AddOverlay, but we also added a new attribute data-overlay. _Data-_ is an HTML5 attribute where we can quasi add our own custom element.&#160; So in our case **data-overlay** is where we pass the path to what icon we want to overlay.&#160; Then during our jQuery's click function we will read that attribute and overlay it.

> <pre class="code"><span style="color: blue"><</span><span style="color: maroon">a </span><span style="color: red">href</span><span style="color: blue">="/page2" </span><span style="color: red">class</span><span style="color: blue">="ie9AddOverlay" </span><span style="color: red">data-overlay</span><span style="color: blue">=./green.ico></span>goto page 2<span style="color: blue"></</span><span style="color: maroon">a</span><span style="color: blue">>> 
> </span></pre>

> 

> 

**_That's it._**&#160; We will be pushing another release in a day or so. Nothing really to big just some cleanup and more documentation. We would love any feedback you might have so please feel free to share.