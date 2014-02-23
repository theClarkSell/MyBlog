$ ->
	$.stellar
		verticalScrolling: true
		verticalOffset: 50
		horizontalOffset: 50
		#responsive: true
		scrollProperty: 'scroll'
		parallaxBackgrounds: true
		parallaxElements: false
	
	$('.post img').each ->	
		$el = $(this)
		$el.addClass('img-responsive center-block')


	$('pre code').each (index, element) ->
		$code = $(this)
		classes = $code.attr('class')?.split(' ')
		if classes? then for origClass in classes
			fixedClass = origClass.replace /^lang-/, 'language-'
			$code.removeClass(origClass).addClass(fixedClass) if fixedClass isnt origClass
		try
			hljs.highlightBlock(element)
		catch e
			# absorb any problems, usually with older browsers