// rolled into anonymous function to safely encapsulate undefined
(function(undefined){

    // 'define' a moudle for use within a 'require' call
    define(
        // this module requires modernizr
        ['use!modernizr'],

        // this function returns the actual 'mediator' object
        // dependencies are passed to the callback in the order they were added
        function(_modernizr){
            console.log('features loaded!', 'local version of modernizr =',_modernizr);

            var self = {};

            // cache results here
            var _cssTransforms3d;
            var _cssTransforms;
            var _cssTransitions;
            var _history;

            function __new__(){
                self.cssTransforms3d = cssTransforms3d;
                self.cssTransforms   = cssTransforms;
                self.cssTransitions  = cssTransitions;
                self.history         = history;
            }

            // tests add more here
            function cssTransforms3d(){
                if(_cssTransforms3d === undefined)
                    _cssTransforms3d = _modernizr.csstransforms3d;
                
                return _cssTransforms3d;
            }
            function cssTransforms(){
                if(_cssTransforms === undefined)
                    _cssTransforms = _modernizr.csstransforms;
                
                return _cssTransforms;
            }
            function cssTransitions(){
                if(_cssTransitions === undefined)
                    _cssTransitions = _modernizr.csstransforms;
                
                return _cssTransitions;
            }
            function history(){
                if(_history === undefined)
                    _history = _modernizr.csstransforms;
                
                return _history;
            }

            __new__();
            return self;
        }
    );
}());