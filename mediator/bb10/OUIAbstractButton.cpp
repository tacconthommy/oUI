/*
 * OUIAbstractButton.cpp
 *
 *  Created on: 08.04.2013
 *      Author: thommy
 */

#include "OUIAbstractButton.h"

OUIAbstractButton::OUIAbstractButton() {
	// TODO Auto-generated constructor stub

}

OUIAbstractButton::OUIAbstractButton(std::string newIdentificator, QObject*& newNativeObject) {
	nativeObject = newNativeObject;
	identificator = newIdentificator;
}

OUIAbstractButton::~OUIAbstractButton() {
	// TODO Auto-generated destructor stub
}

void OUIAbstractButton::setNativeObjectCaption(std::string caption)
{
	nativeObject->setProperty("text", caption.c_str());
}

void OUIAbstractButton::setProperty(std::string property, std::string value)
{
	if (property.compare("caption") == 0) {
		setNativeObjectCaption(value);
	}
}
