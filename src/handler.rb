class Handler
  def initialize(ws)
    @ws = ws
    init_handlers
  end

  def init_handlers
    @ws.onopen { onopen_handler }
    @ws.onmessage { |message| onmessage_handler(message) } 
  end

  def onmessage_handler(message)
  end

  def onopen_handler
    puts "Client connected"
  end
end
