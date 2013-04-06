//
//  OUIAbstractObject.h
//  changed
//
//  Created by Thomas Bretzke on 05.04.13.
//  Copyright 2013 taccon software. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^OUICallbackBlock)();

@interface OUIAbstractObject : NSObject {
    NSObject* nativeObject;
	NSString* identificator;
    NSDictionary* settableProperties;
    NSDictionary* gettableProperties;
    NSDictionary* objectEvents;
}

@property (retain) NSObject* nativeObject;
@property (retain) NSString* identificator;
@property (retain) NSDictionary* settableProperties;
@property (retain) NSDictionary* gettableProperties;
@property (retain) NSDictionary* objectEvents;


-(id)initWithNativeObject:(NSObject*)newNativeObject identificator:(NSString*)newIdentificator;
-(void)setProperty:(NSString *)propertyName value:(id)newValue;
-(id)getProperty:(NSString *)propertyName;
-(void)addEventHandler:(NSString *)eventName handler:(OUICallbackBlock)callback;

@end