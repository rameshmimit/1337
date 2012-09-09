var Rifle = Rifle || {};

!function(global, doc, socketio, rifle, undefined){

	rifle.config = {
		domain: 'http://localhost',
		port: '3456',
		ns: '/rifle',
		connectMsg: 'connect',
		requestMsg: 'refresh-request',
		notifyMsg: 'refresh-notify'
	}

	//console.log('!! :: socketio =', socketio);

	/**
	 * @requires socket.io.js
	 * @requires rifle-hotkey.js
	 */

	rifle.Client = function(){
		var self = {};

		var domain     = rifle.config.domain;
		var port       = rifle.config.port;
		var ns         = rifle.config.ns;
		var connectMsg = rifle.config.connectMsg;
		var notifyMsg  = rifle.config.notifyMsg;
		var requestMsg = rifle.config.requestMsg;

		var _callback = false;

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
		function connect(callback){
			_callback = callback || false;

			socket = socketio.connect(domain + ':' + port);// + ns);
			socket.on(connectMsg, onSocketConnected);
			socket.on(notifyMsg, onSocketRefreshNotify);

			return self;
		}
		function refresh(){
			console.log('rifle_client :: ', requestMsg);
			socket.emit(requestMsg, {});
		}
		function hotkey(){
			console.log('rfile_client :: hotkey');
			hotkey = Rifle.Hotkey().enable(emitRefreshRequest);
			return self;
		}

		// socket event delegates
		function onSocketConnected(data){
			console.log('rifle-client :: connected');
		}
		function onSocketRefreshNotify(data){
			console.log('rifle-client :: onSocketRefreshNotify');
			
			if(_callback !== false){
				console.log('exectuting callback');
				 _callback();
			}
			else{
				console.log('rifle-client :: no callback specified');
			}
		}

		return __new__();
	}



}(this, document, io, Rifle);