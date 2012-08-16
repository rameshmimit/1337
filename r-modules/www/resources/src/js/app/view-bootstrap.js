!function(global, doc, require, undefined){
    
    require = require || false;
    if(require === false) return;

    require.config({
        'basePath': '/resources/src/js/app/',
        'paths': {
            'jquery'  : '../lib/jquery/jquery-1.7.2.min',
            'domReady': '../lib/require/domReady',
            'use'     : '../lib/require/use',

            // old-fashioned JS globals (will be imported via use)
            'modernizr': '../lib/modernizr/modernizr-2.5.3.min',
            'mustache': '../lib/mustache/mustache'
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

// (function(undefined){
    
//     // test to see if required had abeen loaded
//     if(require !== undefined){

//         // bootstrap object
//         // 'aliases' to scripts can be added in 'paths'
//         // 'use' is a plugin that executes non-amd code but allows a reference to be passed in to the dependancies argument
//         require.config({
//             'baseUrl': '/resources/js/',

//             // amd modules
//             'paths': {
//                 // require plugins
//                 'domReady': 'libs/require/domReady', // will belay the module until the dom has loaded
//                 'use': 'libs/require/use', // loads non-amd compatible code
//                 'text': 'libs/require/text', // loads a text file in as a resource

//                 // modules
//                 'jquery': 'libs/jquery/jquery-1.7.2.min', // jq is amd compatible as of 1.7
//                 'foo': 'module-foo',
//                 'bar': 'module-bar',
//                 'features': 'mediator-features-modernizr',
//                 'templating': 'mediator-templating-mustache',

//                 // non-amd code to be ported in with use
//                 'modernizr': 'libs/modernizr/modernizr-2.5.3.min',
//                 'mustache': 'libs/mustache/mustache'
//             },

//             // non amd compatible js imported via use
//             'use': {
//                 'modernizr':{
//                     'attach': function(){
//                         return Modernizr;
//                     }
//                 },
//                 'mustache':{
//                     'attach':function(){
//                         return Mustache;
//                     }
//                 }
//             },

//             // additional configuration
//             'waitSeconds': 15, // timeout to wait for script
//             'locale': 'en-us' // localization
//         });
//     }else{
//         throw 'Require has not been loaded!';
//     }

// }());