#GsDevKit Sample Project

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
$GS_HOME/bin/createStone -s $GS_HOME/gemstone/stones/sample/snapshots/extent0.sample.dbf sample2 3.2.4
```

Install sample project, starting with the extent snapshot made after tode was create during `sample` install:
```
$GS_HOME/bin/stoneNewExtent -s $GS_HOME/gemstone/stones/sample/snapshots/extent0.tode.dbf sample2
$SAMPLE_HOME/bin/installSample sample2
```

Reinstall sample project in `sample` stone, starting with $GEMSTONE/bin/extent0.seaside.dbf:

```
$GS_HOME/bin/stoneExtent sample
$SAMPLE_HOME/bin/installSample sample
```


###TravisCI Status
**master**: [![Build Status](https://secure.travis-ci.org/dalehenrich/sample.png?branch=master)](http://travis-ci.org/dalehenrich/sample)

**configuration**: [![Build Status](https://secure.travis-ci.org/dalehenrich/sample.png?branch=configuration)](http://travis-ci.org/dalehenrich/sample)

