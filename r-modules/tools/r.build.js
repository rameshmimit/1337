{
    // app dir is relative to r.js
    // app dir is what r.js will copy over
    // think of it as the src directory
    appDir: '../www/resources/src/js/',

    // base url is relative to appDir
    // base url sets context for all require / define / module names
    baseUrl: './',

    // dir is our output dir when not concatinating into one glob.js
    // think of this as our bin
    dir: '../www/resources/js/',

    'paths': {
        'jquery'    : 'lib/jquery/jquery-1.7.2.min',
        'domReady'  : 'lib/require/domReady',
        'use'       : 'lib/require/use',
        'modernizr' : 'lib/modernizr/modernizr-2.5.3.min'
    },
    
    // maybe this isn't what we want, sub-layer dependencies
    // might be better off minified into their own modules
    // findNestedDependencies: true,
    
    // we don't want to deploy src files
    // debug maybe put this to false for uncombined modules during testing
    // call to r.js will take this in a cli arg as well
    // build call can have debug flag that will set appropriate options in fab file
    removeCombined: true,
    
    // skipModuleInsertion: true, // may need this if using non AMD code

    // many other options, github.com/mishoo/Uglify.js
    uglify: {
        // debugging, will output non-minified / indented code
        // 'beautify': true
    },

    // modules define our final output
    modules: [
        {
            'name': 'page-bootstrap',
            'include': [
                'jquery',
                'modernizr',
                'domReady',
                'use',
                'app/util-debug'
            ]
        }
    ]
}