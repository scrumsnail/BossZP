//
//  LoginView.m
//  BossZP
//
//  Created by allthings_LuYD on 16/9/7.
//  Copyright © 2016年 scrum_snail. All rights reserved.
//

#import "LoginView.h"
#import "MainViewController.h"
#import "RegisterViewController.h"
@implementation LoginView

- (instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel{
    self.viewModel = (LoginViewModel *)viewModel;
    return [super initWithViewModel:viewModel];
}

- (void)updateConstraints {
    WS(weakSelf)
    [_usernameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).with.offset(10);
        make.left.equalTo(weakSelf.mas_left).with.offset(10);
        make.right.equalTo(weakSelf.mas_right).with.offset(-10);
        make.height.equalTo(@(50));
    }];

    [_passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_usernameTextField.mas_bottom).offset(20);
        make.left.equalTo(weakSelf.mas_left).offset(10);
        make.right.equalTo(weakSelf.mas_right).offset(-10);
        make.height.equalTo(_usernameTextField);
    }];

    [_forgetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_passwordTextField.mas_bottom).offset(10);
        make.right.equalTo(_passwordTextField.mas_right);
        make.height.equalTo(@(15));
    }];

    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_forgetBtn.mas_bottom).offset(30);
        make.left.equalTo(weakSelf).offset(50);
        make.right.equalTo(weakSelf).offset(-50);
        make.height.equalTo(@(50));
    }];

    [_registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf).offset(-10);
        make.centerX.equalTo(weakSelf);
        make.height.equalTo(@(20));
    }];
    [super updateConstraints];
}

- (void)ss_setupViews {
    [self addSubview:self.usernameTextField];
    [self addSubview:self.passwordTextField];
    [self addSubview:self.loginBtn];
    [self addSubview:self.registerBtn];
    [self addSubview:self.forgetBtn];
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}

- (void)ss_bindViewModel {
    [self ss_addReturnKeyBoard];
    @weakify(self)
    RACSignal * validNameSignal = [self.usernameTextField.rac_textSignal map:^id(NSString * text) {
        return @(text.length);
    }];
    RACSignal * validPassSignal = [self.passwordTextField.rac_textSignal map:^id(NSString * text) {
        return @(text.length);
    }];

    RAC(_loginBtn,enabled) = [RACSignal combineLatest:@[validNameSignal,validPassSignal] reduce:^id(NSNumber*usernameValid, NSNumber *passwordValid){
        BOOL valid = [usernameValid boolValue]&&[passwordValid boolValue];
        _loginBtn.alpha = valid ? 1: 0.8;
        return @(valid);
    }];


    [[_registerBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
        @strongify(self)
        [self.viewModel toRegister];
    }];

    [[_forgetBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
        @strongify(self)
        [self.viewModel toForgotPassword];
    }];

    [[_loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
        @strongify(self)
        [self.viewModel loginWithUserName:self.usernameTextField.text password:self.passwordTextField.text Success:^(id response) {
            MainViewController *main = [MainViewController new];
            [UIApplication sharedApplication].keyWindow.rootViewController = main;
        } failure:^(id x) {
            NSLog(@"%@",x);
        }];
    }];
}

- (BaseTextField *)usernameTextField {
    if (!_usernameTextField) {
        _usernameTextField = [BaseTextField new];
        [_usernameTextField resetTextFieldWithPlaceholder:@"用户名"];
    }
    return _usernameTextField;
}

- (BaseTextField *)passwordTextField {
    if (!_passwordTextField) {
        _passwordTextField = [BaseTextField new];
        [_passwordTextField resetTextFieldWithPlaceholder:@"密码"];
        _passwordTextField.secureTextEntry = YES;
    }
    return _passwordTextField;
}

- (BaseButton *)loginBtn {
    if (!_loginBtn) {
        _loginBtn = [BaseButton new];
        [_loginBtn resetButtonWithNormalImage:image(@"preRegister") selectedImage:image(@"preRegister_s") title:@"进入"];
    }
    return _loginBtn;
}

- (BaseButton *)registerBtn {
    if (!_registerBtn) {
        _registerBtn = [BaseButton new];
        [_registerBtn resetButtonWithNormalImage:nil selectedImage:nil title:@"创建一个帐号"];
        [_registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _registerBtn.titleLabel.font = [UIFont boldSystemFontOfSize:BASE_FONT_SIZE];
    }
    return _registerBtn;
}

- (BaseButton *)forgetBtn {
    if (!_forgetBtn) {
        _forgetBtn = [BaseButton new];
        [_forgetBtn resetButtonWithNormalImage:nil selectedImage:nil title:@"忘记密码了？"];
        [_forgetBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _forgetBtn.titleLabel.font = [UIFont systemFontOfSize:BASE_FONT_SIZE];
    }
    return _forgetBtn;
}

@end
