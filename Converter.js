/**
 * Converter for oUI
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

function Converter() {
	this.name = "Default";
	this.templatePath = "./";
	this.views = {};
	this.viewSets = {};
}

Converter.prototype.convert = function(abstractData, callback){
    process.nextTick(function(){
        callback(abstractData);
    });
};

Converter.prototype.getName = function(){
	return this.name;
}

Converter.prototype._readTemplate = function(templateFile){
	var fs = require('fs');
	return fs.readFileSync(this.templatePath+templateFile, 'utf8');
}

Converter.prototype._replaceTemplateVariables = function(templateCode, replaceStructure){
	var returnValue = templateCode;
	_.each(replaceStructure, function(replaceWith, variableName){
		var searchRegex = new RegExp('\#\#\#\!'+variableName+'\!\#\#\#','g');
		returnValue = returnValue.replace(searchRegex, replaceWith);
	});
	return returnValue;
}

Converter.prototype._findObject = function(abstractStructure, id, type) {
	var returnValue = null;
	id = id.replace('@', '');

	_.each(abstractStructure, function(objectData, objectId){
		if (objectId == id) {
			if (typeof(type) != 'undefined') {
				if (objectData.type == type) {
					returnValue = objectData;
				}
			} else {
				returnValue = objectData;
			}
		}
	});
	return returnValue;
}

exports.Converter = Converter;