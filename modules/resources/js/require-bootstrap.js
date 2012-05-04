(function(undefined){
    if(require !== undefined){
        require.config({
            'baseUrl': '/resources/js/',
            
            // incompatible scripts to be loaded as modules
            'use': {
                'modernizr': {
                    'attach': 'modernizr'
                }
            }, 

            // amd modules
            'paths': {
                'modernizr': 'libs/modernizr/modernizr-2.5.3.min',
                'jquery': 'libs/jquery/jquery-1.7.2.min',
                'foo': 'module-foo',
                'features': 'mediator-features-modernizr',
                
                // require plugins
                'domReady': 'libs/require/domReady',
                'order': 'libs/require/order',
                'use': 'libs/require/use'
            },

            // additional configuration
            'waitSeconds': 15, // timeout to wait for script
            'locale': 'en-us' // localization
        });
    }else{
        throw 'Require has not been loaded!';
    }
}());