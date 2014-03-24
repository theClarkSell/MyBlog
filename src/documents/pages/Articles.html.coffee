---
title: Articles
layout: list
pageOrder: 4
heroImageUrl: "/images/unsplash_desk_crop.jpg"

---

div id: "articleSearch", class: "col-md-4 col-md-offset-8", ->
	@partial('search')

currentYear = ""

for document in @getCollection('posts').toJSON()
	date = @moment(document.date)
	year = date.format('YYYY')

	article class: "row articleList", ->
		div class: "row", ->
			if year != currentYear
				div class: "col-md-1", year
				currentYear = year
			else
				div class: "col-md-1", ""

			div class: "col-md-1", date.format("MMM D")
			div class: "col-md-10", ->
				a href: document.url, document.title

		div class: "row", ->
			p class: "col-md-10 col-md-offset-2", document.subTitle

###
div class: "pagination", ->
	ul ->
    	unless @hasPrevPage()
        	li class: "disabled", ->
            	span "prev" 
        else
			li -> 
        		a href: @getPrevPage(), ->
        			"prev"

		for pageNumber in [0..@document.page.count-1]
			if @document.page.number is pageNumber
				li class: "active", ->
					span pageNumber + 1
			else
				li ->
					a href: @getPageUrl(pageNumber), ->
						pageNumber + 1

		unless @hasNextPage()
			li class: "disabled", ->
				span "Next"
		else
			li ->
				a href: @getNextPage(), ->
					"Next"
###