(function(undefined){
    define(
        ['order!libs/modernizr/modernizr-2.5.3.min'],

        function(modernizr){
            console.log('features loaded!', modernizr);

            var self = {};

            // cache results here
            var _cssTransforms3d;
            var _cssTransforms;
            var _cssTransitions;
            var _history;

            function __new__(){
                self.cssTransforms3d = cssTransforms3d;
                self.cssTransforms = cssTransforms;
                self.cssTransitions = cssTransitions;
                self.history = history;
            }

            // tests add more
            function cssTransforms3d(){
                if(_cssTransforms3d === undefined)
                    _cssTransforms3d = modernizr.csstransforms3d;
                else
                    return _cssTransforms3d;
            }
            function cssTransforms(){
                if(_cssTransforms === undefined)
                    _cssTransforms = modernizr.csstransforms;
                else
                    return _cssTransforms;
            }
            function cssTransitions(){
                if(_cssTransitions === undefined)
                    _cssTransitions = modernizr.csstransforms;
                else
                    return _cssTransitions;
            }
            function history(){
                if(_history === undefined)
                    _history = modernizr.csstransforms;
                else
                    return _history;
            }

            __new__();
            return self;
        }
    );
}());