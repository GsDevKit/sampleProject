#GsDevKit Workflow

1. [Intro](#intro)
   - [Git and GitHub](#git-and-github)
   - [Git for GsDevKit](#git-for-gsdevkit)
     - [FileTree](#filetree)
     - [Metacello](#metacello)
     - [tODE](#tode)
   - [Git/Github Resources](#gitgithub-resources)
2. [GsDevKit Sample Project](#gsdevkit-sample-project)
   - [Install](#install)
   - [Setup](#setup)
4. [Basic Workflow](#basic-workflow)
5. [Lessons](#lessons)

##Intro
Git-based development for Smalltalk is a relatively new concept.

Traditionally Smalltalk development environments have been hyper-focussed on image-based development.
From a development perspective the universe outside of the image barely exists and the file system tends to be viewed as a necessary evil.
The real action for Smalltalkers takes place inside the image.

Of course, there is no avoiding the action outside of the image.
If you plan to use and/or contribute to open source projects it is necessary to share source code and collaborate with engineers who are working outside your workspace and likely to be outside of your timezone as well.

###Git and GitHub
In my [Of metacello, git, scripting and things][7] ([slides][8]) talk at [the 2012 ESUG conference][9], I discuss in detail many of the reasons why I believe that the combination of [git][5] and [GitHub][6] is superior to any other source code management system available in Smalltalk today:

1. [Git has a superior branching model][11]:

  <a href="http://git-scm.com/about"><pre>The Git feature that really makes it stand apart from nearly every other SCM out there 
is its branching model. Git allows and encourages you to have multiple local branches that 
can be entirely independent of each other. The creation, merging, and deletion of those 
lines of development takes seconds.</pre></a>

2. [GitHub has a superior collaboration model][10]:

  <a href="http://kbroman.org/github_tutorial/pages/why.html#why-use-githubhttpgithubcom"><pre>Github lowers the barriers to collaboration. It’s easy to offer suggested changes to 
others’ code through github.</pre></a>

###Git for GsDevKit
####FileTree
In my [Practical Git for Smalltalk][1] talk at [the 2012 STIC Conference][2] ([slides][3] and [video][4]), I discuss how [FileTree][12] and the [Cypress disk format][13] opens the door to using git for storing [Monticello][14] compatible packages on disk.

####Metacello
The [Metacello Scripting API][15] provides a way to identify GitHub and git-based repositories:

```Smalltalk
"Load the External project directly from the GitHub repository"
Metacello new
  baseline: 'External';
  repository: 'github://dalehenrich/External:master/external/repository';
  load.

"Load the External project from a local clone of the GitHub repository:

    cd /opt/git
    git clone https://dalehenrich/External.git
    cd External
    git checkout master
"
Metacello new
  baseline: 'External';
  repository: 'filetree:///opt/git/external/repository';
  load.
```

####tODE
The [tODE development environment for GsDevKit][17] provides:

- direct support for calling git commands from the tODE command shell:

  ![tODE git man page][16]

- git support from a number of the tools, like the `project list`:

  ![tODE project list git menu][18]

###Git/Github Resources

##GsDevKit Sample Project

###Install
###Setup
##Basic Workflow
##Lessons

[1]: http://www.stic.st/conferences/stic12/stic12-abstracts/practical-git-for-smalltalk/
[2]: http://www.stic.st/conferences/stic12/
[3]: http://www.stic.st/wp-content/conferences/2012/Wednesday/1415-Practical_Git_for_Smalltalk-Henrichs.pdf
[4]: https://youtu.be/ZIkoBQphtyM
[5]: http://git-scm.com/
[6]: https://github.com
[7]: https://www.google.com/calendar/render?eid=azJiYzE2bTVzYTZoNmZrcGE1YmtmMTU3aGsgdG85cmJ2cTRpNzFtZ2d1bWdicHUyM2I5dGtAZw&pli=1&t=AKUaPmYiiwfohu-fOZnL6itRFUaZbVbN9c2JlkS1xX8RJmqpkgy8gJAG93riS7aeoOredqVNF5xzOQl1lWcDiMLhkE428F1zxg&sf=true&output=xml#eventpage_6
[8]: http://www.slideshare.net/esug/of-metacello-git-scripting-and-things
[9]: http://www.esug.org/wiki/pier/Conferences/2012
[10]: https://help.github.com/categories/collaborating/
[11]: http://git-scm.com/book/en/v1/Git-Branching
[12]: https://github.com/dalehenrich/filetree
[13]: https://github.com/CampSmalltalk/Cypress/wiki#proposed-file-structure
[14]: http://www.wiresong.ca/monticello/
[15]: https://github.com/dalehenrich/metacello-work/blob/master/docs/MetacelloUserGuide.md#metacello-user-guide
[16]: docs/gitManPage.png
[17]: https://github.com/dalehenrich/tode#tode-the-object-centric-development-environment-
[18]: docs/projectListGitMenu.png
