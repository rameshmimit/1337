define(['app/module-carousel-base', 'app/util-timer'], function(carousel, timer){
	var self = {};
	var i = 0;

	function __new__(){
		self.run = __init__;
		return self;
	}

	function __init__(){
		timer.next = onTimer;
		timer.start();
	}
	function onTimer(){

		console.log('• carousel-auto -> changed carousel pos = ' + carousel.next());
		i++;

		if(i > 5){
			timer.stop();
		}
	}

	return __new__();

});