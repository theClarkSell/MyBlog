---
layout: 'default'
title: 'my blog'
subTitle: 'my thoughts with a few spelling erros.'
heroImageUrl: "/images/headshotbw.jpg"
---

div class: "hero-unit text-center", ->
	h1 "Hi, My Name is Clark!"
	p "I'm a developer advocate and program manager for Microsoft DPE based in Illinois. A Chicago native who can’t spell, Clark as a kid actually made his money building cars, getting grease under his nails. That art of building would later lead him to software development where he drinks the Web and Mobile Development Kool-Aid. At Microsoft, Clark spends his days working with Global ISVs helping them deliver their top products leveraging Windows 8, Windows Phone and Windows Azure. As of that wasn’t enough, Clark is the co-founder of a polyglot software development conference called That Conference http://ThatConference.com. You can check out his blog at http://csell.net or find his family cruising around in their 1968 Camaro SS."

div class: "row", ->
	div class: "col-md-6", ->
		div class: "row", ->
			header class: "col-md-12", ->
				h1 ->
					a href: "/pages/Articles", ->
						span class: "glyphicon glyphicon-align-left"
						" Articles"

			for document in @getCollection('posts').toJSON().slice(0,5)
				article class: "col-md-12", ->
					h3 -> 
						a href: document.url, document.title

					p document.subTitle
					p class: "text-right text-muted", document.date.toDateString()

	div class: "col-md-5 col-md-offset-1", ->
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