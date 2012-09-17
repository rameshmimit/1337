!function(global, doc, $, rifle){
	
	$(function(){
		console.log('refresh :: loaded');

		var jq_refresh = $('.js-refresh');
		var rifleClient = false;

		function init(){
			console.log('refresh :: init');
			jq_refresh.on('click', onRefreshClick);

			rifleClient = rifle.Client().connect();
		}	

		function onRefreshClick(e){
			e.preventDefault();
			console.log('refresh :: refresh click');
			rifleClient.refresh();
		}

		init();

	});


}(this, document, jQuery.noConflict(), Rifle);