define(function(){
	var __static__ = {};

	// inits only a create method to get distict carousel instances
	function __init__(){
		__static__.create = __new__;
		return __static__;
	}

	// actual timer module
	function __new__(){
		var self = {};
		var interval = false;

		function __init__(){
			self.start = start;
			self.stop = stop;

			return self;
		}

		function start(){
			interval = setInterval(onInterval, 1000);
		}
		function stop(){
			clearInterval(interval);
			interval = false;
		}
		function onInterval(){
			if(typeof self.next === 'function'){
				self.next();
			}
		}

		return __init__();
	}
	
	// return static version of module
	return __init__();
});