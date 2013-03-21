/**
 * oUI main script
 */

/*
 * Copyright 2013 Thomas Bretzke (taccon software)
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * 		http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS-IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
 
var _ = require('underscore');
require('js-yaml');
var converterManager = require('./converters.js');

if (process.argv.length > 3) {
	var uiInput = require(process.argv[2]);
	for (var i = process.argv.length - 1; i >= 3; i--) {
		converter = converterManager.get(process.argv[i]);
		console.log('Starting conversion for type '+process.argv[i]+'.');
		converter.convert(uiInput, function (data){	
			console.log(data);
		});
	};

} else {
	console.log('Please provide an input file and at lease one converter name!');
}
