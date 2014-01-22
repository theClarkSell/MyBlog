---
title: Articles
layout: page
pageOrder: 3
heroImageUrl: "/images/unsplash_desk.jpg"
---

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
		div class: "row", ->
			div class: "col-md-10 col-md-offset-2 text-muted", "Posted InTAGS"
			

		
		if document.tags
			div class: "row", ->
				p class: "col-md-10 col-md-offset-2", ->
					"posted in: "
					a href: @getTagUrl(tag)
		###



###
<% if document.tags?: %>
<div class="abstract-tags">
    Posted In: <%- ("<a href='#{@getTagUrl(tag)}'>#{tag}</a>" for tag in document.tags).join(', ') %>
</div>
###