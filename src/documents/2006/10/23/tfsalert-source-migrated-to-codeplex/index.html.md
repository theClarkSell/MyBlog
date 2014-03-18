---
layout: post 
title: "TfsAlert Source Migrated To CodePlex"
subTitle: 
heroImageUrl: 
date: 2006-10-23
tags: ["TFS Eventing","TfsAlert"]
keywords: 
---

This weekend I was hard at work tidying up the TfsAlert source base, fixing Vista breaking changes.&nbsp; This morning I finally migrated it to CodePlex.&nbsp; Right now we are actively working on the package for an initial&nbsp;release.&nbsp; We should have that released later this week.

If you download the source there are a few things to note.

There is one critical bug we are currently addressing.&nbsp; Right now if your network interface drops out and you are assigned a new IP we orphan that event subscription in TFS and don't get a chance to clean it up.