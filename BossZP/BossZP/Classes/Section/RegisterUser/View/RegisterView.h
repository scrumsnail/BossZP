//
//  RegisterView.h
//  BossZP
//
//  Created by allthings_LuYD on 16/9/7.
//  Copyright © 2016年 scrum_snail. All rights reserved.
//

#import "BaseView.h"
#import "BaseTextField.h"
#import "RegisterViewModel.h"
#import "BaseButton.h"
@interface RegisterView : BaseView

@property(nonatomic,strong) BaseTextField *usernameTextField;
@property(nonatomic,strong) BaseTextField *passwordTextField;
@property(nonatomic,strong) BaseTextField *nikeTextField;
@property(nonatomic,strong) BaseButton *registerBtn;
@property (nonatomic,strong) RegisterViewModel *viewModel;
@end
