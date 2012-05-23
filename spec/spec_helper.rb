require 'rspec'
require_relative '../src/handler'

class FakeWebSocket
  def onopen
  end

  def onmessage
  end
end
