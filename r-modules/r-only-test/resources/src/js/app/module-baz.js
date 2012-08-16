// defines a simple module with two dependencies

define(
    ['module-foo', 'module-bar'],
    function(foo, bar){
        
        var self = {};

        function __new__(){
            self.baz = baz;
        }

        function baz(){
            return 'you called baz.baz() ' + foo.foo() + bar.bar();
        }

        __new__();
        return self;
    }
);