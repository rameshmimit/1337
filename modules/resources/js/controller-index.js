define(
    'controller-index',
    
    [
        'module-foo',
        'module-bar'
    ],

    function(foo, bar){
    
        var self = {};

        function __new__(){
            self.run = run;
        }

        function run(){
            console.log('run');
            console.log(foo.foo(), bar.bar());
        }

        __new__();
        return self;
    }
);