!function(global, doc, io, undefined){

	var Rifle = Rifle || {};

	/**
	 * @requires socket.io.js
	 * @requires rifle-hotkey.js
	 */

	Rifle.Client = function(){
		var self = {};

		var domain = 'http://localhost';
		var port = 3456;
		var io_namespace = '/rifle';

		var hotkey;
		var socket;

		function __new__(){
			self.connect = connect;
			self.enable_hotkey = enable_hotkey;

			__init__();
			return self;
		}
		function __init__(){
			// empty
		}

		// public functions
		function connect(){
			socket = io.connect(domain + ':' + port + io_namespace);
			socket.on('connect', onSocketConnected);
			socket.on('refesh-notify', onSocketRefreshNotify);

			return self;
		}
		function enable_hotkey(){
			hotkey = Rifle.Hotkey().enable(emitRefreshRequest);

			return self;
		}

		// private functions
		function emitRefreshRequest(){
			socket.emit('refresh-request', {});
		}
		function refresh(){
			global.location.reload(true);
		}

		// socket event delegates
		function onSocketConnected(data){
			console.log('rifle-client :: connected');
		}
		function onSocketRefreshNotify(data){
			console.log('rifle-client :: refresh notify');
			// socket.emit('refresh-request', {});
		}

		return __new__();
	}

}(this, document, io);