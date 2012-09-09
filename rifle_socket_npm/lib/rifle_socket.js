// TODO:
// -- ha ha, seems the very concept of this is flawed because
// it seems you cannot use websockets this way, e.g. multiple pages
// sharing the same websocket.
// -- ideas? 
// -- can i create a new socket via this module when a page registers?
// that way i can sent the request out to all sockets
// maybe google 'running multiple sockets'
// I would have to dynamically create the namespace because
// each page is using the same client code.
// -- perhaps, having the refresh happen on the page is not the right way 
// to go about it. I wonder if I set up a 'refresh' page and then init just
// the listners on the index if that would work
// certainly its not a big deal I would think to switch to a page
// and refresh if it saved you 3 or 4 annoying device refreshes.
// -- chrome extension that sets up the client refresh page?

module.exports = function(){
	var socketio = require('socket.io');

	var self = {}
		, port = 3456
		, rifle
		, socket;

	function __new__(){
		console.log('rifle_socket :: __new__');
		self.parseArgs = parseArgs;

		__init__();
		return self;
	}
	function __init__(){
		// empty
		console.log('rfile_socket :: __init__');
	}

	// TODO: Need better arg parsing
	// - checkout optomist https://github.com/substack/node-optimist

	function parseArgs(val, index, array){
		if(val.indexOf('port') > -1){
			port = val.split('=');
			port = parseInt(port.pop(port.length -1), 10);
		}
		if(val === 'run'){
			run();
		}
	}


	// private functions
	function run(){
		console.log('rifle_socket :: run');
		rifle = socketio.listen(port); //.of('/rifle');
		rifle.on('connection', onConnection);
	}
	function emitRefreshNotify(){
		console.log('rfile_socket :: emitRefreshNotify');
		socket.emit('refresh-notify', {});
	}

	// socket / rifle event delegates
	function onConnection(sock){
		console.log('rifle_socket :: onConnection');
		socket = sock;
		socket.on('refresh-request', onRefreshRequest);
	}
	function onRefreshRequest(data){
		console.log('rifle_socket :: onRefreshRequest');
		emitRefreshNotify();
	}

	return __new__();
}