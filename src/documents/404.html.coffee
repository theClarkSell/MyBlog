---
layout: 'default'
title: '404 Not Found'
dynamic: false
---

div clas: "hero-unit", ->
  h1 "404 Not Found"
  p ->
    text "Ooops! It looks like the document you requested at "
    #code @req.url 
    text "couldn't be found."
