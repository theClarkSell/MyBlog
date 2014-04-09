	header id: "siteHeader", class: "img-responsive", style: "background-image: url(" + ( @document.heroImageUrl or '/images/unsplash_woods_crop.jpg' )+ ");", ->
  
  	div ->
    	@partial('nav')

  	div class: "jumbotron", ->
    	div class: "container", ->
      	h1 @document.title
      	p @document.subTitle or ''
