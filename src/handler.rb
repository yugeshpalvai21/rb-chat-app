require_relative 'command'

class Handler
  class << self
    def init(ws)
      @users ||= []
      @wss ||= []
      @ws = ws
      @wss << ws
      init_handlers
    end

    def init_handlers
      @ws.onopen { onopen_handler }
      @ws.onmessage { |message| onmessage_handler(message) } 
      @ws.onclose { onclose_handler }
    end

    def onmessage_handler(message)
      message = JSON(message)

      case message['type']
        when Command::ADD_USER
          @users << message['value']
          data = JSON({ 'type' => 'new_user', 'value' => message['value'] })
          @wss.each { |ws| ws.send(data) }
        when Command::REMOVE_USER
          @users.delete(message['value'])
        when Command::GET_ALL_USERS
          data = { 'users' => @users }
          @ws.send(JSON(data))
        when Command::MESSAGE
          data = JSON(message)
          @wss.each { |ws| ws.send(data) }
      end
    end

    def onopen_handler
      puts "Client connected"
    end

    def onclose_handler
      puts "Client disconnected"
    end
  end
end

def Handler(ws)
  Handler.init(ws)
end
