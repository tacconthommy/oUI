/**
 * iOS Converter for oUI
 */

/*
 * 2013 Thomas Bretzke (taccon software)
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

function IOSConverter() {
	conv.Converter.call(this);
	this.name="iOS";
	this.templatePath = "./templates/ios/";
	this.usedIds = [];
}

IOSConverter.prototype = new conv.Converter();
IOSConverter.prototype.constructor = IOSConverter;

IOSConverter.prototype._generateNewId = function(){
	var id = _.random(1,9999);
	while (_.indexOf(this.usedIds) > -1) {
		id = _.random(1,9999);
	}
	this.usedIds.push(id);
	return id;
}

IOSConverter.prototype._convertTabViewSet = function(abstractStructure) {
	var sceneData = this._readTemplate('scene.tpl');
	var viewControllerData = this._readTemplate('viewcontroller.tpl');
	var tabBarItemData = this._readTemplate('tabbaritem.tpl');
	var tabBarControllerData = this._readTemplate('tabbarcontroller.tpl');
	var relationData = this._readTemplate('relationship.tpl');

	var generatedViewControllers = "";
	var generatedRelations = "";
	var returnData = "";
	var converter = this;

	_.each(abstractStructure.items, function(objectData, objectId){
		var currentViewController = converter._replaceTemplateVariables(viewControllerData, {
			'CONTROLLERTITLE': objectData.title,
			'VIEWID': objectId.replace(/_/g,''),
			'CONTENT': '',
			'TABBARITEM': converter._replaceTemplateVariables(tabBarItemData, {
				'TITLE': objectData.title,
				'ICON': '',
				'ID': converter._generateNewId()
			})
		});
		currentViewController = converter._replaceTemplateVariables(sceneData, {
			'ID': converter._generateNewId(),
			'CONTENT': currentViewController,
			'FIRSTRESPONDERID': converter._generateNewId()
		});
		generatedViewControllers = generatedViewControllers + currentViewController;
		generatedRelations = generatedRelations + converter._replaceTemplateVariables(relationData, {
			'VIEWID': objectId.replace(/_/g,''),
			'ID': converter._generateNewId()
		});
	});

	tabBarController = converter._replaceTemplateVariables(tabBarControllerData, {
		'ID': abstractStructure.id.replace(/_/g,''),
		'CONNECTIONS': generatedRelations,
		'FIRSTRESPONDERID': converter._generateNewId()
	});
	generatedViewControllers = generatedViewControllers + converter._replaceTemplateVariables(sceneData, {
		'ID': converter._generateNewId(),
		'CONTENT': tabBarController
	});

	returnData = generatedViewControllers;

	return returnData;
}

IOSConverter.prototype.convert = function(abstractData, callback){
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

	if (startView.type == 'TabViewSet') {
		newStructure = converter._convertTabViewSet(startView);
	}

	newStructure = converter._replaceTemplateVariables(baseStructure, {
		'INITIALVIEW': startView.id.replace(/_/g,''),
		'SCENES': newStructure
	});

	newStructure = "\n------ BEGIN <iPhone.storyboard> ------\n"+newStructure+"\n------ END <iPhone.storyboard> ------\n";

    process.nextTick(function(){
        callback(newStructure);
    });

//	return newStructure;

};

exports.IOSConverter = IOSConverter;