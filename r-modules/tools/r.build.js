{
    // app dir is relative to r.js
    // app dir is what r.js will copy over
    appDir: '../www/resources/src/js/',

    // base url is relative to appDir
    // base url sets context for all require / define / module names
    baseUrl: './',

    // dir is our output dir when not concatinating into one glob.js
    dir: '../www/resources/js/',

    'paths': {
        // 'jquery'    : '../lib/jquery/jquery-1.7.2.min',
        // 'domReady'  : '../lib/require/domReady',
        // 'use'       : '../lib/require/use',
        // 'modernizr' : '../lib/modernizr/modernizr-2.5.3.min'
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
        // {
        //     // shared is a common layer of code
        //     name: '../shared',
        //     include: [
        //         'bootstrap-page',
        //         'jquery',
        //         'domReady',
        //         'use',
        //         'modernizr'
        //     ]
        // },
        // {
            // home.html is a minified page script with no deps
            // though is not excluded from deps
            // -> view-home-specific-component.js
            // -> view-home-bar-component.js
            // ^ prossibly only components used on the home page?
        //     name: '../home',
        //     include: [
        //         'home-page'
        //     ],
        //     exclude: [
        //         '../shared'
        //     ]
        // }
    ]
}