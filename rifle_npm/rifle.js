// Rifle NPM Module
// Version 0.0.0
// Author Aubrey Taylor
// Licence Apache 2.0

// TODO:
// - make port configurable

// requires
var socketio = require('socket.io');

// event constants
var RefreshRequestEvent = 'refresh-request'
	,	RefreshNotifyEvent  = 'refresh-notify'; 

// vars
var port = 3456
	, io
	, rifle
	, sockt;

function run(){
	io = socketio.listen(port);
	rifle = io.of('/rifle');
}
function refreshNotify(){
	if(typeof sockt !== 'undefined'){
		console.log('refresh notify ok!');
		sockt.emit('refresh-notify', {});
	}else{
		console.log('warning: socket server unavailable! please start socket server');
	}
}
function setPort(val){
	port = val;
	if(val < 1024){
		console.log('warning: ports below 1024 are restricted by some systems')
	}
}

// event delegates
function onConnect(socket){
	console.log('connected');
	sockt = socket;
	sockt.on('refresh-request', onRefreshRequest);
}
function onRefreshRequest(data){
	console.log('request received');
	refreshNotify();	
}

// execute
// rifle.on('connection', onConnect);

// command processing
console.log(process.argv);
process.argv.forEach(parseArgs);

var args = [];

function parseArgs(val, index, array){
	switch(val){
		case 'r':
			refreshNotify();
			break;

		case 'run':
			run();
			break;

		default:
			//console.log('argument ' + val + ' not supported');
	}
}

// parseArgs(process.argv);