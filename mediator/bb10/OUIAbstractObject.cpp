/*
 * OUIAbstractObject.cpp
 *
 *  Created on: 07.04.2013
 *      Author: thommy
 */

#include "OUIAbstractObject.h"

OUIAbstractObject::OUIAbstractObject() {
	// TODO Auto-generated constructor stub

}

OUIAbstractObject::OUIAbstractObject(std::string newIdentificator, QObject*& newNativeObject) {
	nativeObject = newNativeObject;
	identificator = newIdentificator;
}

OUIAbstractObject::~OUIAbstractObject() {
	// TODO Auto-generated destructor stub
}

void OUIAbstractObject::setProperty(std::string property, std::string value)
{
	nativeObject->setProperty(property.c_str(), value.c_str());
}

