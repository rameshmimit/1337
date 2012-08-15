requirejs.config({
    baseUrl: 'resources/src/js/app/',
    'paths': {
        'jquery'  : 'lib/jquery/jquery-1.7.2.min',
        'domReady': 'lib/require/domReady',
        'use'     : 'lib/require/use',
        'foo'     : 'module-foo',
        'bar'     : 'module-bar',
        'baz'     : 'module-baz'

        // old-fashioned JS globals (will be imported via use)
        //'modernizr': 'lib/modernizr/modernizr-2.5.3.min'
    }
});