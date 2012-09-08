var Rifle = Rifle || {};

!function(global, doc, socketio, rifle, undefined){

	/**
	 * @requires socket.io.js
	 * @requires rifle-hotkey.js
	 */

	rifle.Client = function(){
		var self = {};

		var domain = 'http://localhost';
		var port = 3456;
		var io_namespace = '/rifle';

		var hotkey;
		var socket;

		function __new__(){
			console.log('rifle_client :: __new__');
			self.connect = connect;
			self.refresh = refresh;
			self.hotkey  = hotkey;

			__init__();
			return self;
		}
		function __init__(){
			console.log('rifle_client :: __init__');
			// empty
		}

		// public functions
		function connect(){
			// socket = socketio.connect(domain + ':' + port + io_namespace);
			socket = socketio.connect(domain + ':' + port);
			socket.on('connect', onSocketConnected);
			socket.on('refresh-notify', onSocketRefreshNotify);

			return self;
		}
		function refresh(){
			console.log('rifle_client :: refresh');
			emitRefreshRequest();
		}
		function hotkey(){
			console.log('rfile_client :: hotkey');
			hotkey = Rifle.Hotkey().enable(emitRefreshRequest);
			return self;
		}

		// private functions
		function emitRefreshRequest(){
			console.log('rifle-client :: emitRefreshRequest')
			socket.emit('refresh-request', {});
		}
		function reload(){
			console.log('rifle-client :: reloading!');
			global.location.reload(true);
		}

		// socket event delegates
		function onSocketConnected(data){
			console.log('rifle-client :: connected');
		}
		function onSocketRefreshNotify(data){
			console.log('rifle-client :: onSocketRefreshNotify');
			reload();
		}

		return __new__();
	}

}(this, document, io, Rifle);