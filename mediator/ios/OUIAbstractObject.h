//
//  OUIAbstractObject.h
//
//  Created by Thomas Bretzke on 05.04.13.
//  Copyright 2013 taccon software. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^OUICallbackBlock)();

@interface OUIAbstractObject : NSObject {
    id nativeObject;
	NSString* identificator;
    NSDictionary* settableProperties;
    NSDictionary* gettableProperties;
    NSDictionary* objectEvents;
    NSDictionary* removableObjectEvents;
    BOOL hasMultipleObjects;
}

@property (retain) id nativeObject;
@property (retain) NSString* identificator;
@property (retain) NSDictionary* settableProperties;
@property (retain) NSDictionary* gettableProperties;
@property (retain) NSDictionary* objectEvents;
@property (retain) NSDictionary* removableObjectEvents;
@property BOOL hasMultipleObjects;


-(id)initWithNativeObject:(NSObject*)newNativeObject identificator:(NSString*)newIdentificator;
-(void)setProperty:(NSString *)propertyName value:(id)newValue;
-(id)getProperty:(NSString *)propertyName;
-(void)addEventHandler:(NSString *)eventName handler:(OUICallbackBlock)callback;
-(void)removeEventHandler:(NSString *)eventName;

@end