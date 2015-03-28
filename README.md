#GsDevKit Sample Project

GsDevKitHome and tODE are designed to provide a productive, git-based development environment for Smalltalk.

Git-based development for Smalltalk is a relatively new concept.
Traditionally Smalltalk development environments have been hyper-focussed on image-based development.
From a development perspective the universe outside of the image barely exists and the file system tends to be viewed as a necessary evil.
The real action takes place inside the image.

The image-based development model is appealing because it provides the individual developer with a very productive enviroment.
Not only does the developer have full access and control over the source code for her program, but more importantly the developer has full access to the run-time state of the program.
And, as if that weren't enough, the image-based environment provides persistence as well.
Again, the developer has full access to the persistent data for the program.
A snapshot of the image, can be made at any time and that snapshot includes the source, run-time state and persistent data in a single file.

While image-based development is very productive for individual developers, image-based development is less friendly for groups of developers.
It is just not practical to share a single image with a group of developers.
To share ones work then, the Smalltalk developer is forced to interact with the universe outside of the image.

Over the years there have been a number of different approaches to source code control with varying degrees of success.
Unfortunately, each Smalltalk dialect has tended to approach source code control from a different angle leading to what Kent Beck called [Smalltalk: Welcome to the Balkans][1].

In 2012, Otto Behrens, mentioned in a post the the Pharo Development list, that

<a href="http://forum.world.st/Smalltalk-for-small-projects-only-tp4336237p4339381.html">
<pre>We've built a little package that allows us to save all our source in git.</pre>
</a>

## INSTALL Sample
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
[3]: http://forum.world.st/Smalltalk-for-small-projects-only-tp4336237p4339381.html
[4]: https://guides.github.com/introduction/flow/
