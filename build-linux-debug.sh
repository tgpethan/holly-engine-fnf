#!/bin/bash
rm export/release/linux/bin/assets -r
lime build linux -debug
lime run linux -debug