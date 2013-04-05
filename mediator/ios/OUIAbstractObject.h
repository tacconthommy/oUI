//
//  OUIAbstractObject.h
//  changed
//
//  Created by Thomas Bretzke on 05.04.13.
//  Copyright 2013 taccon software. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^OUICallbackBlock)();

@interface OUIAbstractObject : NSObject {
    NSObject* nativeObject;
	NSString* identificator;
    NSDictionary* settableProperties;
    NSDictionary* gettableProperties;
}

@property (retain) NSObject* nativeObject;
@property (retain) NSString* identificator;
@property (retain) NSDictionary* settableProperties;
@property (retain) NSDictionary* gettableProperties;


-(id)initWithNativeObject:(NSObject*)newNativeObject identificator:(NSString*)newIdentificator;
-(void)setProperty:(NSString *)propertyName value:(NSString *)newValue;
-(id)getProperty:(NSString *)propertyName;

@end