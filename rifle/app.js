
/**
 * Module dependencies.
 */

var express = require('express')
  , routes = require('./routes')
  , http = require('http')
  , path = require('path');
  // , io = require('socket.io').listen(8080);

var app = express();

app.configure(function(){
  app.set('port', process.env.PORT || 3000);
  app.set('views', __dirname + '/views');
  app.set('view engine', 'jade');
  app.use(express.favicon());
  app.use(express.logger('dev'));
  app.use(express.bodyParser());
  app.use(express.methodOverride());
  app.use(app.router);
  app.use(require('stylus').middleware(__dirname + '/public'));
  app.use(express.static(path.join(__dirname, 'public')));
});

app.configure('development', function(){
  app.use(express.errorHandler());
});

app.get('/', routes.index);
app.get('/refresh', routes.refresh);

http.createServer(app).listen(app.get('port'), function(){
  console.log("Express server listening on port " + app.get('port'));
});

// basic example
// io.sockets.on('connection', function(socket){
//   socket.emit('news', {hello:'world'});
//   socket.on('my other event', function(data){
//     console.log(data);
//   });
// });

// io.sockets.on('connection', function(socket){
//   socket.emit('test', {data:'test'});

//   socket.on('refresh', function(data){
//     console.log('refresh :: ', data);
//   });
// });

// var rifle = io
//   .of('/rifle')
//   .on('connection', function(socket){
//     socket.emit('test', {data:'rifle test'});

//     socket.on('rifle-refresh', function(data){
//       console.log('rifle refresh :: ', data);

//       socket.emit('do-rifle-refresh', {data:'rifle do refresh'});

//     });

//   });

// chat example
// var chat = io
//   .of('/chat')
//   .on('connection', function(socket){
//     socket.emit('a message', {
//       that:'only',
//       '/chat':'will get'
//     });
//     chat.emit('a message', {
//       everyone:'in',
//       '/chat': 'will get'
//     });
//   });

// var news = io
//   .of('/news')
//   .on('connection', function(socket){
//     socket.emit('item', {news:'item'})
//   });

// var rifle = io.of('/rifle');

// rifle
// .on('connection', function(socket){
//     console.log('rife :: socket connected');
// });

