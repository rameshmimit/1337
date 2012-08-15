requirejs.config({
    baseUrl: 'resources/src/js/',
    'paths': {
        'jquery'  : 'lib/jquery/jquery-1.7.2.min',
        'domReady': 'lib/require/domReady',
        'use'     : 'lib/require/use',
        'foo'     : 'app/module-foo',
        'bar'     : 'app/module-bar',
        'baz'     : 'app/module-baz',
        'view-bootstrap': 'app/view-bootstrap',
        'view-home': 'app/view-home'

        // old-fashioned JS globals (will be imported via use)
        //'modernizr': 'lib/modernizr/modernizr-2.5.3.min'
    }
});