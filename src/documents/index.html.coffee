---
layout: 'default'
title: 'Clark Sell'
subTitle: 'deep thoughts with a few spelling erros.'
heroImageUrl: "/images/headshotbw.jpg"
---

div class: "hero-unit text-center", ->
	p "I'm a proud husband, a father, a geek. I love to create; code, pixels, experiences and share them with others. I'm currently playing Program Manager at Microsoft. I founded an awesome conference, That Conference. Yes, That Conference. I wrench on old muscle cars and live in the great Midwest."
	p "Regardless, I'm just a guy."

div class: "row articleList", ->
	div class: "col-md-7", ->
		div class: "row", ->
			header class: "col-md-12", ->
				h1 ->
					div href: "/pages/Articles", ->
						span class: "glyphicon glyphicon-align-left"
						" blog posts"

			for document in @getCollection('posts').toJSON().slice(0,5)
				article class: "col-md-12", ->
					h3 -> 
						a href: document.url, document.title

					p document.subTitle
					h6 class: "text-right text-muted", ->
						em document.date.toDateString()
					

	div class: "col-md-3 col-md-offset-2 text-center home-sidebar", ->
		## Social Info
		article class: "row", ->	
		
			ul class: "list-inline", ->
				li ->	
					a href: "http://twitter.com", -> 
						img class: "img-responsive resizeMe", src: "/icons/rss.png"
				li ->
					a href: "http://twitter.com", ->
						img class: "img-responsive resizeMe", src: "/icons/t.png"
				li ->
					a href: "http://twitter.com", ->
						img class: "img-responsive resizeMe", src: "/icons/goog.png"
				li ->
					a href: "http://twitter.com", ->
						img class: "img-responsive resizeMe", src: "/icons/flick.png"

		## That Conference
		article class: "row", ->
			a href: "http://thatconference.com", ->
				img class: "tcLogoResize", src: "/images/tcColorLogo.png"

			h1 "8/11 - 8/13"
			p "A polyglot developers geekdom for you and your little geekings."
			p "All in a giant waterpark."

		## 31 Days
		article class: "row", ->
			
			div ->
				span class: "glyphicon glyphicon-th-large resizeIcon"
			
			h3 "31 Days of Windows 8"
			
			p "Do you want to quickly learn how to build apps for Windows 8? I break it down for you from File New Project to publishing to the store."
			
			div class: "text-right", ->
				a href: "/pages/31DaysOfWindows8", "get started...."
