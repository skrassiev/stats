#!/bin/bash

for i in {1..80} ; do 
  {
	./scripts/drain_queue.rb &
  };
done
