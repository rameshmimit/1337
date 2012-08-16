!function(global, doc, require, undefined){
    
    require = require || false;
    if(require === false) return;

    require.config({
        'basePath': '/resources/src/js/',
        'paths': {
            'jquery'  : 'lib/jquery/jquery-1.7.2.min',
            'domReady': 'lib/require/domReady',
            'use'     : 'lib/require/use',

            // // old-fashioned JS globals (will be imported via use)
            'modernizr': 'lib/modernizr/modernizr-2.5.3.min',
            'mustache': 'lib/mustache/mustache'
        },
        'use': {
            'modernizr': {
                'attach': function(){
                    return Modernizr;
                }
            },
            'mustache': {
                'attach': function(){
                    return Mustache;
                }
            }
        }
    });
}(this, this.document, require);