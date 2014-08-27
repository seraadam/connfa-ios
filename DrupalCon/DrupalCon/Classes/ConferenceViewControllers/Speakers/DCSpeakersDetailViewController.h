//
//  DCSpeakersDetailViewController.h
//  DrupalCon
//
//  Created by Volodymyr Hyrka on 8/27/14.
//  Copyright (c) 2014 Lemberg Solution. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DCBaseViewController.h"

@class DCSpeaker;
@interface DCSpeakersDetailViewController : DCBaseViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) DCSpeaker * speaker;

@end
