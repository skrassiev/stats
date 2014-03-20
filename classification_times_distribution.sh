#!/bin/bash
for f in g2mgstore{0..9}; do echo $f; ssh $f "zgrep 'ClassifyDeviceProcessor TIME' /opt/ec/g2mg/logs/server_ui/poller.output.*" | awk '{print $7}' | ~/bin/sort_num_in_buckets.rb ; done | tee classification_times_distribution.log
