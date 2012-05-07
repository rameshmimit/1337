(function(undefined){
    define(
        ['use!modernizr'],
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

            // tests add more
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