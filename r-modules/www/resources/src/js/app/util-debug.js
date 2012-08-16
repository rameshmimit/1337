define(function(){
	
	var __static__ = {};

	function __init__(){
		__static__.testDeps = testDeps;
		__static__.indent = indent;

		return __static__;
	}

	// static methods //

	function testDeps(args, argNames){
		var result = {};

		for (var i = 0; i <= args.length -1; i++) {
            var arg = args[i];
            var name = argNames[i];
            var msg = arg ? ' OK!' : ' FAIL!';

            result[name] = msg;
        };

        return result;
	}

	function indent(){
		return {
			'indent': '',
			'increment': 0,
			'space': '    ',
			'next': function(){
				if(this.increment > 0){
					this.indent += this.space;
				}else{
					this.indent = '';
				}

				this.increment++;
				return this.indent;
			}, 
			'current': function(){
				return this.indent;
			},
			'last':function(){
				this.indent = '';
				this.increment--
				
				for(var i = 0; i < this.increment; i++){
					this.indent += this.space;
				}
			},
			'reset':function(){
				this.indent = '';
				this.increment = 0;

				return this.indent;
			}
		}
	}

	// only returns a static interface, there is no __new__ call avail.
	return __init__();
});