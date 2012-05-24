var ChatWebSocket = {
  _ws: null,
  _url: 'ws://localhost:8181/',
  _commands: {
    'getAllUsers': '$:/cmd get_all_users'
  },

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
      console.log(event);
    };
  },

  getAllUsers: function() {
    this._ws.send(this._commands['getAllUsers'])
  }
};
