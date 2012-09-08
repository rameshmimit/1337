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
		rifle = socketio.listen(port).of('/rifle');
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