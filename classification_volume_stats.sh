#!/bin/bash
#classification volume stats

for f in g2mgstore{0..9}; do echo $f; ssh $f "zgrep -c 'ClassifyDeviceProcessor TIME' /opt/ec/g2mg/logs/server_ui/poller.output.*"; done | tee classifcation_volume_stats.log
