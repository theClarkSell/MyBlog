---
layout: post 
title: "31 Days of Windows 8 | Day #8: Local and Roaming Data"
subTitle: 
heroImageUrl: 
date: 2012-11-08
tags: ["31 Days","localSettings","Roaming","roamingSettings","sotorage","temporaryFolder","Windows 8"]
keywords: 
---

This article is Day #8 in a series called [31 Days of Windows 8](http://31daysofwindows8.com/).&nbsp; Each of the articles in this series will be published for both [HTML5/JS](http://csell.net/category/windows-8/31-days/) and [XAML/C#](http://www.jeffblankenburg.com/category/31-days-of-windows-8/). You can find additional resources, downloads, and source code on our [website](http://www.31daysofwindows8.com/).

[![advertisementsample](advertisementsample1.png "advertisementsample")](http://www.31daysofwindows8.com/?day=8) 

* * *

In several of the articles in this series, we've mentioned that storing data is not only incredibly important, but also that it's easy to do, both locally to a device, as well as roaming across the many different devices a user may use.

[Microsoft offers us some specific guidance on when to use roaming vs. local storage](http://msdn.microsoft.com/en-us/library/windows/apps/hh465094.aspx), but I'll give you a quick summary here so that you've had a chance to read it (because we both know you didn't click that link).&nbsp; Again, these are guidelines, so you're not going to get denied from the store for breaking these rules, but there are also limits to data transfer size and speed.&nbsp; Exceeding those will prevent your app from actually roaming data for a period of time.

#### DO

*   **Use roaming for preferences and customization**.&nbsp; Any choice that a user is likely to make on each machine that they use should be roamed.&nbsp; These are basic settings, like color preferences, favorite actors, or whether or not to publish data to Twitter.  <li>**Use roaming to let users continue a task.**&nbsp; Having my browser favorites follow me around, or even my high scores is awesome.&nbsp; Allowing me to continue writing that email (or blog post) I never finished? Even better. 

#### DON'T

*   **Use roaming for information that is clearly local-only.**&nbsp; This includes things like file paths and other data that only makes sense to the local device.  <li>**Don't roam large datasets.**&nbsp; There is a quota, [which you can determine in code](http://msdn.microsoft.com/en-us/library/windows/apps/windows.storage.applicationdata.roamingstoragequota.aspx), that limits the size of your roaming dataset.&nbsp; It is best to only roam preferences and small data files, as we will show in this article.  <li>**Don't use roaming for instant synchronization or rapidly changing data.**&nbsp; Windows controls when and how often your app data will be roamed, so don't count on instant synchronization.&nbsp; Build a web service of your own if you need this kind of reliability.&nbsp; Also, don't update the roaming data constantly.&nbsp; For example, you don't need to roam the user's current location at all times, instead update it every minute or so.&nbsp; You'll still provide a rich experience without destroying your quota. 

One last thing to remember: the way data is roamed across devices is managed by the user's Microsoft account.&nbsp; If they log into two machines with the same account credentials, AND they install the same app in both places, THEN the roaming settings and files will travel.&nbsp; Until then, nothing happens.

Now that I've scared you into never using this, let's take a look at how it's done.&nbsp; There are two types of data that can be stored, and we will address each one of them both locally and roamed.&nbsp; First up is Settings, followed by Files.

## Local and Roaming Settings

When you hear the word "settings" in Windows 8 (or even Windows Phone) development, "small, simple data" is what should come to mind.&nbsp; We're really talking about storing name/value pairs.

Good examples of these are user preferences.&nbsp; Perhaps you stored the user's first name (a string value) so that you could address them as such in your game.&nbsp; Maybe they decided to turn off notifications (a boolean value) from your app.&nbsp; Settings are also one of the easiest ways to store data, and I've found myself on more than one occasion storing a great number of settings values in my applications. Because these are invisible values that live in an invisible data store, it might be good to wrap the usage of these with a nice CRUD pattern.&nbsp; 

To save this data locally we just leveraging the [Windows.Storage.ApplicationData](http://msdn.microsoft.com/en-us/library/windows/apps/windows.storage.applicationdata.aspx) object. To easily explore all of this let's just create the worst UI with a couple of input boxes and labels. We will just throw data into the input box and expect it to populate the label. As the app cycles we will save those values off to local storage. **I am begging you not to copy this UI**
<pre class="prettyprint"><div>
    <ul>
        <li>
            <input type="text" id="inputA"/> <label id="labelA"></label>
        </li>
        <li>
            <input type="text" id="inputB"/> <label id="labelB"></label>
        </li>
    </ul>
</div></pre>

Now that we have input. I am just going to create a couple of functions and wire up the changed event to our input box. When the changed event fires we will set the label. Nothing special and not really a real life scenario, but we're trying to prove a point here.
<pre class="prettyprint">....

function getDomElements() {
    _inputA = document.querySelector("#inputA");
    _labelA = document.querySelector("#labelA");
    _inputB = document.querySelector("#inputB");
    _labelB = document.querySelector("#labelB");
}

function wireUpHandlers() {
    _inputA.addEventListener("change", inputALeave);
    _inputB.addEventListener("change", inputBLeave);
}

function inputALeave() {
    _labelA.innerText += _inputA.value;
}

function inputBLeave() {
    _labelB.innerText += _inputB.value;
}

app.onready = function () {
    getDomElements();
    wireUpHandlers();
}

....</pre>

Again, just plumbing code and I even cut out some of it, like the variables. With the pipes now in place, now let's integrate local storage. For a brief moment lets assume that's a hella awesome UI which is actually some application data like your twitter handle and blog address. Hang with me, I promise awesome.

As a user I <strike>would</strike> should expect that things like this to carry with my app. Right now if I was to run it things would work as expected but the next time I would fire it up, I would have to re-enter all that. This makes little puppies extremely mad. To save the puppies, lets leverage that _ApplicaitonData_ object I mentioned earlier. I am going to create two new functions; get and save.&nbsp; Since _localSettings _is just key value pairs, we can easily just start adding whatever values we want.
<pre class="prettyprint">var _applicationData = Windows.Storage.ApplicationData.current;
var _localSettings = _applicationData.localSettings;

function saveLocal() {
    _localSettings.values["inputA"] = _inputA.value;
    _localSettings.values["inputB"] = _inputB.value;
}

function getLocal() {
    if (_localSettings.values.size > 0) {
        _inputA.value = _localSettings.values["inputA"];
        _inputB.value = _localSettings.values["inputB"];
    }
}</pre>

Easy enough. So now where do we call them from? First let's save and one of the proper places to do this in our friend PLM ( I promise we will cover it, but I am starting to think we should have moved it forward ).&nbsp; PLM has an event called [checkpoint](http://msdn.microsoft.com/en-us/library/windows/apps/br229839.aspx). [Checkpoint](http://msdn.microsoft.com/en-us/library/windows/apps/br229839.aspx) is actually already wired into the Visual Studio Templates so we will just put our call into the existing function.
<pre class="prettyprint">app.oncheckpoint = function (args) {
    saveLocal();
};</pre>

Run your app, drop some data in, and then kill it. If you running in the debugger you will notice that it still runs for a second or two. At some point [checkpoint](http://msdn.microsoft.com/en-us/library/windows/apps/br229839.aspx) will fire and a saving&nbsp; to local storage you will do. Next, get the data. Let's just call our getData function on [onReady](http://msdn.microsoft.com/en-us/library/windows/apps/br229844.aspx) which would look like this.
<pre class="prettyprint">app.onready = function () {
    getDomElements();
    wireUpHandlers();
    getLocal();
}</pre>

And like that your app just became a bit more awesome. We're saving some data.

## Roaming

I know what you're thinking. That was easy, I am sure this roaming thing will just be a pig. Let's change _localSettings _to _roamingSettings._
<pre class="prettyprint">var _localSettings = _applicationData.**_localSettings_**;

TO

var _localSettings = _applicationData.**_roamingSettings_**;</pre>

Yea that's it. What ever you do, please **DO NOT tell your boss**. That feature right there just put at least 120 hours back on your project. The way I see it, you now owe me a beer. 

Given what we have already put together, everything will work as expected. Deploy the app to two different machines, fire up one and make set the input boxes. Then when you fire up the other, those text boxes will receive those new values too. If the data that you're saving is under 8k, then that save <strike>will</strike> should happen right away, anything over will take longer.

Of course, there is the scenario where maybe you would like to be alerted on your other machine when the change happens. We can do so, by registering for the _datachanged_ event on _roamingSettings._
<pre class="prettyprint">_applicationData.addEventListener("datachanged", datachangeHandler);</pre>

I personally haven't seen the notification fire instantaneously but it does in fact fire. From our handler we can then do whatever we need to with out new updated data.

## - tip -

During the course of writing this, I wanted a way in that _datachanged _event hander to actually update the labels as well as my input boxes. I had already written handlers for the input boxes change event so I figured why not just fire them again. You may have caught in yesterday's sharing article I registered and fired some events off in the activation of the Sharing Target such that we didn't block activation. We did that using _WinJS.Application.addEventListener._
<pre class="prettyprint">WinJS.Application.addEventListener("forceA", inputALeave, false);</pre>

Once we register "forceA" if you will we can then later fire it.
<pre class="prettyprint">WinJS.Application.queueEvent({ type: "forceA" });</pre>

I thought it was pretty cool, maybe you will too.

## Staying Organized

The more "settings" you create having the ability to add a little organization to the process would be nice. Storage has something loosely called a "composite" which you can just think of as a bucket of settings.
<pre class="prettyprint">var composite = new Windows.Storage.ApplicationDataCompositeValue();
composite["setting-1"] = 1;
composite["setting-2"] = "string";

_localSettings.values["myComposite"] = composite;</pre>

There are also a couple of [helper methods](http://msdn.microsoft.com/en-us/library/windows/apps/xaml/br241587.aspx#methods) hanging off the [ApplicationData class](http://msdn.microsoft.com/en-us/library/windows/apps/windows.storage.applicationdata.aspx). They give you the ability to clear things out, signal event handlers and even set a version number on that data.

As you're building your apps, it's important to remember that all of this data, both settings and files, are sandboxed to your application.&nbsp; What this means is that when your application is uninstalled, all of the values are gone with it.&nbsp; This also means that when you're building an app that uses these values, and you want to start with a [greenfield](http://en.wikipedia.org/wiki/Greenfield_project) user experience, you might want to uninstall the app from your machine before testing it to get rid of any legacy values that may have been saved earlier.

<style type="text/css">

.csharpcode, .csharpcode pre
{
	font-size: small;
	color: black;
	font-family: consolas, "Courier New", courier, monospace;
	background-color: #ffffff;
	/*white-space: pre;*/
}
.csharpcode pre { margin: 0em; }
.csharpcode .rem { color: #008000; }
.csharpcode .kwrd { color: #0000ff; }
.csharpcode .str { color: #006080; }
.csharpcode .op { color: #0000c0; }
.csharpcode .preproc { color: #cc6633; }
.csharpcode .asp { background-color: #ffff00; }
.csharpcode .html { color: #800000; }
.csharpcode .attr { color: #ff0000; }
.csharpcode .alt 
{
	background-color: #f4f4f4;
	width: 100%;
	margin: 0em;
}
.csharpcode .lnum { color: #606060; }</style>

So we've taken a deep look at Settings, let's move on to files now.

## Local and Roaming Files

Files operate in a very similar way to settings, except that we are actually reading and writing the values to the hard drive, and I'll demonstrate that in this example as well.&nbsp; Like _loacalSetting_ and _roamingSettings_ we just need to create _temporaryFolder_.
<pre class="prettyprint">var _tempFolder = _applicationData.temporaryFolder;</pre>

Once we have our temp folder we can work with it much like anyone would expect. Below you will see I am grabbing the path WinRT is going to use, then I am using a promise to save, while always replacing the file if one exists. We don't have to specify folder locations, we don't even have to define a folder structure if we don't want to.
<pre class="prettyprint">function writeFile() {

    _filePath.innerText = _tempFolder.path;

    _tempFolder.createFileAsync("31DaysOfWindows8.txt",
        Windows.Storage.CreationCollisionOption.replaceExisting)
            .then(function (sampleFile) {
                var contents = JSON.stringify(_dataFile);

                return Windows.Storage.FileIO.writeTextAsync(sampleFile, contents);
            }).done(function () {
            });
}</pre>

In addition, you can look at your files as they are saved.&nbsp; Each application stores its files locally on the machine, and if you use a breakpoint, you can determine that location on your device.&nbsp; For instance, the file we created above was at path: 
<pre class="prettyprint">C:\Users\Clark\AppData\Local\Packages\53657140-d0da-4374-9606-b653e55dfd93_rhg4v0b7gygzg\TempState</pre>

Once you've created it, you can actually crack the folder open and see the contents, even open the files yourself. Otherwise, that's about it!&nbsp; Saving files, even large files, can be done this way.&nbsp; You only need to remember the file name that you gave them.&nbsp; The Windows 8 sandbox takes care of the rest.&nbsp; Please note that my example above actually only stores a local file, but that you use the EXACT same code (with a reference to ApplicationData.Current.RoamingFolder instead) for Roaming files.

As a reminder, roaming files will not transfer immediately, so don't expect the type of performance you've seen with Skydrive or DropBox's applications.&nbsp; Be mindful of the data quota, but otherwise, use this stuff extensively.&nbsp; 

## Summary

Settings and Files are a powerful tool in our Windows 8 development arsenal. It's easy to do, and makes your application so much cooler when it lights up multiple machines at once. To download all of the sample code from this article, click the icon below:

&nbsp;[![downloadHTML](downloadHTML3.png "downloadHTML")](https://github.com/csell5/31DaysOfWindows8/tree/master/source/HTML5/Day8-StorageAndRoaming)[![downloadTheTools](downloadTheTools3.png "downloadTheTools")](http://aka.ms/cta-4)

Tomorrow, we are going to discuss Live Tiles, and how we create both primary and secondary tiles, as well as how we update them.&nbsp; See you then!