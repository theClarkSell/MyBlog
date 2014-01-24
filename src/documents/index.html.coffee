---
layout: 'default'
title: 'Clark Sell'
subTitle: 'deep thoughts with a few spelling erros.'
heroImageUrl: "/images/headshotbw.jpg"
---

div class: "hero-unit text-center", ->
	p "I'm a proud husband, a father, a geek. I love to create; code, pixels, experiences and share them with others. I'm currently playing Program Manger at Microsoft. I founded an awesome conference, That Conference. Yes, That Conference. I wrench on old muscle cars and live in the great Midwest."
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
					

	div class: "col-md-3 col-md-offset-2 text-center", ->
		## Social Info
		div class: "row col-md-12", ->
			
			div class: "col-md-12", ->
				span class: "glyphicon glyphicon-user resizeIcon"
			
			h1 class: "col-md-12", ->
				"Get Social"
			
			p class: "col-md-12", ->
				"Bacon ipsum dolor sit amet frankfurter capicola fatback cow spare ribs. Chicken capicola turducken pork beef biltong ground round prosciutto swine shankle."

		## That Conference
		div class: "row col-md-12", ->
			h1 ->
				img src: "/images/tclogo.png"
			h2 "8/11 - 8/13"
			p ->
				"Bacon ipsum dolor sit amet frankfurter capicola fatback cow spare ribs. Chicken capicola turducken pork beef biltong ground round prosciutto swine shankle."

		## 31 Days
		div class: "row", ->
			
			div class: "col-md-12", ->
				span class: "glyphicon glyphicon-th-large resizeIcon"
			
			h3 class: "col-md-12", -> 
				"31 Days of Windows 8"
			
			p class: "col-md-12", -> 
				"Do you want to quickly learn how to build apps for Windows 8? I break it down for you from File New Project to publishing to the store."
			
			a class: "col-md-12 text-right", "get started...."
