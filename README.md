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
It is not practical to share a single image with a group of developers.

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

[1]: https://guides.github.com/introduction/flow/
