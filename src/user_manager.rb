class UserManager
  attr_reader :users

  def initialize
    @users = []
  end

  def add_or_remove_user(message)
    command = Command.parse(message)
    if Command.add_user?(command[:command])
      add_user(command[:value])
    elsif Command.remove_user?(command[:command])
      remove_user(command[:value])
    end
  end

  def add_user(user)
    @users << user
  end

  def remove_user(user)
    @users.delete(user)
  end
end
