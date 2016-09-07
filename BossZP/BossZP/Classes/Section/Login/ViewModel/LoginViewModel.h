//
//  LoginViewModel.h
//  BossZP
//
//  Created by allthings_LuYD on 16/9/7.
//  Copyright © 2016年 scrum_snail. All rights reserved.
//

#import "BaseViewModel.h"

@interface LoginViewModel : BaseViewModel
- (void)loginWithUserName:(NSString *)username password:(NSString *)password Success:(Success)success failure:(Failure)failure;

- (void)toRegister;

- (void)toForgotPassword;
@end
