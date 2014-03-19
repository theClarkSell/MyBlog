halfSize = (img) ->
	el = $(img)
	if el.height() == 0
		console.log('image h/w not available yet, waiting to load')
		setTimeout ->
			halfSize(img)
		, 500
		null
	else
		console.log('image loaded: ' + el.attr('src'))
		h = el.height()
		w = el.width()
		el.height(h/4.0)
		el.width(w/4.0)
		null

$ ->

	$.stellar
		verticalScrolling: true
		verticalOffset: 50
		horizontalOffset: 50
		#responsive: true
		scrollProperty: 'scroll'
		parallaxBackgrounds: true
		parallaxElements: false
	
	re = /.*@2x\..*/
	$('img').each ->	
		if re.test($(this).attr('src'))
			console.log('Found HiDPI Image: ' + $(this).attr('src'))
			halfSize(this)
			null

	$('.post img, .page img').each ->	
		$el = $(this)
		$el.addClass('img-responsive center-block imgSpace')

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