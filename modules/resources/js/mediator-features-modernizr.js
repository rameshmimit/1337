// 'define' a moudle for use within a 'require' call
define(
    // this module requires modernizr
    ['use!modernizr'],

    // this function returns the actual 'mediator' object
    // dependencies are passed to the callback in the order they were added
    function(_modernizr){
        return{
            'cssTransforms3d': _modernizr.csstransforms3d,
            'cssTransforms'  : _modernizr.csstransforms,
            'cssTransitions' : _modernizr.csstransitions,
            'history'        : _modernizr.history
        };
    }
);
