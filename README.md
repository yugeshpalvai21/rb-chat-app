rb-chat-app
===========

It's a chat application powered by [Event Machine](https://github.com/eventmachine/eventmachine) and [Websocket](http://en.wikipedia.org/wiki/WebSocket). In this application I used [EM WebSocket](https://github.com/igrigorik/em-websocket) on top of Event Machine so I can use high level API provided by the library.

To set up the application
=========================

* Clone the app `git clone git@github.com:ungsophy/rb-chat-app.git`
* Then run `bundle install`
* Start chart application `ruby src/chat-server.rb`
* Start HTTP server to serve html page. The easiest way to start HTTP server is using Python SimpleHTTPServer. `python -m SimpleHTTPServer`
* Open your browser and go to `http://localhost:8000`

Notices
=======

The chat application works on only browsers that support websocket.
