//
//  MainViewController.m
//  BossZP
//
//  Created by allthings_LuYD on 16/9/7.
//  Copyright © 2016年 scrum_snail. All rights reserved.
//

#import "MainViewController.h"
#import "MainView.h"
#import "LoginViewController.h"
@interface MainViewController ()
@property (nonatomic,strong) MainView *mainView;
@end

@implementation MainViewController

- (void)ss_layoutNavigation{
    USE_CLEAR_BAR
}

- (void)updateViewConstraints{
    WS(weakSelf)
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakSelf.view);
        make.height.equalTo(@100);
        make.left.equalTo(weakSelf.view).with.offset(10);
        make.right.equalTo(weakSelf.view).with.offset(-10);
    }];
    [super updateViewConstraints];
}

- (void)ss_addSubviews{
    [self.view addSubview:self.mainView];
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
}

- (MainView *)mainView{
    if (!_mainView) {
        _mainView = [MainView new];
    }
    return _mainView;
}

//登出
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [[[NIMSDK sharedSDK] loginManager] logout:^(NSError * _Nullable error) {
        if (error == nil) {
            [UIApplication sharedApplication].keyWindow.rootViewController = [LoginViewController new];
        }
    }];
}
@end
