#!/bin/sh

pio run --environment m5stack-simulated -t clean
pio run --environment m5stack-simulated
pio test --environment testing --without-testing
./.pio/build/testing/program $@
