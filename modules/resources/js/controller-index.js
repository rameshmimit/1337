// wrapped in an anonymous function to safely encapsulate globals
(function(global, doc, undefined){
    console.log('page controller loaded!', global, doc);

    // index controller kidna acts like the 'application' here
    // will load in required modules and go from there
    require(
        // this module depends on the following
        [
            'domReady!',
            'jquery',
            'features',
            'foo',
            'bar',
            'module-baz',
            'templating',
            'text!templates/list.html'
        ],

        // this function doesn't return anything but will manage the page interactions
        // dependencies are passed to the callback in the order they were added above
        function(
            domReady,
            $,
            features,
            foo,
            bar,
            baz,
            templating,
            listTemplate
        ){

            // testing stuff
            console.log('page controller ready!', domReady, $(), features, foo, bar, templating, listTemplate);
            console.log('foo.foo', foo.foo());
            console.log('bar.bar', bar.bar());
            console.log('baz.baz', baz.baz());

            $('body').append('<p>index controller is ready!</p>');
            $('body').append('<p>cssTransforms3d supported? ' +  features.cssTransforms3d() + '</p>');
            $('body').append('<p>cssTransforms supported? ' +  features.cssTransforms() + '</p>');
            $('body').append('<p>cssTransitions supported? ' +  features.cssTransitions() + '</p>');
            $('body').append('<p>history supported? ' +  features.history() + '</p>');

            var listModel = {
                'items': [
                    {'item': 'foo'},
                    {'item': 'bar'},
                    {'item': 'baz'}
                ]
            };

            var listRendered = templating.render(listTemplate, listModel);
            $('body').append(listRendered);
        }
    );

}(this, this.document));