var Rifle = Rifle || {};

!function(global, doc, rifle, undefined){

	rifle.Hotkey = function(){
		var self = {};
	
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

		var _action;

		function __new__(){
			self.enable = enable;
			self.disable = disable;

			__init__();
			return self;
		}
		function __init__(){
			// empty
		}

		function enable(action){
			// todo: add error handling here
			if(typeof action === 'undefined') return;

			_action = action;

			document.onkeyup = onKeyUp;
			document.onkeydown = onKeyDown;

			return self;
		}
		function disable(){
			var noop = function(){};

			_action = noop;

			document.onkeypress = noop;
			document.onkeydown = noop;

			return self;
		}

		// keypress event delegates
		function onKeyUp(e){
			var code = e.which;
			var id   = e.keyIdentifier;

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
		function onKeyDown(e){
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

				if( typeof _action !== 'undefined' &&
					typeof _action === 'function' ){
					_action();
				}
			}
		}

		return __new__();
	}

}(this, document, Rifle);