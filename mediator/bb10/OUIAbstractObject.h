/*
 * OUIAbstractObject.h
 *
 *  Created on: 07.04.2013
 *      Author: thommy
 */

#ifndef OUIABSTRACTOBJECT_H_
#define OUIABSTRACTOBJECT_H_

#include <QObject>
#include <map>
#include <string>
#include <bb/cascades/QmlDocument>

class OUIAbstractObject {
public:
	OUIAbstractObject();
	OUIAbstractObject(std::string newIdentificator, QObject*& newNativeObject);
	virtual ~OUIAbstractObject();
	virtual void setProperty(std::string property, std::string value);
protected:
	QObject* nativeObject;
	std::string identificator;
};

#endif /* OUIABSTRACTOBJECT_H_ */
