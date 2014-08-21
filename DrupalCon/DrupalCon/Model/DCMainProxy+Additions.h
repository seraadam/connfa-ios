//
//  DCMainProxy+Additions.h
//  DrupalCon
//
//  Created by Volodymyr Hyrka on 8/21/14.
//  Copyright (c) 2014 Lemberg Solution. All rights reserved.
//

#import "DCMainProxy.h"

@interface DCMainProxy (Additions)

#pragma mark - 

- (NSArray*)days;
- (NSArray*)programEventsForDayNum:(NSInteger)dayNum;
- (NSArray*)timeRangesForDayNum:(NSInteger)dayNum;

#pragma mark -

@end