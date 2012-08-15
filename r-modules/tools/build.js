{
    appDir: '../www_test/resources/src/js/',
    baseUrl: './',
    dir: '../www_test/resources/js',

    'paths': {
        'jquery'  : 'lib/jquery/jquery-1.7.2.min',
        'domReady': 'lib/require/domReady',
        'use'     : 'lib/require/use',
        'foo'     : 'app/module-foo',
        'bar'     : 'app/module-bar',
        'baz'     : 'app/module-baz',
        'view-bootstrap': 'app/view-bootstrap',
        'view-home': 'app/view-home'
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

    modules: [
        {
            name: 'shared',
            include: [
                'view-bootstrap',
            	'jquery',
            	'domReady',
            	'use'
            ]
        },
        {
            name: 'foo-bar-baz',
            include: [
                'foo',
                'bar',
                'baz'
            ],
            exclude: [
                'shared'
            ]
        },
        {
        	name: 'home.html',
        	include: [
        		
        	],
        	exclude: [
        		'shared'
        	]
        }
    ]
}