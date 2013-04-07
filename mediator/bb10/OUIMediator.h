/*
 * OUIMediator.h
 *
 *  Created on: 07.04.2013
 *      Author: thommy
 */

#ifndef OUIMEDIATOR_H_
#define OUIMEDIATOR_H_

#include <QObject>
#include <map>
#include <string>
#include <bb/cascades/QmlDocument>
#include "OUIAbstractObject.h"
#include "OUIAbstractButton.h"

class OUIMediator {
public:
	OUIMediator();
	virtual ~OUIMediator();
	void addButton(QObject*& nativeObject, std::string identificator);
	void set(std::string identificator, std::string property, std::string value);
	void get(std::string identificator, std::string property);

private:
	std::map<std::string, OUIAbstractObject*> UIObjects;
};

#endif /* OUIMEDIATOR_H_ */
