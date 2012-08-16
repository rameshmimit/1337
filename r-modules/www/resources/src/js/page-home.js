// we're creating a separate main module here because its useful to
// cat the 'common' or 'bootstrap' layer of code into a single glob
// this way we can write main-home normally while not having to worry about
// where the 'common' deps end up in page-bootstrap

// enforce bootstrap to load
require(['page-bootstrap'], function(){

	// then load main-home
	require(['app/main-home']);
});