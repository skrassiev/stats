#!/bin/bash
#@(#) PID stats for classification processors

grep Classif /opt/ec/g2mg/logs/server_ui/poller.output | awk '{print $2}'|awk -F\| '{print $2}'| sort | uniq -c

