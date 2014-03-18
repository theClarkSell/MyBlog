---
layout: post 
title: "SVN missed the boat"
subTitle: 
heroImageUrl: 
date: 2005-6-9
keywords: 
---

Let me start by saying I just love [<FONT color=#667755>Subversion </FONT>](http://tortoisesvn.tigris.org/)( SVN ). When it comes to source control there are many different products to choose from, VSS, CVS, Sourcegear Vault, Perforce, Microsoft VSTS just to name a few. They all have their pros and cons and until last night I swore by SVN. Like I said before, I love SVN. These guys really deserve a great deal of credit. SVN is free and it functionality meets the needs of a great SCC repo. When I looked to pick my personal SCC repo, I looked for the obvious things like commit, update, delete, etc and on top of that I look for things like :

<LI>Easy of maintenance 
<LI>Fast 
<LI>Simple interface ( example : [<FONT color=#667755>TortoiseSVN</FONT>](http://tortoisesvn.tigris.org/) or [<FONT color=#667755>TortoiseCVS</FONT>](http://www.tortoisecvs.org/) ) 
<LI>Reliable 
<LI>Secure 
<LI>Access from anywhere 
<LI>Built on a DB rather than a filesystem 

I setup a small repo with SVN and was in awe. I don't think I spent more that 30 minutes starting from scratch to committing files. I used it for a few months and decided I better move the DB to a RAID I had sitting on another sever. This would give me the reliability of a raid yet run SVN on a separate machine. 

**WRONG!!** I was able to mount a directory to a share on another server with the RAID. svnadmin created the DB just fine, but things puked when I tried to use it.

It logged the following:

> (20014)Error string not specified yet: Berkeley DB error while opening environment for filesystem /PATH/To/Repos/ db:\nInvalid argument
> 
> [error] [client XXX.XXX.XXX.XXX] Could not fetch resource information. [500, #0]
> 
> [error] [client XXX.XXX.XXX.XXX] Could not open the requested SVN filesystem [500, #160029]
> 
> [error] [client XXX.XXX.XXX.XXX] Could not open the requested SVN filesystem [500, #160029]

I hit the SVN book to see what I had done wrong only to find this.

> Warning
> 
> Do not create your repository on a network share-it cannot exist on a remote filesystem such
> as NFS, AFS, or Windows SMB. Berkeley DB requires that the underlying filesystem implement
> strict POSIX locking semantics, and more importantly, the ability to map files directly
> into process memory. Almost no network filesystems provide these features. If you attempt to
> use Berkeley DB on a network share, the results are unpredictable-you may see mysterious
> errors right away, or it may be months before you discover that your repository database is subtly
> corrupted.
> 
> As stated on page 83 of Version Control with Subversion

and so the boat sailed off into the distance with all the n-tier SCC users as SVN stood there watching.

**BUT there is good news.....**

The SVN team stated as a long term product goal they were going to add a SQL repository back-end. You can stay informed about it [<FONT color=#667755>here</FONT>](http://subversion.tigris.org/roadmap.html). 
</LI>