//
//  JobTableViewCell.h
//  BossZP
//
//  Created by allthings_LuYD on 16/9/8.
//  Copyright © 2016年 scrum_snail. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JobModel.h"
@interface JobTableViewCell : UITableViewCell
@property (nonatomic,strong) UILabel *testLable;
@property (nonatomic,strong) JobModel *jobModel;
@end
