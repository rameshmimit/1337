(function(global, doc){

    console.log('page controller loaded!', global, doc);

    // index controller
    define(
        ['domReady!', 'jquery', 'use!modernizr'],
        function(domReady, $, mod){
            console.log('page controller ready!', domReady, $(), mod);

            $('body').append('index controller is ready!');
        }
    );

}(this, this.document));