require 'spec_helper'

describe Handler do

  it 'should create @users, @ws and call init_handlers' do
    Handler.should_receive(:init_handlers).once
    fake_websocket = double('EM::WebSocket')
    Handler.init(fake_websocket)

    Handler.instance_variable_get(:@users).should == []
    Handler.instance_variable_get(:@ws).should == fake_websocket
  end

  it 'should call onopen, onmessage and onclose on @ws' do
    fake_websocket = double('EM::WebSocket')
    fake_websocket.should_receive(:onopen)
    fake_websocket.should_receive(:onmessage)
    fake_websocket.should_receive(:onclose)

    Handler.instance_variable_set(:@ws, fake_websocket)
    Handler.init_handlers
  end

  context 'onmessage_handler' do

    after(:each) { Handler.instance_variable_set(:@users, []) }

    it 'should add user to @users' do
      json = { 'type' => Command::ADD_USER, 'value' => 'Sophy' }
      Handler.onmessage_handler(JSON(json))
      Handler.instance_variable_get(:@users).last.should == json['value']
    end

    it 'should remove user from @users' do
      remove_user_json = { 'type' => Command::REMOVE_USER, 'value' => 'Sophy' }
      add_user_json = { 'type' => Command::ADD_USER, 'value' => 'Sophy' }

      Handler.onmessage_handler(JSON(add_user_json))
      Handler.onmessage_handler(JSON(remove_user_json))

      Handler.instance_variable_get(:@users).empty?.should == true
    end

    it 'should add user to @users' do
      json = { 'type' => Command::ADD_USER, 'value' => 'Sophy' }
      Handler.onmessage_handler(JSON(json))
      Handler.instance_variable_get(:@users).last.should == json['value']
    end

    it 'should call send on @ws passing JSON(@users)' do
      json = { 'type' => Command::GET_ALL_USERS }
      users = %w(Sophy Dara)
      fake_websocket = double('EM::WebSocket')
      fake_websocket.should_receive(:send).with(JSON({ 'users' => users })).once
      Handler.instance_variable_set(:@users, users)
      Handler.instance_variable_set(:@ws, fake_websocket)

      Handler.onmessage_handler(JSON(json))
    end

    it 'should call send on @ws passing message["value"]' do
      json = { 'type' => Command::MESSAGE, 'value' => 'hi' }
      fake_websocket = double('EM::WebSocket')
      fake_websocket.should_receive(:send).with(json['value']).once
      Handler.instance_variable_set(:@ws, fake_websocket)

      Handler.onmessage_handler(JSON(json))
    end
  end
end
