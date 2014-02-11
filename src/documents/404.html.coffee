---
layout: 'default'
title: 'Lost Page'
subTitle: "Whoops we managed to lose a page."
dynamic: false
---

div clas: "hero-unit", ->
  h1 "404: Page Not Found"
  p ->
    text "Ooops! It looks like the page you requested couldn't be found. I could have moved it."
    #code @req.url 
