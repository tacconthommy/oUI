//
//  OUIAbstractActionItem.m
//  MediatorTest
//
//  Created by Thomas Bretzke on 13.04.13.
//  Copyright (c) 2013 Thomas Bretzke. All rights reserved.
//

#import "OUIAbstractViewSetItem.h"

@implementation OUIAbstractViewSetItem

@synthesize callbackOnTouched;

-(id)initWithNativeObject:(NSObject*)newNativeObject identificator:(NSString*)newIdentificator
{
    self = [super initWithNativeObject:(UITabBarItem *)newNativeObject
                         identificator:newIdentificator
            ];
    if (self) {
        
        // Define property setters/getters
        [self setSettableProperties: [NSDictionary dictionaryWithObjectsAndKeys:
                                                  ^(NSString* newTitle){ [self setNativeObjectTitle:newTitle]; }, @"title",
                                                  ^(NSString* newIcon){ [self setNativeObjectIcon:newIcon]; }, @"icon",
//                                                  ^(BOOL newInBar){ [self setNativeObjectInBar:newInBar]; }, @"in_bar",
                                                  nil
                                      ]];
        
        
        [self setGettableProperties: [NSDictionary dictionaryWithObjectsAndKeys:
                                                  ^(){ return [self getNativeObjectTitle]; }, @"title",
                                                  nil
                                      ]];
        
        [self setHasMultipleObjects:NO];
                
    }
    return self;
}


-(void)setNativeObjectTitle:(NSString *)newTitle
{
    [(UITabBarItem *)[self nativeObject] setTitle:newTitle];
}

-(NSString *)getNativeObjectTitle
{
    return [(UITabBarItem *)[self nativeObject] title];
}

-(void)setNativeObjectIcon:(NSString *)newIcon
{
    [(UITabBarItem *)[self nativeObject] setImage:[UIImage imageWithContentsOfFile:newIcon]];
}


- (void)onTouchedUp
{
    if ([self callbackOnTouched]) {
        ((void(^)())[self callbackOnTouched])();
    }
}

@end