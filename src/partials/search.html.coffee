
form class: "hidden-xs", role: "search", action: "http://google.com/search", method: "get", ->
	div ->
		input type: "search", name: "q", class: "form-control", placeholder: "Search" 
		input type: "hidden", name: "q", value: "site:csell.net"
