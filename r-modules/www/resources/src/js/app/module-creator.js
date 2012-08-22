/*
 * module-creator wraps a function into a create method
 *	so on may get distinct instances of a module.
 *
*/
define(function(){
	var self = {};

	function __new__(){
		self.init = init;
		return self;
	}

	function init(create){
		self.create = create;
	}

	return __new__();
});