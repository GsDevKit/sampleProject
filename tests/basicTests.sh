#!/bin/bash -x
#
# Copyright (c) 2015 GemTalk Systems, LLC. All Rights Reserved <dhenrich@gemtalksystems.com>.
#

set -e  # exit on error

# create a sample stone
$SAMPLE_HOME/bin/installSampleServer sample $GS_VERSION
