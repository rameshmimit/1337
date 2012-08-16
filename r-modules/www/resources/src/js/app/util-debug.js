define(function(){
	
	var self = {};

	function __new__(){
		self.testDeps = testDeps;
		self.indenter = indenter;

		// returns itself
		return self;
	}

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

	function indenter(){
		return {
			'indent': false,
			'increment': '    ',
			'next': function(){
				if(this.indent !== false){
					this.indent += this.increment;
				}else{
					this.indent = '';
				}

				return this.indent;
			}, 
			'current': function(){
				return this.increment;
			}
		}
	}

	// will return self to expose public interface
	return __new__();
});