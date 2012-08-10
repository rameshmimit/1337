/*
Project JS Structure

resources/
	src/
		js/
			lib/
				jquery/
				modernizr/
				require/
				twitter-bootstrap/
		
		controller-index.js
	
	// js folder should be created by this script
	js/
		lib.js
			- libs (jquery, etc)
			- require-config.js
		
		controller-index.js
			- page js with libs excluded

		controller-workouts.js
			- page js with libs excluded 
*/

/* copied from 
	https://raw.github.com/requirejs/example-multipage/master/tools/build.js
   
   example annotated build.js file
   	https://github.com/jrburke/r.js/blob/master/build/example.build.js

{
    appDir: '../www',
    baseUrl: 'js/lib',
    paths: {
        app: '../app'
    },
    dir: '../www-built',
    modules: [
        //First set up the common build layer.
        {
            //module names are relative to baseUrl
            name: '../common',
            //List common dependencies here. Only need to list
            //top level dependencies, "include" will find
            //nested dependencies.
            include: ['jquery',
                      'app/lib',
                      'app/controller/Base',
                      'app/model/Base'
            ]
        },

        //Now set up a build layer for each page, but exclude
        //the common one. "exclude" will exclude nested
        //the nested, built dependencies from "common". Any
        //"exclude" that includes built modules should be
        //listed before the build layer that wants to exclude it.
        //"include" the appropriate "app/main*" module since by default
        //it will not get added to the build since it is loaded by a nested
        //require in the page*.js files.
        {
            //module names are relative to baseUrl/paths config
            name: '../page1',
            include: ['app/main1'],
            exclude: ['../common']
        },

        {
            //module names are relative to baseUrl
            name: '../page2',
            include: ['app/main2'],
            exclude: ['../common']
        }

    ]
}

*/

{
	'appDir' : '../www',
	'baseUrl': 'src/js'
	'dir'    : '../www/js',

	'paths': {
		'jquery'    : 'lib/jquery',
		'modernizr' : 'lib/modernizr',
		'require'   : '/lib/require',
		'twitter-bs': '/lib/twitter-bs'
	},

	'modules': [
		{
			'name': 'blanket'
			'include': [
				'jquery/jquery-1.7.2.min',
				'modernizr/modernizr-2.5.3.min',
				'require/domReady',
				'require/use',
				'require/text'
			]
		},
		{
			'name': 'view-index',
			'include': [
				'view-index'
			]
			'exclude': [
				'blanket'
			]
		}
	]
}