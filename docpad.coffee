# The DocPad Configuration File
# It is simply a CoffeeScript Object which is parsed by CSON
docpadConfig = {

	# =================================
	# Template Data
	# These are variables that will be accessible via our templates
	# To access one of these within our templates, refer to the FAQ: https://github.com/bevry/docpad/wiki/FAQ


	templateData:

		# Specify some site properties
		site:
			# The production url of our website
			url: "http://csell.net"

			# Here are some old site urls that you would like to redirect from
			oldUrls: [
				'www.csell.net',
			]

			# The default title of our website
			title: "Clark Sell"

			# The website description (for SEO)
			description: """
				Clark Sell's deep thoughts with a few spelling erros.
				"""

			# The website keywords (for SEO) separated by commas
			keywords: """
				Clark Sell, csell5, That Conference, 31 Days
				"""

			# The website author's name
			author: "Clark Sell"

			# The website author's email
			email: "clark.sell@csell.net"

			# Styles
			styles: [
				#"http://fonts.googleapis.com/css?family=Source+Code+Pro:200,400"
				"http://yandex.st/highlightjs/8.0/styles/default.min.css"

				"/styles/bootstrap.css"
				"/styles/style.css"
			]
			# Scripts
			scripts: [
				#"//cdnjs.cloudflare.com/ajax/libs/modernizr/2.6.2/modernizr.min.js"
				#"//code.jquery.com/jquery-2.1.0.min.js"
				#"//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"
				"http://yandex.st/highlightjs/8.0/highlight.min.js"

				"/scripts/modernizr.min.js"
				"/scripts/jquery-2.1.0.min.js"
				"/scripts/bootstrap.min.js"

				"/scripts/jquery.stellar.min.js"
				"/scripts/script.js"
			]



		# Discus.com settings
		disqusShortName: 'csell5'

		# -----------------------------
		# Helper Functions

		# Get the prepared site/document title
		# Often we would like to specify particular formatting to our page's title
		# we can apply that formatting here
		getPreparedTitle: ->
			# if we have a document title, then we should use that and suffix the site's title onto it
			if @document.title
				"#{@document.title} | #{@site.title}"
			# if our document does not have it's own title, then we should just use the site's title
			else
				@site.title

		# Get the prepared site/document description
		getPreparedDescription: ->
			# if we have a document description, then we should use that, otherwise use the site's description
			@document.subTitle or @site.description

		# Get the prepared site/document keywords
		getPreparedKeywords: ->
			# Merge the document keywords with the site keywords
			@site.keywords.concat(@document.keywords or []).join(', ')

		getPageUrlWithHostname: ->
			"#{@site.url}#{@document.url}"

		getJavascriptEncodedTitle: (title) ->
			title.replace("'", "\\'")

		moment: require('moment')


	# =================================
	# Collections
	# These are special collections that our website makes available to us

	collections:
		pages: (database) ->
			database.findAllLive({pageOrder: $exists: true}, [pageOrder:1,title:1])

		posts: (database) ->
			database.findAllLive({layout: 'post'}, [date: -1])

	# =================================
	# Plugins

	plugins:
		livereload:
            enabled: true
        cleanurls:
        	trailingSlashes: true

	# =================================
	# DocPad Events

	# Here we can define handlers for events that DocPad fires
	# You can find a full listing of events on the DocPad Wiki
	events:

		# Server Extend
		# Used to add our own custom routes to the server before the docpad routes are added
		serverExtend: (opts) ->
			# Extract the server from the options
			{server} = opts
			docpad = @docpad

			# As we are now running in an event,
			# ensure we are using the latest copy of the docpad configuraiton
			# and fetch our urls from it
			latestConfig = docpad.getConfig()
			oldUrls = latestConfig.templateData.site.oldUrls or []
			newUrl = latestConfig.templateData.site.url

			# Redirect any requests accessing one of our sites oldUrls to the new site url
			server.use (req,res,next) ->
				if req.headers.host in oldUrls
					res.redirect(newUrl+req.url, 301)
				else
					next()
}
# Export our DocPad Configuration
module.exports = docpadConfig
