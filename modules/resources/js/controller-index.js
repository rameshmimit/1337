(function(global, doc){

    console.log('page controller loaded!', global, doc);

    // index controller
    require(
        ['domReady!', 'jquery', 'features'],
        function(domReady, $, features){
            console.log('page controller ready!', domReady, $(), features);

            $('body').append('<p>index controller is ready!</p>');
            $('body').append('<p>cssTransforms3d supported? ' +  features.cssTransforms3d() + '</p>');
            $('body').append('<p>cssTransforms supported? ' +  features.cssTransforms() + '</p>');
            $('body').append('<p>cssTransitions supported? ' +  features.cssTransitions() + '</p>');
            $('body').append('<p>history supported? ' +  features.history() + '</p>');
        }
    );

}(this, this.document));