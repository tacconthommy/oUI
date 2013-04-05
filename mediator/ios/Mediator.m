//
//  Mediator.m
//  changed
//
//  Created by Thomas Bretzke on 05.04.13.
//  Copyright 2013 taccon software. All rights reserved.
//

#import "Mediator.h"

@implementation Mediator

@synthesize repositoryName;

- (id)init
{
    self = [super init];
    if (self) {
        [self setRepositoryName:@""];
        timelineEntries = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(void)addTimelineEntry:(TimelineEntry *)entry
{
    [timelineEntries addObject: entry];
    [timelineEntries sortUsingSelector:@selector(compare:)];
}


-(int)getHighestRevision
{
    int highestRevision = -1;
    for (int entryCounter=0; entryCounter < ([timelineEntries count]); entryCounter++) {
        if ([[timelineEntries objectAtIndex:entryCounter] revisionNumber] > highestRevision) {
            highestRevision = [[timelineEntries objectAtIndex:entryCounter] revisionNumber];
        }
    }    
    return highestRevision;
}

-(NSString *)getFormattedHighestRevision
{
    int highestRevision = [self getHighestRevision];
    
    if (highestRevision > 0) {
        return [NSString stringWithFormat:@"%d", highestRevision];
    } else {
        if ([timelineEntries count] > 0) {
            return [[timelineEntries objectAtIndex:0] getFormattedRevision];
        }
    }
    return @"COM";
}

-(int)getNumberOfEntries
{
    return (int)[timelineEntries count];
}

-(TimelineEntry*)getTimelineEntryForRevision:(int)index
{
    for (int entryCounter=0; entryCounter < ([timelineEntries count]); entryCounter++) {
        if ([[timelineEntries objectAtIndex:entryCounter] revisionNumber] == index) {
            return [timelineEntries objectAtIndex:entryCounter];
        }
    }
    return NULL;
}

-(TimelineEntry*)getTimelineEntryAtIndex:(int)index
{
    return [timelineEntries objectAtIndex:index];
}

@end