var ChatWebSocket = {
  _ws: null,
  _url: 'ws://localhost:8181/',

  init: function() {
    var self = this;
    this._ws = new WebSocket(this._url);

    this._ws.onopen = function() { 
      console.log("Connected");
      self.getAllUsers();
    }; 

    this._ws.onclose = function() { 
      console.log("Disconnected");
    };

    this._ws.onmessage = function(event) {
      var data = JSON.parse(event.data);
      if (data.users) {
        buildOnlineUsersList(data.users);
      }
      else if (data.type == 'message') {
        console.log(data);
        $('#messages').append("<li><strong>" + data.sender + "</strong>: " + 
                              data.value + "</li>");
      }
    };
  },

  getAllUsers: function() {
    message = { type: Command['GET_ALL_USERS'] };
    this._ws.send(JSON.stringify(message));
  },

  send: function(json) {
    this._ws.send(JSON.stringify(json));
  }
};
