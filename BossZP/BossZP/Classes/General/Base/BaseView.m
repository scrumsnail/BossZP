//
//  BaseView.m
//  BossZP
//
//  Created by allthings_LuYD on 16/9/6.
//  Copyright © 2016年 scrum_snail. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self ss_setupViews];
        [self ss_bindViewModel];
    }
    return self;
}

- (instancetype)initWithViewModel:(id<BaseViewProtocol>)viewModel {
    self = [super init];
    if (self) {
        [self ss_setupViews];
        [self ss_bindViewModel];
    }
    return self;
}

#pragma mark -- RAC --
//绑定V与VM
- (void)ss_bindViewModel {}

//添加子View到主View
- (void)ss_setupViews {}

//设置点击空白键盘回收
- (void)ss_addReturnKeyBoard {
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]init];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [tap.rac_gestureSignal subscribeNext:^(id x) {

        [[UIApplication sharedApplication].keyWindow endEditing:YES];
    }];
    [self addGestureRecognizer:tap];
}

@end
