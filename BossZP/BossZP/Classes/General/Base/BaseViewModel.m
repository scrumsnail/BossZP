//
//  BaseViewModel.m
//  BossZP
//
//  Created by allthings_LuYD on 16/9/6.
//  Copyright © 2016年 scrum_snail. All rights reserved.
//

#import "BaseViewModel.h"

@implementation BaseViewModel

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    BaseViewModel * viewModel = [super allocWithZone:zone];
    if (viewModel) {
        [viewModel ss_initialize];
    }
    return viewModel;
}

#pragma mark -- RAC --
//进行一些逻辑绑定，网络数据请求处理
- (void)ss_initialize {}
@end
