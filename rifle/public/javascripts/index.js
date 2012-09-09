!function(global, doc, $, rifle){

	$(function(){
		console.log('index :: loaded');

		var rifleClient;

		function init(){
			console.log('index :: init');
			rifleClient = rifle.Client().connect(reload);
		}
		function reload(){
			console.log('index :: reload!');
			//global.location.reload(true);
		}

		init();
	});

}(this, document, jQuery, Rifle);