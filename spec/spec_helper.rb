require 'rspec'
require 'json'
%w(handler command).each { |filename| require_relative "../src/#{filename}" }

class FakeWebSocket
  def onopen
  end

  def onmessage
  end
end
