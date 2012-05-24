require 'rubygems'
require 'bundler/setup'
require 'em-websocket'
require 'json'

require_relative 'handler' 

EM.run do
  handler = nil
  EM::WebSocket.start(host: '0.0.0.0', port: '8181') do |ws|
    Handler(ws)
  end
end
