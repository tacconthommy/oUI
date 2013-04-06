//
//  OUIAbstractButton.h
//  changed
//
//  Created by Thomas Bretzke on 05.04.13.
//  Copyright 2013 taccon software. All rights reserved.
//

#import "OUIAbstractObject.h"

@interface OUIAbstractButton : OUIAbstractObject {
    NSString* caption;
    int left;
    int top;
    OUICallbackBlock callbackOnTouched;
}

@property (retain) NSString* caption;
@property int left;
@property int top;
@property (readwrite, copy) OUICallbackBlock callbackOnTouched;

-(id)initWithNativeObject:(NSObject*)newNativeObject identificator:(NSString*)newIdentificator;
-(void)setNativeObjectCaption:(NSString *)newCaption;
-(void)setNativeObjectLeft:(int)newLeft;
-(void)setNativeObjectTop:(int)newTop;
-(void)setNativeObjectWidth:(int)newWidth;
-(void)setNativeObjectHeight:(int)newHeight;

@end