#!/bin/bash -x
#
# Copyright (c) 2015 GemTalk Systems, LLC. All Rights Reserved <dhenrich@gemtalksystems.com>.
#

set -e  # exit on error

# bootstrap the gsDevKit artifacts
$SAMPLE_HOME/gsDevKit/bin/bootstrapSampleDevKit

# create a sample stone
$SAMPLE_HOME/gsDevKit/bin/installSampleServer sample $GS_VERSION
