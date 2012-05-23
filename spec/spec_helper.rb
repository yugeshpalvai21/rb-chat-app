require 'rspec'
%w(handler command user_manager).each { |filename| require_relative "../src/#{filename}" }

class FakeWebSocket
  def onopen
  end

  def onmessage
  end
end
