/*
 * OUIMediator.cpp
 *
 *  Created on: 07.04.2013
 *      Author: thommy
 */

#include "OUIMediator.h"

OUIMediator::OUIMediator() {
	// TODO Auto-generated constructor stub
}

OUIMediator::~OUIMediator() {
	// TODO Auto-generated destructor stub
}

void OUIMediator::addButton(QObject*& nativeObject, std::string identificator)
{
	UIObjects[identificator] = new OUIAbstractButton(identificator, nativeObject);
}

void OUIMediator::set(std::string identificator, std::string property, std::string value)
{
	UIObjects[identificator]->setProperty(property, value);
}

void OUIMediator::get(std::string identificator, std::string property)
{

}
