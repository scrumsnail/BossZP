//
//  RegisterView.m
//  BossZP
//
//  Created by allthings_LuYD on 16/9/7.
//  Copyright © 2016年 scrum_snail. All rights reserved.
//

#import "RegisterView.h"

@implementation RegisterView

- (instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel{
    self.viewModel = (RegisterViewModel *)viewModel;
    return [super initWithViewModel:viewModel];
}

- (void)updateConstraints {
    WS(weakSelf)
    [_nikeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(10);
        make.left.equalTo(weakSelf.mas_left).offset(10);
        make.right.equalTo(weakSelf.mas_right).offset(-10);
        make.height.equalTo(_usernameTextField);
    }];

    [_usernameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_nikeTextField.mas_bottom).with.offset(20);
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

    [_registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_passwordTextField.mas_bottom).offset(30);
        make.left.equalTo(weakSelf).offset(50);
        make.right.equalTo(weakSelf).offset(-50);
        make.height.equalTo(@(50));
    }];

    [super updateConstraints];
}

- (void)ss_setupViews {
    [self addSubview:self.usernameTextField];
    [self addSubview:self.passwordTextField];
    [self addSubview:self.nikeTextField];
    [self addSubview:self.registerBtn];
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}

- (void)ss_bindViewModel {
    [self ss_addReturnKeyBoard];
    @weakify(self)
    RACSignal *validNameSignal = [self.usernameTextField.rac_textSignal map:^id(NSString * text) {
        return @(text.length);
    }];
    RACSignal *validPassSignal = [self.passwordTextField.rac_textSignal map:^id(NSString * text) {
        return @(text.length);
    }];
    RACSignal *validNikeSignal = [self.nikeTextField.rac_textSignal map:^id(NSString * text) {
        return @(text.length);
    }];

    RAC(_registerBtn,enabled) = [RACSignal combineLatest:@[validNameSignal,validPassSignal,validNikeSignal] reduce:^id(NSNumber*usernameValid, NSNumber *passwordValid,NSNumber *nikeValid){
        BOOL valid = [usernameValid boolValue]&&[passwordValid boolValue]&&[nikeValid boolValue];
        _registerBtn.alpha = valid ? 1: 0.8;
        return @(valid);
    }];

    [[_registerBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
        @strongify(self)
        [self.viewModel registerUserWithNikeName:self.nikeTextField.text username:self.usernameTextField.text password:self.passwordTextField.text success:^(id response) {
            UINavigationController *root = (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController;
            [root popViewControllerAnimated:YES];
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

- (BaseTextField *)nikeTextField{
    if (!_nikeTextField) {
        _nikeTextField = [BaseTextField new];
        [_nikeTextField resetTextFieldWithPlaceholder:@"昵称"];
    }
    return _nikeTextField;
}

- (BaseButton *)registerBtn {
    if (!_registerBtn) {
        _registerBtn = [BaseButton new];
        [_registerBtn resetButtonWithNormalImage:image(@"preRegister") selectedImage:image(@"preRegister_s") title:@"注册"];
    }
    return _registerBtn ;
}
@end
