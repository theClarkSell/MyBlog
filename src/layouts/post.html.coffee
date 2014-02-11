---
layout: default
---

article id: "post", class: "post", ->
  
  div class: "post-content container", 
    div class: "date text-muted text-right", ->
        @document.date.toDateString()
    div ->
      @content

  div id: "disqus", ->
    @partial('disqus')


  if @document.relatedDocuments and @document.relatedDocuments.length
    section id: "related", ->
      h3 "Related Posts"
      nav class: "linklist", ->
        ul ->
          for document in @document.relatedDocuments
            li ->
              span document.date.toDateString()
              text "&raquo;"
              a href: document.url, document.title