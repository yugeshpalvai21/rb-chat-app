class Command
  SYNTAX   = '$:/cmd'
  COMMANDS = %w(add_user remove_user)

  def self.valid?(message)
    !!(message =~ /\$:\/cmd (#{COMMANDS[0]}|#{COMMANDS[1]}) .+/)
  end

  def self.parse(message)
    message.gsub!("#{SYNTAX} ", '')
    tmp = message.split(' ')
    { command: tmp.first, value: tmp.last }
  end

  def self.add_user?(command)
    command == COMMANDS[0]
  end

  def self.remove_user?(command)
    command == COMMANDS[1]
  end
end
