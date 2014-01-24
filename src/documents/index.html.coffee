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
						" Articles"

			for document in @getCollection('posts').toJSON().slice(0,5)
				article class: "col-md-12", ->
					h3 -> 
						a href: document.url, document.title

					p document.subTitle
					h6 class: "text-right text-muted", ->
						em document.date.toDateString()
					

	div class: "col-md-3 col-md-offset-2", ->
		## Social Info
		div class: "row", ->
			header class: "col-md-12", ->
				h1 ->
					span class: "glyphicon glyphicon-user"
					" Get In Touch"

			article class: "col-md-12", ->
				h2 -> 
					a "hi there...."
				p "Bacon ipsum dolor sit amet frankfurter capicola fatback cow spare ribs. Chicken capicola turducken pork beef biltong ground round prosciutto swine shankle."

		## That Conference
		div class: "row", ->
			header class: "col-md-12", ->
				h1 ->
					img src: "/images/tclogo.png"
					" 8/11 - 8/13"

			article class: "col-md-12", ->
				p "Bacon ipsum dolor sit amet frankfurter capicola fatback cow spare ribs. Chicken capicola turducken pork beef biltong ground round prosciutto swine shankle."

		## 31 Days
		div class: "row", ->
			header class: "col-md-12", ->
				h1 ->
					span class: "glyphicon glyphicon-th-large"
					" 31 Days of Windows 8"

			article class: "col-md-12", ->
				h2 -> 
					a "hi there...."
				p "Bacon ipsum dolor sit amet frankfurter capicola fatback cow spare ribs. Chicken capicola turducken pork beef biltong ground round prosciutto swine shankle."