(function(global, doc){

    console.log('page controller loaded!', global, doc);

    // index controller
    require(
        [
            'domReady!',
            'jquery',
            'features',
            'foo',
            'bar',
            'module-baz'
        ],
        function(domReady, $, features, foo, bar, baz){
            console.log('page controller ready!', domReady, $(), features, foo, bar);
            console.log('foo.foo', foo.foo());
            console.log('bar.bar', bar.bar());
            console.log('baz.baz', baz.baz());

            $('body').append('<p>index controller is ready!</p>');
            $('body').append('<p>cssTransforms3d supported? ' +  features.cssTransforms3d() + '</p>');
            $('body').append('<p>cssTransforms supported? ' +  features.cssTransforms() + '</p>');
            $('body').append('<p>cssTransitions supported? ' +  features.cssTransitions() + '</p>');
            $('body').append('<p>history supported? ' +  features.history() + '</p>');
        }
    );

}(this, this.document));