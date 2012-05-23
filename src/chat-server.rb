require 'rubygems'
require 'bundler/setup'

require 'em-websocket'

ws_proc = Proc.new do |ws|
  ws.onopen do
    puts "Client connected"
  end

  ws.onmessage do |message|
    
  end
end

EM.run do
  EM::WebSocket.start(host: '0.0.0.0', port: '8181', &ws_proc)
end
