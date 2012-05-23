require 'spec_helper'

describe Command do
  it 'should return true if the message is a command' do
    Command.valid?('$:/cmd add_user Sophy').should == true
    Command.valid?('$:/cmd remove_user Sophy').should == true
  end

  it 'should return false if the message is not a command' do
    Command.valid?('$:/cmd add user Sophy').should == false
    Command.valid?('hi').should == false
  end

  it 'should return a hash which has command and valud' do
    message = '$:/cmd add_user Sophy'
    result = Command.parse(message)
    result.should == {command: 'add_user', value: 'Sophy'}
  end

  it 'should return true if the command is add_user' do
    Command.add_user?('add_user').should == true
  end

  it 'should return false if the command is not add_user' do
    Command.add_user?('adduser').should == false
  end

  it 'should return true if the command is remove_user' do
    Command.remove_user?('remove_user').should == true
  end

  it 'should return false if the command is not remove_user' do
    Command.remove_user?('removeuser').should == false
  end
end
