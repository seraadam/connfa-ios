//
//  DCSpeakerCell.h
//  DrupalCon
//
//  Created by Volodymyr Hyrka on 8/26/14.
//  Copyright (c) 2014 Lemberg Solution. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DCSpeakerCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView* pictureImg;
@property (nonatomic, weak) IBOutlet UILabel * nameLbl;
@property (nonatomic, weak) IBOutlet UILabel * positionTitleLbl;

+ (float)cellHeight;

@end
