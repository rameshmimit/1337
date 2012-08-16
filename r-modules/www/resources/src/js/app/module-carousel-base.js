define(function(){
	var __static__ = {};

	// inits only a create method to get distict carousel instances
	function __init__(){
		__static__.create = __new__;
		return __static__;
	}

	// actual carousel module
	function __new__(){
		var i = 0;
		var self = {};

		function __init__(){
			self.next = next;
			self.prev = prev;

			return self;
		}

		function next(){
			i++;
			return i;
		}
		function prev(){
			i--;
			return i;
		}

		return __init__();
	}
	

	// return static version of module
	return __init__();
});