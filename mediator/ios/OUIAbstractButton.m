//
//  OUIAbstractButton.m
//  changed
//
//  Created by Thomas Bretzke on 05.04.13.
//  Copyright 2013 taccon software. All rights reserved.
//

#import "OUIAbstractButton.h"

@implementation OUIAbstractButton

@synthesize callbackOnTouched;

-(id)initWithNativeObject:(NSObject*)newNativeObject identificator:(NSString*)newIdentificator
{
    self = [super initWithNativeObject:(UIButton *)newNativeObject
                         identificator:newIdentificator
           ];
    if (self) {
        
        // Define property setters/getters
        [self setSettableProperties: [NSDictionary dictionaryWithObjectsAndKeys:
                                                  ^(NSString* newCaption){ [self setNativeObjectCaption:newCaption]; }, @"caption",
                                                  ^(int newLeft){ [self setNativeObjectLeft:newLeft]; }, @"left",
                                                  ^(int newTop){ [self setNativeObjectLeft:newTop]; }, @"top",
                                                  ^(int newWidth){ [self setNativeObjectLeft:newWidth]; }, @"width",
                                                  ^(int newHeight){ [self setNativeObjectLeft:newHeight]; }, @"height",
                                                  nil
                                                ]];


        [self setGettableProperties: [NSDictionary dictionaryWithObjectsAndKeys:
                                                    ^(){ return [self getNativeObjectCaption]; }, @"caption",
                                                    ^(){ return [self getNativeObjectLeft]; }, @"left",
                                                    ^(){ return [self getNativeObjectTop]; }, @"top",
                                                    ^(){ return [self getNativeObjectWidth]; }, @"width",
                                                    ^(){ return [self getNativeObjectHeight]; }, @"height",
                                                    nil
                                                  ]];
        
        [self setObjectEvents: [NSDictionary dictionaryWithObjectsAndKeys:
                                    ^(OUICallbackBlock callback){ [self setCallbackOnTouched:callback]; }, @"tap",
                                    nil
                                ]];
        
        [self setRemovableObjectEvents: [NSDictionary dictionaryWithObjectsAndKeys:
                                      ^(){ [self setCallbackOnTouched:nil]; }, @"tap",
                                      nil
                                      ]];

        [self setHasMultipleObjects:NO];
        
        // Define events
        [(UIButton*)[self nativeObject] addTarget:self action:@selector(onTouchedUp) forControlEvents:UIControlEventTouchUpInside];

    }
    return self;
}

-(void)setNativeObjectCaption:(NSString *)newCaption
{
    [(UIButton *)[self nativeObject] setTitle: newCaption forState: UIControlStateNormal];
}

-(NSString *)getNativeObjectCaption
{
    return [(UIButton *)[self nativeObject] titleForState:UIControlStateNormal];
}

-(void)setNativeObjectLeft:(int)newLeft
{
    CGRect buttonFrame = [(UIButton *)[self nativeObject] frame];
    buttonFrame.origin = CGPointMake(newLeft, buttonFrame.origin.y);
    [(UIButton *)[self nativeObject] setFrame:buttonFrame];
}

-(int)getNativeObjectLeft
{
    CGRect buttonFrame = [(UIButton *)[self nativeObject] frame];
    return buttonFrame.origin.x;
}

-(void)setNativeObjectTop:(int)newTop
{
    CGRect buttonFrame = [(UIButton *)[self nativeObject] frame];
    buttonFrame.origin = CGPointMake(buttonFrame.origin.x, newTop);
    [(UIButton *)[self nativeObject] setFrame:buttonFrame];
}

-(int)getNativeObjectTop
{
    CGRect buttonFrame = [(UIButton *)[self nativeObject] frame];
    return buttonFrame.origin.y;
}

-(void)setNativeObjectWidth:(int)newWidth
{
    CGRect buttonFrame = [(UIButton *)[self nativeObject] frame];
    buttonFrame.size = CGSizeMake(newWidth, buttonFrame.size.height);
    [(UIButton *)[self nativeObject] setFrame:buttonFrame];
}

-(int)getNativeObjectWidth
{
    CGRect buttonFrame = [(UIButton *)[self nativeObject] frame];
    return buttonFrame.size.width;
}

-(void)setNativeObjectHeight:(int)newHeight
{
    CGRect buttonFrame = [(UIButton *)[self nativeObject] frame];
    buttonFrame.size = CGSizeMake(buttonFrame.size.width, newHeight);
    [(UIButton *)[self nativeObject] setFrame:buttonFrame];
}

-(int)getNativeObjectHeight
{
    CGRect buttonFrame = [(UIButton *)[self nativeObject] frame];
    return buttonFrame.size.height;
}

- (void)onTouchedUp
{
    if ([self callbackOnTouched]) {
        ((void(^)())[self callbackOnTouched])();   
    }
}

@end