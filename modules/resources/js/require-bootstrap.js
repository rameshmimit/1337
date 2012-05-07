(function(undefined){
    if(require !== undefined){
        require.config({
            'baseUrl': '/resources/js/',

            // amd modules
            'paths': {
                // require plugins
                'domReady': 'libs/require/domReady',
                'order': 'libs/require/order',
                'use': 'libs/require/use',

                // modules
                'jquery': 'libs/jquery/jquery-1.7.2.min',
                'foo': 'module-foo',
                'features': 'mediator-features-modernizr',

                // non-amd code to be ported in with use
                'modernizr': 'libs/modernizr/modernizr-2.5.3.min'
            },

            // non amd compatible js imported via use
            'use': {
                'modernizr':{
                    'attach': function(){
                        return Modernizr;
                    }
                }
            },

            // additional configuration
            'waitSeconds': 15, // timeout to wait for script
            'locale': 'en-us' // localization
        });
    }else{
        throw 'Require has not been loaded!';
    }
}());