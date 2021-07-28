#!/bin/bash
rm export/release/linux/bin/assets -r
lime build linux
lime run linux