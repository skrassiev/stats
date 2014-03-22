#!/bin/bash
for i in {0..9}; do echo g2mgstore$i:; ssh g2mgstore$i "ps auxwww| grep ' poller' | grep -cv grep" 2>/dev/null; done
