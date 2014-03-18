---
layout: post 
title: "Setting up npm for node.js on Windows"
subTitle: 
heroImageUrl: 
date: 2011-10-20
tags: ["node.js","npm"]
keywords: 
---

LIKE OMG, I have [npm](http://npmjs.org) working on Windows!! Ok well someone else really smart actually did but I hit a few <strike>stumbling blocks</strike> learning opportunities. Package management systems are a *big deal*. [Gems](http://rubygems.org/) for Ruby, [NuGet](http://nuget.org/) for .NET and [npm](http://npmjs.org/) for [node.js](http://nodejs.org/). It's just makes everything so much easier.

To date, npm hasn't worked on Windows, until today ( ok, well at least for me ). This is something the node.js team has been working on for a while. My colleague [@brandonSatrom](http://twitter.com/brandonsatrom) ran across this little gem, [http://npmjs.org/doc/README.html#Installing-on-Windows-Experimental](http://npmjs.org/doc/README.html#Installing-on-Windows-Experimental). Simple enough right? Yes in fact but that still didn't work for me, or so I thought. Everything installed fine but packages would fail when you tried to install them.

Until today I have been "manually installing" npm packages and referencing them globally. This really mean I was downloading a zip or tar file, unpacking it, renaming it, then referencing it. My machine is setup like such:

*   _node.exe_ is at _c:\node\bin_. bin is actually important. it's a convention already in place and I just followed it.*   **_c:\node\bin\_** was added to my User Variable's _PATH_*   I put all of my node modules ( aka packages ) at **_c:\node\node_modules\_***   I created a new User Variable **_NODE_PATH_** ==== **_c:\node\node_modules\_***   More about_ NODE_PATH_ here: [http://nodejs.org/docs/v0.5.9/api/modules.html#loading_from_the_global_folders](http://nodejs.org/docs/v0.5.9/api/modules.html#loading_from_the_global_folders "http://nodejs.org/docs/v0.5.9/api/modules.html#loading_from_the_global_folders")  

Now after reading the doc's you will notice it's advised **not to** load modules globally. I never really wanted too, but the only way I could get my packages to load was to have a fully qualified path. YUCK. What I didn't realize was the convention for where the node modules should be placed. Those modules should live in a folder called _**node_modules. **_I had actually been calling it _lib_, what was I thinking.

**Side Note**. On Windows it appears that the _node_modules_ folder can live anywhere in the direct folder hierarchy and node will eventually crawl up the tree and find the reference.

What does this mean? The install worked just fine all along but **be careful where you're executing npm from**.&#160; At this point I could get rid of the NODE_PATH variable and the packages inside it, but I will keep it around just in case. I will be installing my node_modules alongside my apps.