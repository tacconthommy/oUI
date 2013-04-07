/*
 * OUIAbstractButton.h
 *
 *  Created on: 08.04.2013
 *      Author: thommy
 */

#ifndef OUIABSTRACTBUTTON_H_
#define OUIABSTRACTBUTTON_H_

#include "OUIAbstractObject.h"

class OUIAbstractButton: public OUIAbstractObject {
public:
	OUIAbstractButton();
	OUIAbstractButton(std::string newIdentificator, QObject*& newNativeObject);
	virtual ~OUIAbstractButton();
	void setProperty(std::string property, std::string value);
private:
	void setNativeObjectCaption(std::string caption);
};

#endif /* OUIABSTRACTBUTTON_H_ */
