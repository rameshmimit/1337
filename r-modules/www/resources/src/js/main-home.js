
// enforce bootstrap to load
require(['main-bootstrap'], function(){

	console.log('main-home v.0.0.1');

	// then load main-home only when bootstrap is available
	require(
    [
    	'domReady', 
    	'jquery', 
    	'use!modernizr',
    	'app/module-foo',
    	'app/module-bar',
    	'app/module-baz',
        'app/util-debug',
        'app/module-carousel', 
        'app/module-carousel-auto'
    ], 

    // require callback, executes when all deps above have loaded
	function(
		domReady, 
		$, 
		modernizr, 
		foo, 
		bar, 
		baz, 
		debug, 
		carousel,
		autoCarousel){
        
        var indent = debug.indent();
        var args = [].splice.call(arguments,0);
        var argNames = [
        	'domReady', 
        	'$', 
        	'modernizr', 
        	'foo', 
        	'bar', 
        	'baz', 
        	'debug', 
        	'carousel',
        	'autoCarousel'];

        function __init__(args){
            console.log(indent.next() + '• main-home running OK!');
            
            var depsStatus = debug.testDeps(args, argNames);
            
            indent.next();

            for(var x in depsStatus){
                console.log(indent.current() + '• ' + x + depsStatus[x]);
            }

            console.log('\n' + indent.reset() + '• testing carousel');
            // test carousel
            console.log(indent.next() + indent.next() + '• carousel pos = ' + carousel.next());
            console.log(indent.current() + '• carousel pos = ' + carousel.prev() + '\n');


            // test auto carousel
            autoCarousel.run();
        }

        __init__(args);

    }); // #eo inner require call

}); // #eo outer require call