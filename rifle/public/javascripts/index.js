!function(global, doc, undefined){

	// basic example
	// var socket = io.connect('http://localhost:8080');
	// socket.on('news', function(data){
	// 	console.log(data);
	// 	socket.emit('my other event', {my:'data'});
	// });
	
	// namespace example
	// var chat = io.connect('http://localhost:8080/chat')
	// ,	news = io.connect('http://localhost:8080/news');

	// chat.on('connect', function(){
	// 	chat.emit('hi');
	// });

	// news.on('item', function(){
	// 	news.emit('woot');
	// });
	
	// ways to integrate this
	// /rifle page ?
	// hotkey ? *CHECK*
	// set up cli to take single 'rifle r' command, npm module
	// 

	$(function(){
		// var rifle = io.connect('http://localhost:8080/rifle');

		// rifle.on('connect', function(data){
		// 	console.log('rifle :: connected');
		// });

		// $('.js-refresh').on('click', function(e){
		// 	e.preventDefault();
		// 	console.log('rifle :: refresh');
		// 	// rifle.emit('refresh', {my:'data'});

		// });

		// var socket = io.connect('http://localhost:8080');
		// socket.on('test', function(data){
		// 	console.log('socket event received :: ', data);

		// });

		// $('.js-refresh').on('click', function(e){
		// 	console.log('refresh');
		// 	socket.emit('refresh', {data:'refresh'});
		// });
		var KEY_CODE_CTRL       = 17;
		var KEY_CODE_SHIFT      = 16;
		var KEY_CODE_EQUAL_PLUS = 187;
		var KEY_ID_CTRL         = "Control";
		var KEY_ID_SHIFT        = "Shift";
		var KEY_ID_PLUS         = "U+002B";
		var KEY_ID_EQUAL        = "U+003D";

		var ctrl = false;
		var shft = false;
		var equalPlus = false;

		var rifle = io.connect('http://localhost:8080/rifle');

		function sendRifleRefresh(socket){
			socket.emit('rifle-refresh', {data:'rifle-refresh'});
		}

		rifle.on('connect', function(data){
			console.log('rifle :: connected');
		});

		$('.js-rifle-refresh').on('click', function(e){
			console.log('rifle :: refresh click');
			sendRifleRefresh(rifle);
		});

		rifle.on('do-rifle-refresh', function(data){
			console.log('rifle :: do refresh ', data);
			global.location.reload(true);
		});

		// keyboard handling
		// no jquery (will need x-browser help)
		// see: http://www.quirksmode.org/js/keys.html for ref
		// build itsy-hotkeys ? :^)

		document.onkeyup = function(e){
			// console.log(e.which, e.keyIdentifier, e);

			// hot key is ctrl + shift + =
			// thought this would be pretty safe
			// add option to npm to configure hotkey?

			var code = e.which;
			var id = e.keyIdentifier;

			if( code === KEY_CODE_CTRL || 
				id   === KEY_ID_CTRL ){

				ctrl = false;
			}
			if( code === KEY_CODE_SHIFT ||
				id   === KEY_ID_SHIFT ){

				shft = false;
			}
			if( code === KEY_CODE_EQUAL_PLUS ||
				id   === KEY_ID_PLUS         || 
				id   === KEY_ID_EQUAL ){

				equalPlus = false;
			}
		}
		document.onkeypress = function(e){
			//console.log(e.which, e.keyIdentifier, e);
		}
		document.onkeydown = function(e){
			// console.log(e.which, e.keyIdentifier, e);

			var code = e.which;
			var id = e.keyIdentifier;

			if( code === KEY_CODE_CTRL || 
				id   === KEY_ID_CTRL ){

				ctrl = true;
			}
			if( code === KEY_CODE_SHIFT ||
				id   === KEY_ID_SHIFT ){

				shft = true;
			}
			if( code === KEY_CODE_EQUAL_PLUS ||
				id   === KEY_ID_PLUS         ||
				id   === KEY_ID_EQUAL ){

				equalPlus = true;
			}

			if( ctrl && 
				shft && 
				equalPlus ){

				// console.log('hotkey detected!');
				sendRifleRefresh(rifle	);	
			}
		}
	});
	





}(this, this.document);