// defines a simple module with no dependencies
define(
    function(){
    
        var self = {};

        function __new__(){
            self.foo = foo;
        }

        function foo(){
            return 'you called foo.foo()';
        }

        __new__();
        return self;
    }
);