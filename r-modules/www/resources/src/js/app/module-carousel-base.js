define(function(){

	var self = {};
	var i = 0;

	function __new__(){
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
	
	return __new__();

});