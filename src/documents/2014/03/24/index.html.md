
---
"layout": "post"
"title": "I have a new blog and no it's not Ghost"
"subTitle": "Why I decided to go file, new project and start all over with blogging."
"date": "2014-3-24"
"heroImageUrl": "/XXX"
"tags": ['Blog', 'Docpad']
"keywords": []

isDraft: true
---

I just dropped one big atomic bomb on what I have called my blog. Why you ask? What did I do? How did you do it? 

> Well, file, new project. What else?

Before I drop into the awesome, I want to set some context, maybe even state my current position. To date my blogging journey has been a less than stellar one. It's not for lack of trying ( ok maybe at times ) but something has always been off and because of that, my "performance" in this space has indeed reflected that.

Like you, I have a day job, a family, hobbies and find great comfort in a good nights sleep. I am not a writer, hell to be honest it's really hard for me. But I want to share, contribute, and further more document the awesome that is our industry. 

Now some of you might say, "your old blog looked just fine". I guess. It was WordPress. I had LiveWriter integration and I even went to the trouble of buying a nice little template. I could do all that bloggers need to do but yet last year I managed to only write one blog post. Somewhere in there I managed to realize why. Short story, it was the tools, my experience. Not so much WordPress but really my editing surface and in the end the blog didn't reflect who I really am. After all it was a template and if you know me I'm far from a template. It was also around this time I also really discovered Markdown and programs like iA Writer. All in all, I managed to find a few tools that took the bullshit out of writing and just let me write words, maybe even well enough to express myself.

So I tried to use things like iA Writer, compose a post, convert to html, drop into whatever, save, post, check, blaa, blaa. It just became more trouble that I really wanted to spend and honestly took all the fun out of sharing which is really the point of blogging in the first place.

