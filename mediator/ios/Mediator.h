//
//  Mediator.h
//  changed
//
//  Created by Thomas Bretzke on 05.04.13.
//  Copyright 2013 taccon software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Mediator :UIResponder <UIApplicationDelegate> {
    IBOutlet UIButton *someButton;
    IBOutlet UITextField *someInput;

    // Create abstract ui objects
    NSDictionary* someButtonAbstracted = [NSArray dictionaryWithObjectsAndKeys:
            @"Button", @"type",
            @"Hello, World!", @"caption",
            12, @"left",
            20, @"top",
            nil
        ];

    NSDictionary* someInputAbstracted = [NSArray dictionaryWithObjectsAndKeys:
            @"Input", @"type",
            @"Your name here...", @"text",
            12, @"left",
            50, @"top",
            nil
        ];

    // Dictionary holding abstract objects
    NSDictionary* abstractUIObjects = [NSDictionary dictionaryWithObjectsAndKeys:
            someButtonAbstracted, @"some_button",
            someInputAbstracted, @"some_input",
            nil
        ];

    // Dictionary holding native objects
    NSDictionary* nativeUIObjects = [NSDictionary dictionaryWithObjectsAndKeys:
            someButton, @"some_button",
            someInput, @"some_input",
            nil
        ];


}

//@property (retain) NSString* repositoryName;
//
//-(void)addTimelineEntry:(TimelineEntry*) entry;
//-(int)getHighestRevision;
//-(NSString *)getFormattedHighestRevision;
//-(TimelineEntry*)getTimelineEntryForRevision:(int)index;
//-(int)getNumberOfEntries;
//-(TimelineEntry*)getTimelineEntryAtIndex:(int)index;

@end
