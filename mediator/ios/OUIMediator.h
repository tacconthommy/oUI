//
//  Mediator.h
//
//  Created by Thomas Bretzke on 05.04.13.
//  Copyright 2013 taccon software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OUIAbstractObject.h"
#import "OUIAbstractButton.h"
#import "OUIAbstractViewSetItem.h"

@interface OUIMediator : NSObject {
    NSMutableDictionary* UIObjects;
}


@property (retain) NSMutableDictionary* UIObjects;

-(void)set:(NSString *)identificator property:(NSString *)newProperty value:(id)newValue;
-(id)get:(NSString *)identificator property:(NSString *)newProperty;
-(void)on:(NSString *)identificator event:(NSString *)newEvent handler:(OUICallbackBlock)callback;
-(void)off:(NSString *)identificator event:(NSString *)newEvent;
-(NSArray *)getNativeObjects:(NSString *)identificator;

-(void)addButton:(UIButton *)nativeObject identificator:(NSString *)abstractId;
-(void)addViewSetItem:(UITabBarItem *)nativeObject identificator:(NSString *)abstractId;

@end
