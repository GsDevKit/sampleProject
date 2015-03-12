#!/bin/bash -x
#
# Copyright (c) 2015 GemTalk Systems, LLC. All Rights Reserved <dhenrich@gemtalksystems.com>.
#

set -e  # exit on error

# install GemStone and create the tODEClient Pharo image
$GS_HOME/bin/installGemStone $GS_VERSION
$GS_HOME/bin/createTodeImage

# bootstrap the gsDevKit artifacts
$SAMPLE_HOME/gsDevKit/bin/bootstrapSampleDevKit $SAMPLE_HOME

# create a sample stone
$SAMPLE_HOME/gsDevKit/bin/createSampleStone sample
