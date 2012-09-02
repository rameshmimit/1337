module.exports = function(){
	var socketio = require('socket.io');

	var self = {}
		, port = 3456
		, rifle
		, socket;

	function __new__(){
		self.parseArgs = parseArgs;

		__init__();
		return self;
	}
	function __init__(){
		// empty
	}

	function parseArgs(val, index, array){
		if(val.indexOf('port') > -1){
			port = val.split('=');
			port = parseInt(port.pop(port.length -1), 10);
		}
		if(val === 'run'){
			console.log('run');
			run();
		}
	}


	// private functions
	function run(){
		rifle = socketio.listen(port).of('/rifle');
		rifle.on('connection', onConnection);
	}

	function emitRefreshNotify(){
		socket.emit('refresh-notify', {});
	}

	// socket / rifle event delegates
	function onConnection(sock){
		socket = sock;
		socket.on('refresh-request', onRefreshRequest);
	}
	function onRefreshRequest(data){
		emitRefreshNotify();
	}

	return __new__();
}