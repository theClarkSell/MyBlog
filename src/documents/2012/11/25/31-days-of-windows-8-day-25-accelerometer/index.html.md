---
layout: post 
title: "31 Days of Windows 8 | Day #25: Accelerometer"
subTitle: 
heroImageUrl: 
date: 2012-11-25
tags: ["31 Days","Accelerometer","Sensors","Windows 8"]
keywords: 
---

This article is Day #25 in a series called [31 Days of Windows 8](http://31daysofwindows8.com/).&nbsp; Each of the articles in this series will be published for both [HTML5/JS](http://csell.net/category/windows-8/31-days/) and [XAML/C#](http://www.jeffblankenburg.com/category/31-days-of-windows-8/). You can find additional resources, downloads, and source code on our [website](http://www.31daysofwindows8.com/).

[![advertisementsample](advertisementsample8.png "advertisementsample")](http://31daysofwindows8.com/?day=25) 

Today, we are taking a look at another sensor that we might find in a Windows 8 device: the accelerometer.&nbsp; With the accelerometer, we can measure the movement of the user's machine. If you're looking for more information about what exactly an accelerometer is check out [this](http://en.wikipedia.org/wiki/Accelerometer). With an accelerometer we can do things like detect the orientation of the device and even sense if a device is falling.

The X axis runs horizontally across the device.&nbsp; The Y axis runs vertically across the device.&nbsp; The Z axis runs immediately through the device, from front to back.&nbsp; Here's an image to help illustrate, using a Windows Phone as the example (courtesy of [http://www.andybeaulieu.com/](http://www.andybeaulieu.com/)): <p>![25-Accelerometer](25Accelerometer.jpg "25-Accelerometer") <p>In simpler terms, we're measuring the g-forces applied to those three axes.&nbsp; Because of this, when we lay a Windows 8 tablet flat on a table, we get a Z axis value of -1, because there is one "g" (one unit of gravity) exerting itself on the negative size of the Z axis.&nbsp; In the same way, if we propped our device up (similar to the phone in the photo) so that the bottom of the device is sitting on the table, we would get a Y axis value of -1\. <p>Working with the accelerometer is very similar to working with the other sensors. Just a few simple steps and we're getting data.

*   Initialize the Sensor.  <li>If it's available,
        *   create a _readingchanged _event handler.  <li>create a shaken event handler <li>In the event handlers, grab the data from the sensor and write it to the screen. 

Here's my the entirety of my code and it looks scary similar to that of the other sensors. 
<pre class="prettyprint">var _x, _y, _z, _wasShaken;

    function onReadingChanged(e) {
        _x.innerText = e.reading.accelerationX;
        _y.innerText = e.reading.accelerationY;
        _z.innerText = e.reading.accelerationZ;
    }

    function onShaken(e) {
        _wasShaken.innerText = e.timestamp;
    }

    function getDomElements() {
        _x = document.querySelector("#x");
        _y = document.querySelector("#y");
        _z = document.querySelector("#z");
        _wasShaken = document.querySelector("#shaken");
    }

    function startAccelerometer() {
        var acc = Windows.Devices.Sensors.Accelerometer.getDefault()

        if (acc) {
            var minimumReportInterval = acc.minimumReportInterval;
            var reportInterval = minimumReportInterval > 16 ? minimumReportInterval : 25;
            acc.reportInterval = reportInterval;

            acc.addEventListener("readingchanged", onReadingChanged);
            acc.addEventListener("shaken", onShaken)
        }
    }

    app.onloaded = function () {
        getDomElements();
        startAccelerometer();
    }</pre>

Again, no real surprises here. We get to our data in the same basic was as we did with the other sensors.&nbsp; Now the accelerometer sensor did introduce a [new event called shaken](http://msdn.microsoft.com/en-us/library/windows/apps/windows.devices.sensors.accelerometer.shaken). This event fires when a user shakes their machine In writing this article I was using the original build tablet for testing. I shook the machine but sadly couldn't seem to get the event to fire. Just when I started to think I didn't have a sensor which supported that event, I'd tossed down the machine down onto the couch and all of the sudden it fired. Turns out, I just wasn't holding it right.

## Summary

Today we briefly looked at getting data from our accelerometer. Working with each of the different sensors is all very similar.&nbsp; Ultimately, how you use this data is where your real creativity comes in and I'm looking forward to hearing how you'll use it in your app.

If you'd like to download my working sample that uses the code from this article, click the icon below:

&nbsp;[![downloadHTML](downloadHTML20.png "downloadHTML")](https://github.com/csell5/31DaysOfWindows8/tree/master/source/HTML5/Day25-Accelerometer)

Tomorrow, we're going to look at the Gyrometer.&nbsp; See you then!

[![downloadTheTools](downloadTheTools20.png "downloadTheTools")](http://aka.ms/cta-4)