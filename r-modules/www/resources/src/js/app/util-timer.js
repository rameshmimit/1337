define(function(){

	var self = {};
	var interval = false;

	function __new__(){
		self.stop = stop;
		self.start = start;

		return self;
	}

	function start(){
		interval = setInterval(onInterval, 1000);
	}
	function stop(){
		clearInterval(interval);
	}
	function onInterval(){
		if(typeof self.next === 'function'){
			self.next();
		}
	}
	
	return __new__();

});