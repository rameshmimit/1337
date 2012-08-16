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

    // paths let me alias more annoying folder structure
    'paths': {
        'jquery'    : 'lib/jquery/jquery-1.7.2.min',
        'domReady'  : 'lib/require/domReady',
        'use'       : 'lib/require/use',
        'modernizr' : 'lib/modernizr/modernizr-2.5.3.min'
    },
    
    // will prevent combined src files from copying over
    // we don't want to deploy src files
    removeCombined: true,

    // many other options, github.com/mishoo/Uglify.js
    uglify: {
        // debugging, will output non-minified / indented code if true
        'beautify': false
    },

    // modules define our final output
    modules: [

        // build 'common' code layer 
        {
            'name': 'main-bootstrap',
            'include': [
                'jquery',
                'modernizr',
                'domReady',
                'use',
                'app/util-debug',
                'app/util-timer'
            ]
        },

        // build carousel module from parts
        {
            'name':'module-carousel',
            'include': [
                'app/module-carousel-base',
                'app/module-carousel-auto'
            ],
            'exclude': [
                'main-bootstrap'
            ]
        }
    ]
}