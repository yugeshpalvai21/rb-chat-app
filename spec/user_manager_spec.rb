require 'spec_helper'

describe UserManager do
  before(:each) do
    @user_manager = UserManager.new
  end

  it 'should add user' do
    user = 'Sophy'
    @user_manager.add_user(user)
    @user_manager.users.include?(user).should == true
  end

  it 'should remove user' do
    user = 'Sophy'
    @user_manager.add_user(user)
    @user_manager.remove_user(user)
    @user_manager.users.include?(user).should == false
  end

  it 'should call add_user' do
    user = 'Sophy'
    message = "$:/cmd add_user #{user}"
    @user_manager.should_receive(:add_user).with(user)

    @user_manager.add_or_remove_user(message)
  end

  it 'should call remove_user' do
    user = 'Sophy'
    message = "$:/cmd remove_user #{user}"
    @user_manager.should_receive(:remove_user).with(user)

    @user_manager.add_or_remove_user(message)
  end
end