This is where I set out to to design a new blog, a new surface, a new place to call [csell.net](http://csell.net). If that meant writing a new platform, I was buckled up ready to do just that. I wanted something that represented who I was, yet let me use the tools I wanted too. Like any customer I have requirements and a vision of where it should go someday. In fact I wanted more than just some blog although that was in fact the biggest feature. And hellI wanted my authoring experience and publishing experience to be something that I enjoyed, remember this is hard for me. And so, the wheels began turning.

* My blog needed to be fast, like super duper, holy batman fast. I want you to enjoy your experience as much I did trying to create it. After all we're just talking about text, images, right? Seems like the browsers of today should be able to do this rather well.
* I wanted to write in Markdown and in any platform, but really OSX and Windows. Accessible everywhere.
* I wanted it "backed up". I just don't want to worry about 503s, did the job run etc. Since I'm a developer backed up for me means??? Source control, what else?
* I wanted extreme control over my layout, views, my experience. Its the place I call home, it should reflect me and I shouldn't need to be bound to anyone particular thing.
* I wanted to celebrate typography, simplicity, information sharing not ads or crappy sidebars. 
* And lastly, it has to be bat shit easy. If it's not, I just won't do it.

# Enter Ghost.

Ghost is awesome. I was sold, in fact I was all in and excited to take the plunge but in the back of my mind it still felt heavy. I could have made Ghost work but in reality I was just getting a newer WordPress. When I say that, I don't want to put down what the guys one Ghost are doing. In fact I support in a big way and want to see them more successful than WordPress but in the end I decided it wasn't for me.

Why? Well my requirements don't reflect, databases, dynamic data, plugins and whatever say you. I wanted clean, simple, fast. I wanted to push to github and poof somewhere down the interwebs a site was updated. 

# Enter DocPad.

A colleague of mine turned me onto something called DocPad. In short, a Node.js app walks over a set of pre-processors taking your thing and generating a static site. **Static say you?** In my case, this means, Stylus, CoffeeScript, CoffeeKup, Eco, Markdown and I am sure a few other bits of hipster awesome. In the end, DocPad takes the angle brackets I've created and generates a bunch of html that I look to the cloud to serve up to the world.

> Whoa what? Really, A static blog?

This whole static bit took me a bit to be ok with. For over a decade my career has been spent trying to make servers serve the peeps, the best way they could. Now I feel like I am running back to my college final where I'm creating some static website. Then it hit me, given my requirements I just don't need all that cruft. I don't need some CMS and look I understand the ole angle brackets. At the end of the day my blog might change 365 days out of the year and given past performance, I don't think that will in fact happen. This is all static. There is no reason I can't use the power of the cloud to just regenerate my experience, shove it out on some cloud and hope a few people stumble upon it. Ok, truth be told, JavaScript in the browser has become awesome and we have loads of services we can use by making simple http calls.

# Let's talk DocPad.

Huge props to XXX for putting this together. It's simplicity is it's sheer awesome sauce. I know there are other frameworks similar but I needed to look no further. 

In getting started I did like most. I went out to [DocPad](http://docpad.com) and started to follow XXX documentation. For me this meant jumping into node.js, running DocPad and picking out my poison. As I alluded to before this meant, CoffeeScript, CoffeeKup, Stylus, Eco, Markdown, etc. DocPad walks you through this, then leaves you with a CLI to run, generate, and debug things. So as fast as NPM could run, I had DocPad installed, and a shell site created and running locally. I was off to the races.

# My Inspiration

With the framework in place it was time to start creating. Over the past few years I have really started to get into design. I've always been amazed by typography and the sheer elegance of the meaning and emotion it conveys. I want the sites typography to convey an experience. I also wanted things, simple. It should just work. The information should be apparent and you should be able to easily get to where you needed to be. Hell if I am going to go to all of this trouble to create content, then I have a responsibility to keep the house clean and not cluttered.

Like anyone good designer I created a board of things that I liked. This was images, typography, gutter spacing, headers, whatever. They we're just little pieces of the internet that I liked.

In the end there were three sites that managed to catch my eye and push me into banging angle brackets. 

* XXX
* XXX
* XXX

What did I like?

* The header. I love pictures and I wanted each post to be represent by an image which expressed the highest level meaning. Some call this the "hero" image, but I think it's just a nice way to bridge some of the things we've seen in print for many decades to that of the digital world.

* Spacing. I don't want you or even me to feel overwhelmed when use the site. This means things like a nice line height, appropriate gutters, and intention. 

* Typography. Simple, clean and something you could easily read. 

To be clear these areas are not done either. I think I have the spacing about right. The header isn't where I want it and I can do more with typography. 

# What I spent a great deal of time on.

Overall, I spent the most of my time on the layout.


# What's left?

Plenty.

I have been working on this on and off for the past few months. it shouldn't have taken this long but life and [That Conference](http://ThatConference.com) have just been out in front. I was nudged the other day and decided enough was enough and got things to a place where I could flip the dns and start enjoying things.

I've got things to clean up. I need to spend some time thinking about how I could pre-publish posts. This rarely happens, so it's not high on the backlog. Remember this whole thing is static, so things like the rss feed, the article list aren't created on the fly. 

Right now, I'm not the craziest about generation. It seems as if, my entire site will regenerate even when I just change a post on the outer most leaf of the tree. There has been some talk about this in the DocPad community but I haven't had a chance to really dive into it. It seems like it shouldn't do that unless I change higher level artifacts. Why does this matter? For me right now it doesn't really as I don't have but a few hundred articles. But it still does take a few minutes to generate and pegs the server when doing so. This causes some weirdness with things like autoscaling. You see since were now static, the site uses 0 CPU. We're just handing off files to requests. The only time I use CPU is when push to github, which triggers Microsoft's Azure, which in turn kicks off Kudo, which kicks off node.js, running DocPad to generate the site that is copied to a Azure Website. 

Did you catch all that? Let me break it down:

1. Push chages to GitHub
2. GitHub trigger to Azure
3. Azure runs a kodu script, Thanks Eval XXXX for that.
4. Script runs node.js, which in turn runs DocPad
5. Script copies the output to Azure WebSites

It's at that point where my autoscaling kicks off, throws another server on the barbie and until things are done. 

The easier stuff:

* I have a few pages which just need to get finished. That Conference and 31 Days at the least. I would really like to somehow capture the different projects that I have worked on and give them an index.

* Page my article list by year. Right now I just have a long(ish) of articles.

* Understand tags. I have them but I am not doing anything with them. I am not even sold at this point if I should? I might look for a different way to surface that kind of information.

* Clean up all my content from LiveWriter. As web developers we always complain about how we have to deal with the differences in browsers, well I have the opposite here. I now have to go back through it all and clean things like missing tags. It sure looked right in the browser but the WYSIWYG editors just flat fall down when you really dig into the output.

# Go Create

Lastly, it's in [github](http://github.com/csell5/myblog). Don't fork. Create! Make it your own. Please take a look at what I did and jumpstart your efforts. Maybe I can bootstrap your creative side and help explain a few things along the way.

To XX and the DocPad community, thank you. I hope to contribute in someway, someday. Maybe this marks the first. I do have a few more follow up posts where I would love to document a few different things that I solved in DocPad. Not problems with DocPad but scenarios where I did something a bit different.

Big thanks to Jason Young, Eval XXX for putting their blogs out there and letting me peak into some of this things they did. Jason's WordPress export to Markdown is how

You can see my fork of that here:

This is at least my first blog post of the new me.

~ Clark
