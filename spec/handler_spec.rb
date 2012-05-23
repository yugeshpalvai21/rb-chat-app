require 'spec_helper'

describe Handler do
  it 'should call init_handlers when a handler is instantiated' do
    Handler.any_instance.should_receive(:init_handlers)
    fake_websocket = FakeWebSocket.new
    Handler.new(fake_websocket)
  end
end
