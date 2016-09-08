//
//  JobViewModel.m
//  BossZP
//
//  Created by allthings_LuYD on 16/9/8.
//  Copyright © 2016年 scrum_snail. All rights reserved.
//

#import "JobViewModel.h"

@implementation JobViewModel

- (void)ss_initialize{
    _dataArray = [NSMutableArray array];
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@"ios",@"android",@"PHP",@"java",@"H5", nil];
    for (int i = 0; i < array.count; i++) {
        JobModel *model = [[JobModel alloc] init];
        model.job = array[i];
        [_dataArray addObject:model];
    }
}

@end
