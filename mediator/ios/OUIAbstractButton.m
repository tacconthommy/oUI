//
//  OUIAbstractButton.m
//  changed
//
//  Created by Thomas Bretzke on 05.04.13.
//  Copyright 2013 taccon software. All rights reserved.
//

#import "OUIAbstractButton.h"

@implementation OUIAbstractButton

@synthesize caption;
@synthesize left;
@synthesize top;
@synthesize callbackOnTouched;

-(id)initWithNativeObject:(NSObject*)newNativeObject identificator:(NSString*)newIdentificator
{
    self = [super initWithNativeObject:(UIButton *)newNativeObject
                         identificator:newIdentificator
           ];
    if (self) {

        NSDictionary* settableButtonProperties = [NSDictionary dictionaryWithObjectsAndKeys:
                                                  ^(NSString* newCaption){ [self setNativeObjectCaption:newCaption]; }, @"caption",
                                                  ^(int newLeft){ [self setNativeObjectLeft:newLeft]; }, @"left",
                                                  ^(int newTop){ [self setNativeObjectLeft:newTop]; }, @"top",
                                                  ^(int newWidth){ [self setNativeObjectLeft:newWidth]; }, @"width",
                                                  ^(int newHeight){ [self setNativeObjectLeft:newHeight]; }, @"height",
                                                  nil
                                                ];

        NSDictionary* gettableButtonProperties = [NSDictionary dictionaryWithObjectsAndKeys:
                                                    ^(NSString* newCaption){ [self setNativeObjectCaption:newCaption]; }, @"caption",
                                                    ^(int newLeft){ [self setNativeObjectLeft:newLeft]; }, @"left",
                                                    ^(int newTop){ [self setNativeObjectLeft:newTop]; }, @"top",
                                                    ^(int newWidth){ [self setNativeObjectLeft:newWidth]; }, @"width",
                                                    ^(int newHeight){ [self setNativeObjectLeft:newHeight]; }, @"height",
                                                    nil
                                                  ];
        
        [(UIButton*)[self nativeObject] addTarget:self action:@selector(onTouchedUp) forControlEvents:UIControlEventTouchUpInside];

        [self setSettableProperties:settableButtonProperties];
        [self setGettableProperties:gettableButtonProperties];
    }
    return self;
}

-(void)setNativeObjectCaption:(NSString *)newCaption
{
    [(UIButton *)[self nativeObject] setTitle: newCaption forState: UIControlStateNormal];
}

-(void)setNativeObjectLeft:(int)newLeft
{
    CGRect buttonFrame = [(UIButton *)[self nativeObject] frame];
    buttonFrame.origin = CGPointMake(newLeft, buttonFrame.origin.y);
    [(UIButton *)[self nativeObject] setFrame:buttonFrame];
}

-(void)setNativeObjectTop:(int)newTop
{
    CGRect buttonFrame = [(UIButton *)[self nativeObject] frame];
    buttonFrame.origin = CGPointMake(buttonFrame.origin.x, newTop);
    [(UIButton *)[self nativeObject] setFrame:buttonFrame];
}

-(void)setNativeObjectWidth:(int)newWidth
{
    CGRect buttonFrame = [(UIButton *)[self nativeObject] frame];
    buttonFrame.size = CGSizeMake(newWidth, buttonFrame.size.height);
    [(UIButton *)[self nativeObject] setFrame:buttonFrame];
}

-(void)setNativeObjectHeight:(int)newHeight
{
    CGRect buttonFrame = [(UIButton *)[self nativeObject] frame];
    buttonFrame.size = CGSizeMake(buttonFrame.size.width, newHeight);
    [(UIButton *)[self nativeObject] setFrame:buttonFrame];
}

- (void)onTouchedUp:(id)sender forEvent:(UIEvent *)event
{
    [self callbackOnTouched];
}

@end