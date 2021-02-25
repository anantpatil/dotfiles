#!/usr/bin/env bash

# -x skip directories on other file systems
du -h -x --max-depth=1 | sort -hr
