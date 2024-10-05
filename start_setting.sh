#!/bin/bash

CURRENT_DIR=$(pwd)

echo [START] Mac setting job at $CURRENT_DIR

chmod +x $CURRENT_DIR/*

$CURRENT_DIR/install.sh

echo [END] Mac setting finished
