#!/bin/bash -x
#
# Copyright (c) 2015 GemTalk Systems, LLC. All Rights Reserved <dhenrich@gemtalksystems.com>.
#

set -e  # exit on error

# Verify that the expressions in the readme run without error

$SAMPLE_HOME/bin/installSampleServer sample $GS_VERSION
$SAMPLE_HOME/bin/sampleGemServer sample --restart=sample

$GS_HOME/bin/stoneNewExtent -s $GS_HOME/gemstone/stones/sample/snapshots/extent0.sample.dbf sample

$SAMPLE_HOME/bin/createSampleStone -s $GS_HOME/gemstone/stones/sample/snapshots/extent0.sample.dbf sample2 3.2.4

$SAMPLE_HOME/bin/createSampleStone -s $GS_HOME/gemstone/stones/sample/snapshots/extent0.tode.dbf sample2 3.2.4

$SAMPLE_HOME/bin/createSampleStone -s $GEMSTONE/bin/extent0.seaside.dbf sample 3.2.4
