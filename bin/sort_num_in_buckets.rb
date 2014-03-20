#!/usr/bin/env ruby
#
# First, you extract timing as:
# > grep 'BulkStoreProcessor.*TIME' poller.output| sort -k 7,7 -n | awk '{print $7}'

buckets = {}

while line = gets
  v = line.to_f
  idx = (v-v%1).to_i
  if buckets[idx] 
    buckets[idx] += 1
  else
    buckets[idx] = 1
  end
end

puts "\n\nseconds\t\trequests\n#{'='*8*3}"
buckets.keys.sort.each do |k|
  puts "#{k} s\t=>\t#{buckets[k]}"
end


