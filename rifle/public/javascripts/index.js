!function(global, doc, $, rifle){

	$(function(){
		console.log('index :: loaded');
		// console.log($, rifle);

		var jq_refreshLink = $('.js-rifle-refresh');
		// var rifleClient;

		function init(){
			rifleClient = rifle.Client().connect().hotkey();
			jq_refreshLink.on('click', onRefreshClick);
		}

		function onRefreshClick(e){
			e.preventDefault();
			console.log('index :: onRefreshClick');
			rifleClient.refresh();
		}

		init();

		//testClient();
		//testHotkey();
		//testClientConnect();
		//testClientConnectHotkey();

		// function testClient(){
		// 	var c = rifle.Client();
		// 	console.log(c);
		// }
		// function testHotkey(){
		// 	var hk = rifle.Hotkey();
		// 	console.log(hk);
		// }
		// function testClientConnect(){
		// 	var r = rifle.Client().connect();
		// }
		// function testClientConnectHotkey(){
		// 	var r = rifle.Client().connect().hotkey();
		// }
	});

}(this, document, jQuery, Rifle);