---
layout: 'default'
title: 'the blog'
subTitle: 'deep thoughts with a few spelling erros.'
heroImageUrl: "/images/headshot-bw-crop.jpg"
---

div class: "hero-unit text-center", ->
	p "I'm a proud husband, a father, a geek. I love to create; code, pixels, experiences and share them with others. I'm a Product Manager at Telerik making developers even more awesome. I founded an awesome conference, That Conference. Yes, That Conference. I wrench on old muscle cars and live in the great Midwest."
	p "Regardless, I'm just a guy."

div class: "articleList", ->
	div class: "row", ->
		div class: "col-md-7", ->
			
			header ->
				h1 ->
					a href: "/pages/Articles", ->
						span class: "glyphicon glyphicon-align-left"
						" blog posts"

			article id: "articleSearch", ->
				@partial('search')

			for document in @getCollection('posts').toJSON().slice(0,5)
				article ->
					h3 -> 
						a href: document.url, document.title

					p document.subTitle
					p class: "text-right text-muted", ->
						em document.date.toDateString()
						

		aside class: "col-md-3 col-md-offset-2 text-center", ->
			## Social Info
			article ->	
			
				ul class: "list-inline", ->
					li ->	
						a href: "/feed/", -> 
							img class: "img-responsive resizeMe", src: "/icons/feed-icon.png"
					li ->
						a href: "http://twitter.com/csell5/", ->
							img class: "img-responsive resizeMe", src: "/icons/t-icon.png"
					li ->
						a href: "http://plus.google.com/+ClarkSell/", ->
							img class: "img-responsive resizeMe", src: "/icons/goog-icon.png"
					li ->
						a href: "http://github.com/csell5/", ->
							img class: "img-responsive resizeMe", src: "/icons/github-icon.png"


			## That Conference
			article ->
				div class: "imageAnchor", -> 
					a href: "http://thatconference.com", ->
						img class: "tcLogoResize", src: "/images/tcColorLogo.png"

				h1 "8/11 - 8/13"
				p "A polyglot developers geekdom for you and your little geekings."
				p "All in a giant waterpark."

				div class: "text-right", ->
					a href: "/pages/ThatConference", "learn more..."

			## 31 Days
			article ->
				
				div class: "imageAnchor", ->
					a href: "/pages/31DaysOfWindows8", ->
						span class: "glyphicon glyphicon-th-large resizeIcon"
				
				h3 "31 Days of Windows 8"
				
				p "Do you want to quickly learn how to build apps for Windows 8? I break it down for you from File New Project to publishing to the store."
				
				div class: "text-right", ->
					a href: "/pages/31DaysOfWindows8", "get started..."
