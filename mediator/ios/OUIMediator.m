//
//  Mediator.m
//  changed
//
//  Created by Thomas Bretzke on 05.04.13.
//  Copyright 2013 taccon software. All rights reserved.
//

#import "OUIMediator.h"

@implementation OUIMediator

@synthesize UIObjects;

- (id)init
{
    self = [super init];
    if (self) {
        self.UIObjects = [NSMutableDictionary dictionaryWithCapacity:5];
    }
    return self;
}

-(void)addButton:(UIButton *)nativeObject identificator:(NSString *)abstractId
{
    [[self UIObjects] setObject:[[OUIAbstractButton alloc] initWithNativeObject:nativeObject identificator:abstractId] forKey:abstractId];
}

-(void)set:(NSString *)identificator property:(NSString *)newProperty value:(id)newValue
{
    [(OUIAbstractObject *)[[self UIObjects] objectForKey:identificator] setProperty:newProperty value:newValue];
}


-(void)on:(NSString *)identificator event:(NSString *)newEvent handler:(OUICallbackBlock)callback
{
    [(OUIAbstractObject* )[[self UIObjects] objectForKey:identificator] addEventHandler:newEvent handler:callback];
}

-(id)get:(NSString *)identificator property:(NSString *)newProperty
{
    return [(OUIAbstractObject *)[[self UIObjects] objectForKey:identificator] getProperty:newProperty];
}

@end