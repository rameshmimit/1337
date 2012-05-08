// defines a simple module with two dependencies
define(
    ['foo', 'bar'],
    function(foo, bar){
        
        var self = {};

        function __new__(){
            self.baz = baz;
        }

        function baz(){
            return foo.foo() + bar.bar();
        }

        __new__();
        return self;
    }
);