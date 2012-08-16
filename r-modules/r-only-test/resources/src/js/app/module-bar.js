// defines a simple module with no dependencies
define(
    function(){
        
        var self = {};

        function __new__(){
            self.bar = bar;
        }

        function bar(){
            return 'you called bar.bar()';
        }

        __new__();
        return self;
    }
);