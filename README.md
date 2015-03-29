#GsDevKit Sample Project

GsDevKitHome and tODE are designed to provide a productive, git-based development environment for Smalltalk.

1. [Introduction](#introduction)
   - [Image-based Development](#imagebased-development)
   - [Source Code Control](#source-code-control)
   - [Git for Smalltalk](#git-for-Smalltalk)
   - [Why Git?](#why-git)
2. [Merging image-based development and disk-based development](#merging-imagebased-development-and-diskbased-development)
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

The is [plenty of debate about the *betst* source code control system][16], but at the end of the day, the collaboration tools from [GitHub][14] that makes git the primary target of my work.

####Beyond source code control
A perennial problem for image-based Smalltalk development revolves around what to do with non-code artifacts, like external  documentation, data files and/or image files that are needed by an application.
Witness these questions/answers for [Envy][18], [Monticello][20] and [Store][19] for insight into the relatively recent *state of the art*.

Of course, with git or any other disk-based **version control system** (even the *old* ones), versioning files and directory structure is **what the do**.

##Merging image-based development and disk-based development


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

 https://guides.github.com/introduction/flow/
