/**
 * BlackBerry10 Converter for oUI
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
var conv = require('./Converter');

function BB10Converter() {
	conv.Converter.call(this);
	this.name="BlackBerry10";
	this.templatePath = "./templates/bb10/";
}

BB10Converter.prototype = new conv.Converter();
BB10Converter.prototype.constructor = BB10Converter;

BB10Converter.prototype._convertView = function(viewName, viewData, abstractData){
	var pageCode = "Page {\n";
	pageCode = pageCode + "\tid: "+viewName+"\n";
	pageCode = pageCode + "}\n";
	return pageCode;
}

BB10Converter.prototype._convertTabViewSet = function(abstractStructure) {
	var tabData = this._readTemplate('Tab.tpl');
	var tabViewSetData = this._readTemplate('TabbedPane.tpl');
	var generatedTabs = "";
	var returnData = "";
	var converter = this;

	_.each(abstractStructure.items, function(objectData, objectId){
		generatedTabs = generatedTabs + converter._replaceTemplateVariables(tabData, {
			'TITLE': objectData.title,
			'IMAGESRC': objectData.icon,
			'CONTENT': '' // TODO: Convert view here!
		});
	});

	returnData = converter._replaceTemplateVariables(tabViewSetData, {
		'ID': abstractStructure.id,
		'CONTENT': generatedTabs
	});

	return returnData;
}

BB10Converter.prototype.convert = function(abstractData, callback){
	var newStructure = this.baseStructure;
	var pageData = "";
	var converter = this;
	var baseStructure = this._readTemplate('filebase.tpl');

	var applicationData = {};
	var applicationName = {};
	var views = {};
	var viewSets = {};

	_.each(abstractData, function(objectData, objectId){
		objectData.id=objectId;
		switch (objectData.type) {
			case "View":
				views[objectId] = objectData;
				break;
			case "TabViewSet":
				viewSets[objectId] = objectData;
				break;
			case "NavigationViewSet":
				viewSets[objectId] = objectData;
				break;
			case "Application":
				applicationName = objectId;
				applicationData = objectData;
				break;
		}
	});

	console.log('Found app "'+applicationName+'".');

	var startView = converter._findObject(viewSets, applicationData.start);
	if (!startView) {
		startView = converter._findObject(views, applicationData.start);
	}

	console.log('Start is  "'+startView.id+'" (type: '+startView.type+').');

	if (startView.type != 'TabViewSet') {
		if (startView.type == 'View') {
			var startTabViewSet = null;
			_.each(startView.contents, function(contentEntryData, contentEntryId){
				if (_.isString(contentEntryData)) {
					startTabViewSet = converter._findObject(viewSets, contentEntryData);
				}
			});
			if (startTabViewSet != null) {
				newStructure = converter._convertTabViewSet(startTabViewSet);
			} else {
				newStructure = converter._convertView(startView);
			}
		}
	}


	// TODO: Go through other data entries

	newStructure = converter._replaceTemplateVariables(baseStructure, {
		'CONTENT': newStructure
	});

	newStructure = "\n------ BEGIN <main.qml> ------\n"+newStructure+"\n------ END <main.qml> ------\n";

	process.nextTick(function(){
		callback(newStructure);
	});

};

exports.BB10Converter = BB10Converter;