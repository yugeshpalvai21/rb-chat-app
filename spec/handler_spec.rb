require 'spec_helper'

describe Handler do
  before(:each) do
    @fake_websocket = double('EM::WebSocket')
    @fake_websocket.stub(:onopen)
    @fake_websocket.stub(:onclose)
    @fake_websocket.stub(:onmessage)
  end

  it 'should call init_handlers when a handler is instantiated' do
    fake_websocket = double('EM::WebSocket')
    fake_websocket.should_receive(:onopen)
    fake_websocket.should_receive(:onmessage)
    fake_websocket.should_receive(:onclose)

    Handler.new(fake_websocket)
  end
end


