//
//  JobViewController.m
//  BossZP
//
//  Created by allthings_LuYD on 16/9/8.
//  Copyright © 2016年 scrum_snail. All rights reserved.
//

#import "JobViewController.h"
#import "LoginViewController.h"
#import "JobViewModel.h"
#import "JobView.h"
@interface JobViewController ()
@property (nonatomic,strong) JobView *mainView;
@property (nonatomic,strong) JobViewModel *viewModel;
@end

@implementation JobViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [[[NIMSDK sharedSDK] loginManager] logout:^(NSError * _Nullable error) {
        [UIApplication sharedApplication].keyWindow.rootViewController = [LoginViewController new];
    }];
}

- (void)ss_layoutNavigation{
    self.navigationItem.title = @"职位";
}

- (void)ss_addSubviews{
    [self.view addSubview:self.mainView];
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
}

- (void)updateViewConstraints{
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [super updateViewConstraints];
}

- (JobView *)mainView{
    if (!_mainView) {
        _mainView = [[JobView alloc] initWithViewModel:self.viewModel];
    }
    return _mainView;
}

- (JobViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [JobViewModel new];
    }
    return _viewModel;
}
@end
