---
layout: post 
title: "What is a Team Project?"
subTitle: 
heroImageUrl: 
date: 2006-5-23
tags: ["VSTS"]
keywords: 
---

I have now installed and used TFS at a number of clients.&nbsp; On every installation the very first question asked has alway been, what is a project?&nbsp; This question seems to provoke a solid hour of conversation about organization structure and development practices.&nbsp; No doubt every shop will always be different, regardless you will still derive from some base.&nbsp; Last night while browsing around on MSDN, I ran across the official "project" party line.&nbsp; Below is just a snippet from [Team Foundation Team Projects](http://msdn2.microsoft.com/en-us/library/ms181234(VS.80).aspx).

> # <FONT size=3>The Logical Definition of a Team Project</FONT>
> 
> Logically (or conceptually), a team project is a single infrastructure that encompasses all of the separate tools and elements used in the life cycle of the development of a software application. Each software application, or "team project," in development is virtually grouped in its own namespace intended solely for the team project. Therefore, a team project is simply a container isolating all of the tools and artifacts associated with a particular software application in development, such that all other team projects will not have access to those tools or artifacts (for example, source code, work items, and documents). 
> 
> The team project is the central concept that holds together the team endeavor of creating a specific software technology or product. The team project is the virtual collection of artifacts relevant to a software application on which a team is working. For the team members, the team project concept eliminates the problem of having access to multiple artifacts not relevant to the team project; such an excess of artifacts causes confusion and delays the software development process. At a minimum, the team project consists of a set of tools and artifacts. The team project may also include source control policies, a team project reporting site, and a team project portal. The Team Foundation team project allows the process template, during the creation of a team project, to select which tools are relevant and will be added in the team project container. 
> 
> The team project concept enhances reporting across all the tools used by the team. In the past, cross-tool reporting was challenging because the data from different tools was not related. For example, if a software developer wanted to obtain a cross-tool report on defects, he or she would have to distinguish the defects from multiple projects, since the defects were all stored in a common location. A team project is created in a namespace containing only tools and artifacts relevant to the software project; therefore a common filter is created which can relate different artifacts from different tools. 
> 
> A single Team Foundation Server server may contain multiple team projects, each of which are created in a separate namespace, such that a document named X in namespace A is not the same as a document named X in namespace B. Creating a team project in a separate namespace allow artifacts or tools to be unique to the team project for which they belong, such that a tool or artifact contained in team project A is not accessible to a software developer working on team project B.
> 
> MSDN ' Team Foundation Team Projects, [http://msdn2.microsoft.com/en-us/library/ms181234(VS.80).aspx](http://msdn2.microsoft.com/en-us/library/ms181234(VS.80).aspx)