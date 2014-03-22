#!/bin/bash
ps -ef | grep drain| awk '{print $2}' | xargs kill
