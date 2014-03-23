nav class: "nav", ->
  div class: "navbar navbar-default navbar-static-top navbar-left", ->
    a class: "navbar-brand", href: "/", ->
      div ->
        span 'Clark'
        span style: "font-weight: 100;", "Sell"

    button
      type: "button"
      class: "navbar-toggle"
      data:
        toggle: "collapse"
        target: ".navbar-collapse"
      ->
        span class: "icon-bar" for i in [1..3]

  div class: "navbar navbar-default navbar-static-top navbar-right", ->
    div class: "collapse navbar-collapse", ->
      ul class: "nav navbar-nav", ->
        for document in @getCollection('pages').toJSON()
          li
            typeof: "sioc:Page"
            about: document.url
            class: ('active' if @document.url is document.url)
            ->
              a
                href: document.url
                property: "dc:title"
                document.title