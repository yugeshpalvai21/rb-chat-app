require 'rubygems'
require 'bundler/setup'
require 'em-websocket'

require_relative 'handler' 

EM.run do
  EM::WebSocket.start(host: '0.0.0.0', port: '8181') do |ws|
    Handler.new(ws)
  end
end
