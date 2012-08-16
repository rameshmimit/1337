!function(global, doc, require, undefined){
    var indent = {
        t:false,
        next: function(){
            if(this.t === false){
                this.t = '';
                return this.t;
            }

            this.t = this.t + '    ';
            return this.t;
        }
    }
    console.log(indent.next() + '• index OK!');

    require(
    [
    	// 'domReady', 
    	// 'jquery', 
    	// 'use!modernizr',
    	// 'module-foo',
    	// 'module-bar',
    	// 'module-baz'
    ], 

	function(domReady, $, modernizr, foo, bar, baz){
		console.log(indent.next() + '• require callback OK!');

        // var args = [].splice.call(arguments,0);
        // var argNames = ['domReady', '$', 'modernizr', 'foo', 'bar', 'baz'];

        function __init__(args){
            console.log(indent.next() + '• init OK!');

            // test dependencies
            // for (var i = 0; i <= args.length -1; i++) {
            //     var arg = args[i];
            //     var nme = argNames[i];
            //     var msg = arg ? ' OK!' : ' FAIL!';

            //     console.log('    • ' + nme + msg);
            // };
        }

        // __init__(args);
        __init__();

    }); // #eo require call


}(this, this.document, require);

// // wrapped in an anonymous function to safely encapsulate globals
// (function(global, doc, undefined){
//     console.log('page controller loaded!', global, doc);

//     // index controller kidna acts like the 'application' here
//     // will load in required modules and go from there
//     require(
//         // this module depends on the following
//         [
//             'domReady!',
//             'jquery',
//             'features',
//             'foo',
//             'bar',
//             'module-baz',
//             'templating',
//             'text!templates/list.html'
//         ],

//         // this function doesn't return anything but will manage the page interactions
//         // dependencies are passed to the callback in the order they were added above
//         function(
//             domReady,
//             $,
//             features,
//             foo,
//             bar,
//             baz,
//             templating,
//             listTemplate
//         ){

//             // testing stuff
//             console.log('page controller ready!', domReady, $(), features, foo, bar, templating, listTemplate);
//             console.log('foo.foo', foo.foo());
//             console.log('bar.bar', bar.bar());
//             console.log('baz.baz', baz.baz());

//             $('body').append('<p>index controller is ready!</p>');
//             $('body').append('<p>cssTransforms3d supported? ' +  features.cssTransforms3d + '</p>');
//             $('body').append('<p>cssTransforms supported? ' +  features.cssTransforms + '</p>');
//             $('body').append('<p>cssTransitions supported? ' +  features.cssTransitions + '</p>');
//             $('body').append('<p>history supported? ' +  features.history + '</p>');

//             var listModel = {
//                 'items': [
//                     {'item': 'foo'},
//                     {'item': 'bar'},
//                     {'item': 'baz'}
//                 ]
//             };

//             var listRendered = templating.render(listTemplate, listModel);
//             $('body').append(listRendered);
//         }
//     );

// }(this, this.document));