//
//  LoginViewModel.m
//  BossZP
//
//  Created by allthings_LuYD on 16/9/7.
//  Copyright © 2016年 scrum_snail. All rights reserved.
//

#import "LoginViewModel.h"
#import "ForgotViewController.h"
#import "RegisterViewController.h"
@implementation LoginViewModel

- (void)toForgotPassword{
    UINavigationController *rootNav = (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    [rootNav pushViewController:[ForgotViewController new] animated:YES];
}

- (void)toRegister{
    UINavigationController *rootNav = (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    [rootNav pushViewController:[RegisterViewController new] animated:YES];
}

- (void)loginWithUserName:(NSString *)username password:(NSString *)password Success:(Success)success failure:(Failure)failure{
    [[[NIMSDK sharedSDK] loginManager] login:username token:[password MD5String] completion:^(NSError * _Nullable error) {
        if (error == nil) {
            success(@YES);
        }else{
            failure(@"登录失败");
        }
    }];
}
@end
