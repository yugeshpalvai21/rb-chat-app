require_relative 'command'
require_relative 'user_manager'

class Handler
  def initialize(ws)
    @ws = ws
    @user_manager = UserManager.new
    init_handlers
  end

  def onmessage_handler(message)
    if Command.valid?(message)
      @user_manager.add_or_remove_user(Command.parse(message))
    else
      @ws.send(message)
    end
  end

  def onopen_handler
    puts "Client connected"
  end

  def onclose_handler
    puts "Client disconnected"
  end

  private
    def init_handlers
      @ws.onopen { onopen_handler }
      @ws.onmessage { |message| onmessage_handler(message) } 
      @ws.onclose { onclose_handler }
    end
end
