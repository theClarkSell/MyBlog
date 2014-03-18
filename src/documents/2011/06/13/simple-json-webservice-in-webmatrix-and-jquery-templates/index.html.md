---
layout: post 
title: "Simple JSON WebService in WebMatrix and jQuery Templates"
subTitle: 
heroImageUrl: 
date: 2011-6-13
tags: ["jQuery","JSON","Template","Web","WebMatrix","WebServices"]
keywords: 
---

For me, it seems that today you just can't get very far in a web site without needing some kind of web service. I've spent a great deal of time in [WebMatrix](http://asp.net/webmatrix) over the past 6 months and as it turns out, it seems to be true in ASP.NET WebPages too. Now I have been involved with the SOA revolution for a very long time.&#160; I don't claim to be an expert, but I have sure built my far share of services that run a few rather large companies today. I say this because what I am about to write I am not sure I would ever use in production without serious testing.

Hopefully you're still reading at this point.

There is a jQuery plugin called templates: [http://api.jquery.com/category/plugins/templates/](http://api.jquery.com/category/plugins/templates/ "http://api.jquery.com/category/plugins/templates/"). Basically with this library you get to define "templates" more markup and then later use the API to merge the template with the data required. I love cars so my example will just revolve around that.&#160; Let's first define our overall markup. I just want to create a table of cars with two cells, Model and Year.&#160; Below is a simple table where my table body is empty and has an id of carListBody. The id is important because jQuery template will select based on that id later. 
  > <table width="600">      
> &#160;&#160;&#160; <thead>       
> &#160;&#160;&#160;&#160;&#160;&#160;&#160; <tr>       
> &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; <th>Model</th>       
> &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; <th>Year</th>       
> &#160;&#160;&#160;&#160;&#160;&#160;&#160; </tr>       
> &#160;&#160;&#160; </thead>       
> &#160;&#160;&#160; 
> &#160;&#160;&#160; <tbody id="**carListBody**"></tbody>       
> </table>  

With our markup defined now lets define the template.&#160; Equally as easy, we now create a simple little script block that has what we expect our markup filler to look like.&#160; You will see we are creating a row where the first cell will be Model and the second will be Year. I need to make sure it also has an id as I will be selecting it later by id later.
  > <script id="**carListTemplate**">       
> &#160;&#160;&#160; <tr>       
> &#160;&#160;&#160;&#160;&#160;&#160;&#160; <td>**${Model}**</td>       
> &#160;&#160;&#160;&#160;&#160;&#160;&#160; <td>**${Year}**</td>       
> &#160;&#160;&#160; </tr>       
> </script>  

Now we need data for the template and this is where the WebService comes in.&#160; In this example since I am using WebMatrix I will start with creating a new cshtml file in a new folder called services.&#160; That folder is just an organizational item where I will put my "services". My cshtml service is very simple. I am going to create some dummy data in a List and then use the built in JSON helper to encode that list as JSON.
  > @using System.Dynamic;
> 
> @{      
> &#160;&#160;&#160; **Layout = "";**       
> &#160;&#160;&#160; 
> &#160;&#160;&#160; List<Car> cars = new List<Car>();
> 
> &#160;&#160;&#160; for( int i = 0; i < 10; i++ ) {      
> &#160;&#160;&#160;&#160;&#160;&#160;&#160; cars.Add( new Car() { Model = "Chevy", Year = "200" + i.ToString() } );&#160;&#160;&#160; 
> &#160;&#160;&#160; }       
> &#160;&#160;&#160; 
> &#160;&#160;&#160; **Response.ContentType = "application/json";**       
> &#160;&#160;&#160; **Response.Write(<font style="background-color: #ffff00">Json.Encode(cars)</font>);**       
> &#160;&#160;&#160; 
> }  

Really nothing special. I first reset the Layout otherwise my Response would be a mixture of JSON and the default master page. Once I have my data I set the content type and write the response. The built in JSON helper will encode the List for me automatically. Looking at the JSON that is returned (below) that Object Literal will need to match the template we defined otherwise the two will not merge. Now I am not doing anything special with the encoder so the property names on the Car object just carry through to the resulting JSON.
  > [{"**Model**":"Pontiac","**Year**":"2000"},       
> {"**Model**":"Pontiac","**Year**":"2001"},       
> {"**Model**":"Pontiac","**Year**":"2002"}]  

Now we need to tie the two together. For this, I am going to make a simple ajax call to the service and retrieve it's results. Once I have those results, I will select the body using jQuery and for safety measures empty the contents. Then the magic happens. Select the Template, call the tmpl method passing in the results from the ajax call and append that to the tables body.
  > <script type="text/javascript">
> 
> &#160;&#160;&#160; $(document).ready( function () {      
> &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; 
> &#160;&#160;&#160;&#160;&#160;&#160;&#160; $.getJSON('services/models', function (modelsReturned) {       
> &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; **$('#carListBody').empty();**       
> &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; **$('#carListTemplate').tmpl(modelsReturned).appendTo('#carListBody');**       
> &#160;&#160;&#160;&#160;&#160;&#160;&#160; });       
> &#160;&#160;&#160;&#160;&#160;&#160;&#160; 
> &#160;&#160;&#160; });       
> &#160;&#160;&#160; 
> </script>  

The result:
  > <tbody id="carListBody">      
> &#160;&#160;&#160; <tr>       
> &#160;&#160;&#160;&#160;&#160;&#160;&#160; <td>Chevy</td>       
> &#160;&#160;&#160;&#160;&#160;&#160;&#160; <td>2000</td>       
> &#160;&#160;&#160; </tr>       
> &#160;&#160;&#160; <tr>       
> &#160;&#160;&#160;&#160;&#160;&#160;&#160; <td>Chevy</td>       
> &#160;&#160;&#160;&#160;&#160;&#160;&#160; <td>2001</td>       
> &#160;&#160;&#160; </tr>       
> &#160;&#160;&#160; ....       
> </tbody>  

That's it, jQuery, jQuery Templates, WebServices, JSON, AJAX and clearly separation of duty gives a pretty sexy little pattern to build template based items. 

Now having said all this, if you're doing anything with WebServices you should really check out the WCF stack and the new WebApi at [http://wcf.codeplex.com](http://wcf.codeplex.com). There is some excellent working going on there and&#160; they have simplified it greatly.&#160; As a follow up to this, I would love to see how you could leverage the WebApi stack in WebMatrix.