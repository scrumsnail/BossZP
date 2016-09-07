//
//  LoginViewController.m
//  BossZP
//
//  Created by allthings_LuYD on 16/9/7.
//  Copyright © 2016年 scrum_snail. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"
#import "LoginViewModel.h"
@interface LoginViewController ()
@property (nonatomic,strong) LoginView *mainView;
@property (nonatomic,strong) LoginViewModel *viewModel;
@property (nonatomic,strong) UIImageView *backgroundView;
@property (nonatomic,strong) UIImageView *titleView;

@end

@implementation LoginViewController

- (void)ss_layoutNavigation{
    USE_CLEAR_BAR
}

- (void)ss_addSubviews{
    [self.view addSubview:self.backgroundView];
    [self.view addSubview:self.mainView];
    [self.view addSubview:self.titleView];
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
}

- (void)updateViewConstraints{
    WS(weakSelf)
    [self.backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view);
    }];

    [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view).with.offset(20);
        make.right.equalTo(weakSelf.view).with.offset(-20);
        make.top.equalTo(weakSelf.view).with.offset(140);
        make.height.equalTo(@80);
    }];

    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.view).with.offset(0);
        make.left.equalTo(weakSelf.view).with.offset(0);
        make.right.equalTo(weakSelf.view).with.offset(0);
        make.top.equalTo(weakSelf.titleView).with.offset(120);
    }];

    [super updateViewConstraints];
}

- (void)ss_bindView{
    [self recoverKeyboard];
}

- (LoginView *)mainView {
    if (!_mainView) {
        _mainView = [[LoginView alloc]initWithViewModel:self.viewModel];
    }
    return _mainView;
}

- (LoginViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[LoginViewModel alloc]init];
    }
    return _viewModel;
}

- (UIImageView *)backgroundView {
    if (!_backgroundView) {
        _backgroundView = [UIImageView new];
        _backgroundView.image = image(@"preview_selectbg@2x.jpg");
    }
    return _backgroundView;
}

- (UIImageView *)titleView{
    if (!_titleView) {
        _titleView = [UIImageView new];
        _titleView.image = image(@"preview_logo");
    }
    return _titleView;
}
@end
