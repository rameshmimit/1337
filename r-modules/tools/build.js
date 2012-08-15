{
    appDir: '../www_test/resources/src/js/app/',
    baseUrl: './',
    dir: '../www_test/resources/js',

    'paths': {
        'jquery'  : '../lib/jquery/jquery-1.7.2.min',
        'domReady': '../lib/require/domReady',
        'use'     : '../lib/require/use',
        'foo'     : 'module-foo',
        'bar'     : 'module-bar',
        'baz'     : 'module-baz'
    },
    
    // maybe this isn't what we want, sub-layer dependencies
    // might be better off minified into their own modules
    // findNestedDependencies: true,
    
    // we don't want to deploy src files
    removeCombined: true,
    
    // skipModuleInsertion: true, // may need this if using non AMD code

    modules: [
        {
            name: '../shared',
            include: [
            	'jquery',
            	'domReady',
            	'use'
            ]
        },
        {
        	name: '../home.html',
        	include: [
        		
        	],
        	exclude: [
        		'view-bootstrap'
        	]
        }
    ]
}