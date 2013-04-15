//
//  OUIAbstractActionItem.h
//
//  Created by Thomas Bretzke on 13.04.13.
//  Copyright (c) 2013 Thomas Bretzke. All rights reserved.
//

#import "OUIAbstractObject.h"

@interface OUIAbstractViewSetItem : OUIAbstractObject {
    OUICallbackBlock callbackOnTouched;
}

@property (readwrite, copy) OUICallbackBlock callbackOnTouched;

-(id)initWithNativeObject:(NSObject*)newNativeObject identificator:(NSString*)newIdentificator;
-(void)setNativeObjectTitle:(NSString *)newTitle;
-(void)setNativeObjectIcon:(NSString *)newIcon;

@end
