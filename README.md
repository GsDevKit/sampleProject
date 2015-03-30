#GsDevKit Sample Project

GsDevKitHome and tODE are designed to provide a productive, git-based development environment for Smalltalk.

1. [Introduction](#introduction)
   - [Image-based Development](#imagebased-development)
   - [Source Code Control](#source-code-control)
   - [Git for Smalltalk](#git-for-Smalltalk)
   - [Why Git?](#why-git)
   - [Beyond Source Code Control](#beyond-source-code-control)
2. [Getting Started with GsDevKitHome](#getting-started-with-gsdevkithome)
3. [Sample Project Installation](#sample-project-installation)

##Introduction
Git-based development for Smalltalk is a relatively new concept.
Traditionally Smalltalk development environments have been hyper-focussed on image-based development.
From a development perspective the universe outside of the image barely exists and the file system tends to be viewed as a necessary evil.
The real action takes place inside the image.

###Image-based Development
The image-based development model is appealing because it provides the individual developer with a very productive enviroment.
Not only does the developer have full access and control over the source code for her program, but more importantly the developer has full access to the run-time state of the program.
And, as if that weren't enough, the image-based environment provides persistence as well.
Again, the developer has full access to the persistent data for the program.
A snapshot of the image, can be made at any time and that snapshot includes the source, run-time state and persistent data in a single file.

While image-based development is very productive for individual developers, image-based development is less friendly for groups of developers.
It is just not practical to share a single image with a group of developers.
To share ones work then, the Smalltalk developer is forced to interact with the universe outside of the image.

###Source Code Control
Over the years there have been a number of different approaches to source code control with varying degrees of success.
Unfortunately, each Smalltalk dialect has tended to approach source code control from a different angle leading to in 2010 what Kent Beck called [Smalltalk: Welcome to the Balkans][1].

####Git for Smalltalk
In 2012, Otto Behrens, mentioned in a post on the [Pharo Development list][5]:
<a href="http://forum.world.st/Smalltalk-for-small-projects-only-tp4336237p4339381.html">
  <pre>"We've built a little package that allows us to save all our source in git..."</pre>
</a>
which lead to my [Practical Git for Smalltalk][2] talk ([video][4]) and subsequent [proposal for a cross-platform file format named *Cypress*][7] at the [2012 STIC Conference][6].
Since then, [FileTree][8], an implementation of [Cypress][9] for [GemStone][10], [Pharo][11] and [Squeak][12], has been growing in popularity as Smalltalk developers discover the advantages of using [git][13] for source code control].

####Why Git?
For me there are three reasons why git is a superior choice for Smalltalk source code control:

1. Common source code control implementation across Smalltalk dialects.
2. Superior branching model.
3. Superior [collaboration tools][15] with [GitHub][14].

There is [plenty of debate about the *best* source code control system][16], but at the end of the day, it is the collaboration tools from [GitHub][14] that makes git the primary target of my work.

##Getting Started with GsDevKitHome

###Git, GitHub, Travis-CI
1. If you are completely unfamiliar with using git and/or GitHub, then the following are good resources for getting your
   feet wet:

   1. [GitHub Hello world tutorial][31] --- the entire tutorial is hosted in your web browser.
   2. [git - the simple guide][32] --- short and to the point, this tutorial covers the very basic commit commands that you will use 90% of the time
   3. [Try Git: Code School][33] --- looks like it covers the same commands as [git - the simple guide][32], but again is hosted completely in your browser.
   4. [Git Reference manual][34] for more advanced reading.
   5. Google is your friend. Once you are compfortable with the basics, if you run into a specific problem, it is likely that you will find the answer via google.
 
2. Familiarize yourself with GitHub tools. The following [GitHub tutorials][24] are **required reading**: 

   1. [Getting your project on GitHub][23]. 
   2. [Understanding the GitHub workflow][22].
   2. [Contributing to Open Source][26].
   3. [Forking Projects][25].
   4. [Mastering Issues][27].

3. Familiarize yourself with [Travis-ci, a continuous integration server for GitHub][29].
4. Create an initial git repository for you project. You don't need much more than a `README.md` file.
5. Create a public or private GitHub repository for your project.
   [Private GitHub repositories are available for as little as $7/month][28].

###Getting your project on GsDevKitHome
1. [Install GsDevKit/gsDevKitHome, create your first stone (kit) and log into your todeClient  (steps 1-6)][30]. 
   The following discussions assume that you've [installed SSH on your server][37] and are [cloning github repositories using SSH][38].
2. Define `GS_GIT_ROOT` environment variable as a convenience for copying a pasting subsequent bash shell commands.
   If you don't already have a common root for your git clones, you can use `$GS_HOME/tode/sys/local/git`:

   ```
   cd $GS_HOME/tode/sys/local/git
   export GS_GIT_ROOT=`pwd`
   ```

2. Clone the Sample project to your local disk:

   ```
   cd $GS_GIT_ROOT
   git clone git@github.com:GsDevKit/sampleProject.git
   ```

2. Clone your GitHub project to your local disk:
   
   ```
   cd $GS_GIT_ROOT
   git clone git@github.com:<YourGitHubId>/<YourGitHubProject>.git
   ```

4. Create a [FileTree repository][8] directory for your package files :

   ```
   cd $GS_GIT_ROOT/<YourGitHubProject>
   mkdir repository
   cp $GS_GIT_ROOT/sampleProject/repository/.gitattributes repository
   git add .
   ```

4. The following tODE shell commands creates and saves an initial BaselineOfYourProject class as well as an initial *project entry*: 

   ```
   mr create filetree://$GS_HOME/tode/sys/local/git/YourProjec/repository
   mc create BaselineOfYourProject
   mr add filetree://$GS_HOME/tode/sys/local/git/YourProject/repository BaselineOfYourProject
   cls create BaselineOfYourProject BaselineOf BaselineOfYourProject
   eval `BaselineOfYourProject compile: 'baseline: spec <baseline> spec for: #'common' do: [ "add project/package dependencies" ]' classified: 'baseline'`.
   mc commit BaselineOfYourProject `initial commit`
   project entry --baseline=YourProject --repo=filetree://$GS_HOME/tode/sys/local/git/YourProject/repository /home/stone/projects
   project load YourProject
   browse method --spec BaselineOfYourProject>>baseline:
   ```

5. Create a [Metacello BaselineOf][35] to define the package load order and project dependencies for your project.
6. Create a set of GsDevKitHome bash scripts for creating custom GsDevKit stones



---
---

####The GsDevKitHome Sample Project

```
+-sampleProject\
  +-bin\
  +-gsDevKit\
  +-repository\
  +-tests\
```

####FileTree `repository` directory

---
---

I been using git and github as my primary version control system for Smalltalk for the last three years.
During that time I have become convinced that the combination of Git/GitHub provides a very powerful set of tools for Smalltalk development.
With that said, the Smalltalk tool set has to undergo a fairly significant overhaul to leverage the advantages of Git and GitHub.
[tODE has been under development since 2011][21] and in the last few years I've pushed the tODE toolset to specifically support a git/github-based workflow, but in addition to git/github support I have also been focussing on the fundamental problem of sharing development artifacts between image-based development environments via disk.


What I am about to present to you is based on my experience using git/github as my primary Smalltalk version control over the last few years.




 1. Git/Github is powerful combination
 2. To effectively work with Git/GitHub in Smalltalk, tools specifically designed to work with git/github is crucial


1. GitHub-based workflow for Smalltalk
2. 


---
---


####Beyond Source Code Control
A perennial problem for image-based Smalltalk development revolves around what to do with non-code artifacts, like external  documentation, data files and/or image files that are needed by an application.
Witness these questions/answers for [Envy][18], [Monticello][20] and [Store][19] for insight into the relatively recent *state of the art*.

Of course, with git or any other disk-based **version control system** (even the *old* ones), versioning files and directory structure is **what they do**.

##Sample Project
The **Sample Project** is an illustration of my vision




##Sample Project Inatallation
Initial install:

```
$SAMPLE_HOME/bin/installSampleServer sample 3.2.4
$SAMPLE_HOME/bin/sampleGemServer sample --restart=sample
```

Restart `sample` stone using the extent snapshot made immediately after the initial install: 
 
```
$GS_HOME/bin/stoneNewExtent -s $GS_HOME/gemstone/stones/sample/snapshots/extent0.sample.dbf sample
```

**Note:** 
  1. **The stone will be stopped before making the extent copy.**
  2. *the $GS_HOME/gemstone/stones/sample/snapshots/extent0.sample.dbf file is copied as $GS_HOME/gemstone/stones/sample/extents/extent0.dbf.***
  3. **The tranlogs in the $GS_HOME/gemstone/stones/sample/tranlogs directory are deleted.**
  4. **The stone is restarted with the -N option.**

Create a second stone, using the extent snapshot made after creating the `sample` stone (note that the GemStone version used in this stone creation command, must match the gemstone used for the `sample` stone):

```
$SAMPLE_HOME/bin/createSampleStone -s $GS_HOME/gemstone/stones/sample/snapshots/extent0.sample.dbf sample2 3.2.4
```

Install sample project, starting with the extent snapshot made after tode was create during `sample` install:
```
$SAMPLE_HOME/bin/createSampleStone -s $GS_HOME/gemstone/stones/sample/snapshots/extent0.tode.dbf sample2 3.2.4
```

Reinstall sample project in `sample` stone, starting with $GEMSTONE/bin/extent0.seaside.dbf:

```
$SAMPLE_HOME/bin/createSampleStone -s $GEMSTONE/bin/extent0.seaside.dbf sample 3.2.4
```


###TravisCI Status
**master**: [![Build Status](https://secure.travis-ci.org/dalehenrich/sample.png?branch=master)](http://travis-ci.org/dalehenrich/sample)

**configuration**: [![Build Status](https://secure.travis-ci.org/dalehenrich/sample.png?branch=configuration)](http://travis-ci.org/dalehenrich/sample)

[1]: http://www.threeriversinstitute.org/blog/?p=466
[2]: http://www.stic.st/wp-content/conferences/2012/Wednesday/1415-Practical_Git_for_Smalltalk-Henrichs.pdf
[3]: https://youtu.be/ZIkoBQphtyM
[5]: http://forum.world.st/Pharo-Smalltalk-Developers-f1294837.html
[6]: http://www.stic.st/conferences/stic12/
[7]: https://github.com/CampSmalltalk/Cypress/wiki#proposed-file-structure
[8]: https://github.com/dalehenrich/filetree
[9]: https://github.com/CampSmalltalk/Cypress#cypress-implementations
[10]: http://gemtalksystems.com/small-business/gsdevkit/
[11]: http://pharo.org/
[12]: http://www.squeak.org/
[13]: http://git-scm.com/
[14]: https://github.com
[15]: http://code.tutsplus.com/articles/team-collaboration-with-github--net-29876
[16]: http://blogs.atlassian.com/2012/03/git-vs-mercurial-why-git/
[17]: https://help.github.com/categories/collaborating/
[18]: http://computer-programming-forum.com/3-smalltalk/52166db0373d133f.htm
[19]: http://comments.gmane.org/gmane.comp.lang.smalltalk.vwnc/21222
[20]: https://gist.github.com/seandenigris/2582340
[21]: https://github.com/dalehenrich/tode/blob/master/docs/videos/videoHistory.md

[22]: https://guides.github.com/introduction/flow/
[23]: https://guides.github.com/introduction/getting-your-project-on-github/
[24]: https://guides.github.com/
[25]: https://guides.github.com/activities/forking/
[26]: https://guides.github.com/activities/contributing-to-open-source/
[27]: https://guides.github.com/features/issues/
[28]: https://github.com/pricing
[29]: http://en.wikipedia.org/wiki/Travis_CI
[30]: https://github.com/GsDevKit/gsDevKitHome/tree/master#development-kit-server-installation
[31]: https://guides.github.com/activities/hello-world/
[32]: http://rogerdudler.github.io/git-guide/
[33]: https://try.github.io/levels/1/challenges/1
[34]: http://git-scm.com/doc
[35]: https://github.com/dalehenrich/metacello-work/blob/master/docs/GettingStartedWithGitHub.md#create-baseline
[36]: https://github.com/dalehenrich/tode/blob/dev/docs/releaseNotes/releaseNotes0.1.0.md#git-credentials-and-tode
[37]: https://github.com/GsDevKit/gsDevKitHome/blob/dev/docs/osPrereqs/osPrereqs.md#ssh
[38]: https://github.com/dalehenrich/tode/blob/dev/docs/releaseNotes/releaseNotes0.1.0.md#cloning-with-ssh

