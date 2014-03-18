---
layout: post 
title: "Using JavaScript's Strict Variant"
subTitle: 
heroImageUrl: 
date: 2011-8-5
tags: ["ECMA-262","IE10","JavaScript","JavaScript","Sprockets","Strict Mode","Web"]
keywords: 
---

In December of 2009 ECMA-262 v5 was released. That release introduced something called strict mode.

## The Strict Variant aka Strict Mode

The official ECMAScript specification defines the Strict Variant as such:
> The strict variant of the language excludes some specific syntactic and semantic features of the regular ECMAScript language and modifies the detailed semantics of some features. The strict variant also specifies additional error conditions that must be reported by throwing error exceptions in situations that are not specified as errors by the non-strict form of the language.<sub> 1</sub>
This is a good thing. We all know JavaScript has it's ugly parts as well as the amazing ones, strict is here to help us and start to setup us for the future. Unfortunately at this point not ever browser version supports ES5 and if it does it might not in it's entirety.

## Let's Use It

I'm sure at some point you've seen _undefined_ overridden from what you've expected.
> undefined = "foo";
Unfortunately this can happen because it isn't a reserved keyword. Yet at least. With strict mode enabled, doing something like setting undefined would would actually throw an exception.  Using it is really simple. It's an opt-in model, based on the scope of which it was placed. To opt in you add the string **"use strict".**
> "use strict";> 
> undefined = "foo";  //OH NO YOU DIDN'T!!

Running that in [IE10](http://ie.microsoft.com/testdrive/info/downloads/Default.html) would actually cause an exception. If you use the F12 Developer Tools and browse to the _Script _tab you will see the following:

> <span style="color: #ff0000;">SCRIPT5045: Assignment to read only properties not allowed in strict mode> 
> </span>localhost:65035, line 22 character 17
Strict mode is based on the scope of which it was placed.

"use strict"** **<span style="text-decoration: underline;">**has to be the first statement in that block otherwise it's ignored, c**</span>omments don't count.

Simple enough right. Now if your browser doesn't support it, then "use strict" is just treated as a string and strict mode is in fact not enabled.

## Compatibility

Since implementing strict mode is just a matter of adding the string _"use strict" _nothing should stop you from using it now. ***BUT* **before you do, make sure you don't go applying your strict viewpoints on others. As I stated earlier since strict is based on scope you could inadvertently apply strict mode to more than you expected.

How? Hypothetically let's say as part of your build\deployment process you do some kind of JavaScript file concatenation maybe for performance reasons. As part of that concatenation your scope could change.  Pretend I have two JavaScript files, stringConcat_bad.js and stringConcat_good.js.

Let's use [Sprockets](http://getsprockets.com/)<sub>10</sub> and look at the result after concatenation:

In this case I managed to disable strict mode based on how the files were merged together. You might in fact impost strict mode on someone OR you could in fact disable it. Your string concatenation result will vary of course but regardless following some best practices will go a lot way here.

## Devils in the details...

One of the things I didn't try to cover was all the cases that Strict Mode will check. On the [IE Testing Center](http://samples.msdn.microsoft.com/ietestcenter/#javascript), they currently have [52 Strict Mode tests listed](http://samples.msdn.microsoft.com/ietestcenter/Javascript/ES13.1.html) for you to run in whatever browser you prefer. Further more, you can actually view the source of the test too.

But wait there is more; [test262](http://test262.ecmascript.org/).
> "test262 is a test suite intended to check agreement between JavaScript implementations and the ECMA-262\. Specification (currently 5th Edition). The test suite contains thousands of individual tests, each of which tests some specific requirements of the ECMAScript specification." <sub>7</sub>
Now test262 will test all of JavaScript specification and so does IE Testing Center. I love to see testing suites like these. Not only do they give us developers to run a suite a test against all of the browsers thrown at us, but we also get to peer into the details of the test and see how it was written.

## References

1.  [ECMA-262 Language Specification](http://www.ecma-international.org/publications/standards/Ecma-262.htm), p. 4, 88, 235 of June 2011 v5.1, retrieved 2011 August 1
2.  [ECMAScript on Wikipedia](http://en.wikipedia.org/wiki/ECMAScript)
3.  [John Resig on ExmaScript 5 Strict Mode](http://ejohn.org/blog/ecmascript-5-strict-mode-json-and-more/)
4.  [Douglas Crockford - Strict Mode Is Coming To Town](http://www.yuiblog.com/blog/2010/12/14/strict-mode-is-coming-to-town/)
5.  [IE Test Center](http://samples.msdn.microsoft.com/ietestcenter/)
6.  [IE Testing Center's Strict Mode Tests](http://samples.msdn.microsoft.com/ietestcenter/Javascript/ES13.1.html)
7.  [http://test262.ecmascript.org/](http://test262.ecmascript.org/)
8.  [https://developer.mozilla.org/en/JavaScript/Strict_mode](https://developer.mozilla.org/en/JavaScript/Strict_mode)
9.  [http://dmitrysoshnikov.com/ecmascript/es5-chapter-2-strict-mode/#introduction](http://dmitrysoshnikov.com/ecmascript/es5-chapter-2-strict-mode/#introduction)
10.  [GetSprockets JavaScript Concatenation](http://getsprockets.com/)
11.  [Install Ruby on Windows](http://rubyinstaller.org/)