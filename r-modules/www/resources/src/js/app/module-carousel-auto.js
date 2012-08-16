// something to be aware of:
// required modules are 'run' right away
// one should be careful to defer any intensive execution to a run method

define(['app/module-carousel-base', 'app/util-timer'], function(carousel, timer){
	var __static__ = {};

	// inits only a create method to get distinct carousel instances
	function __init__(){
		__static__.create = __new__;
		return __static__;
	}

	// actuall auto carousel module
	function __new__(){
		var self = {};
		var o_carousel = carousel.create();
		var o_timer = timer.create();

		// stop carousel after max timers
		var max = 5;
		var i = 0;

		function __init__(){
			self.run = run;

			return self;
		}
		function run(){
			o_timer.next = onTimer;
			o_timer.start();
		}
		function onTimer(){
			console.log('• carousel-auto -> changed carousel pos = ' + o_carousel.next());
			i++

			if(i === max){
				console.log('• carousel-auto -> stopping carousel!')
				o_timer.stop();
			}
		}

		return __init__();
	}

	return __init__();
});