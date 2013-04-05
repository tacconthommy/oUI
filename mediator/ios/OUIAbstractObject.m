//
//  OUIAbstractObject.m
//  changed
//
//  Created by Thomas Bretzke on 05.04.13.
//  Copyright 2013 taccon software. All rights reserved.
//

#import "OUIAbstractObject.h"

@implementation OUIAbstractObject

@synthesize identificator;
@synthesize nativeObject;
@synthesize settableProperties;
@synthesize gettableProperties;

- (id)init
{
    return [self initWithNativeObject:nil identificator:@"empty_object"];
}

-(id)initWithNativeObject:(NSObject*)newNativeObject identificator:(NSString*)newIdentificator
{
    self = [super init];
    if (self) {
        [self setNativeObject:newNativeObject];
        [self setIdentificator:newIdentificator];
    }
    return self;
}

-(void)setProperty:(NSString *)propertyName value:(NSString *)newValue
{
    id propertySetter = [[self settableProperties] objectForKey:propertyName];
    ((void(^)())propertySetter)(newValue);
}

-(id)getProperty:(NSString *)propertyName
{
    id propertyGetter = [[self gettableProperties] objectForKey:propertyName];
    return ((id(^)())propertyGetter)();
}

@end