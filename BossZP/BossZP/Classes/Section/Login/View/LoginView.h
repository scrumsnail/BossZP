//
//  LoginView.h
//  BossZP
//
//  Created by allthings_LuYD on 16/9/7.
//  Copyright © 2016年 scrum_snail. All rights reserved.
//

#import "BaseView.h"
#import "LoginViewModel.h"
#import "BaseTextField.h"
@interface LoginView : BaseView

@property(nonatomic,strong) LoginViewModel *viewModel;
@property(nonatomic,strong) BaseTextField *usernameTextField;
@property(nonatomic,strong) BaseTextField *passwordTextField;
@property(nonatomic,strong) UIButton *loginBtn;
@property(nonatomic,strong) UIButton *forgetBtn;
@property(nonatomic,strong) UIButton *registerBtn;

@end
