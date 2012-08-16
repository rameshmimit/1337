// TODO:
// Now that I more completely understand how r.js is doing things
// and that i've moved the file structure to app / compiled file format
// I think I may need to rethink which modules i'm requiring
// And what paths I am using here.
// I feel like if I ran r.js like it is i would get missing resources errors.
// r.js doesn't seem to change require calls to concatinated modules.
// so my thought is that I require the final module instead of the individual ones.
// e.g. shared has jquery, etc in it. require shared instead
// needs more discovery.
// at least i have it compiling now! whee!

requirejs.config({
    baseUrl: 'resources/src/js/app',
    'paths': {
        'jquery'  : '../lib/jquery/jquery-1.7.2.min',
        'domReady': '../lib/require/domReady',
        'use'     : '../lib/require/use'
    }
});