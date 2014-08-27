//
//  DCProgram+DC.m
//  DrupalCon
//
//  Created by Volodymyr Hyrka on 8/20/14.
//  Copyright (c) 2014 Lemberg Solution. All rights reserved.
//

#import "DCProgram+DC.h"
#import "DCEvent+DC.h"
#import "DCType+DC.h"
#import "DCTime+DC.h"
#import "DCTimeRange+DC.h"

#import "NSDate+DC.h"

#import "DCMainProxy.h"

@implementation DCProgram (DC)

+ (void)parceFromJSONData:(NSData *)jsonData
{
    NSError * err = nil;
    NSDictionary * eventItems = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                options:kNilOptions
                                                                  error:&err];
    if (err)
    {
        NSLog(@"WRONG! json");
        return;
    }
    
    for (NSDictionary * day in eventItems[kDCEvent_days_key])
    {
        NSDate * date = [NSDate fabricateWithEventString:day[kDCEvent_date_key]];
        for (NSDictionary * event in day[kDCEvent_events_key])
        {
            DCProgram * programInstance = [[DCMainProxy sharedProxy] createProgramItem];
            programInstance.date = date;
            programInstance.name = event[kDCEvent_name_key];
            programInstance.favorite = @NO;
            programInstance.place = @"default place";
            programInstance.desctiptText = @"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.";
            programInstance.level = event[kDCEvent_experienceLevel_key];
            programInstance.timeRange = [[DCMainProxy sharedProxy] createTimeRange];
            [programInstance.timeRange setFrom:event[kDCEvent_from_key] to:event[kDCEvent_to_key]];
            programInstance.track = event[kDCEvent_track_key];
            programInstance.speakers = event[kDCEvent_speaker_key];
            
            [programInstance addTypeForID:[event[kDCEvent_type_key] integerValue]];
        }
    }
}

- (void)addTypeForID:(int)typeID
{
    DCType * type = [[DCMainProxy sharedProxy] typeForID:typeID];
    if (!type)
    {
        type = [[DCMainProxy sharedProxy] createType];
        type.name = @"noname";
        type.typeID = @(typeID);
    }
    [type addEventsObject:self];
}

@end
