#!/usr/bin/env ruby
require 'rubygems'
require 'stomp'

class StompLogger
  def on_subscribe(v1, v2)
    puts "on_subscribe: #{v1.inspect}\n\n#{v2.inspect}"
  end
  
  def on_receive(log_params, super_result)  
    # puts "on_receive: log_params: #{log_params.inspect}\n\nsuper_result:#{super_result.inspect}"
  end

  def on_ack(log_params, headers)
    puts "on_ack: log_params: #{log_params.inspect}\n\nheaders:#{headers.inspect}"
  end
    
  
end

queues = [
  # ["/queue/UpdateMonitors.localhost",         :u],
  # ["/queue/SignalImmediateWMAlert.localhost", :w],
  # ["/queue/SignalImmediateAlert.localhost",   :i]
  # ["/queue/BulkStoreConsolidate.g2mgi1store1", :c]
  # ["/queue/my_UpdateMonitors.localhost",         :u],
  # ["/queue/my_SignalImmediateWMAlert.localhost", :w],
   ["/queue/UpdateMonitors.g2mgi1store22",   :i]  
  # ["/queue/UpdateMonitors.g2mgstore7SEND",   :i]    
]

puts "Consumer for queue #{queues.inspect}"

# client = Stomp::Client.new({:hosts => [{:login => "system", :passcode => "manager", :host => "g2mgi1crawler1.qai.expertcity.com", :port => 61613}], :connect_headers => {"accept-version" => "1.1", "host" => "apollo_instance"}, :logger => StompLogger.new})
client = Stomp::Client.new({:hosts => [{:login => "system", :passcode => "manager", :host => "g2mgcrawler1.sjc.expertcity.com", :port => 61613}], :connect_headers => {"accept-version" => "1.1", "host" => "apollo_instance"}, :logger => StompLogger.new})

vv = 0
no_msg  = 0
queues.each do |q|
  vv += 1
  client.subscribe q[0], { :ack => :client, :id => (self.id + vv).to_s } do | message |
    puts "message=#{message.body}"
    no_msg += 1
    break if no_msg == 1000
    # puts "press key to continue"
    # gets
    client.ack message # tell the server the message was handled and to dispose of it
  end  
end

# sleep(5000)
client.join # without this the above subscription is not activated.
client.close

