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
    RegisterViewController *r = [RegisterViewController new];
    r.r = @"eqeweqe";

    r.delegateSignal = [RACSubject subject];
    [r.delegateSignal subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    [rootNav pushViewController:[RegisterViewController new] animated:YES];
}

- (void)loginWithUserName:(NSString *)username password:(NSString *)password Success:(Success)success failure:(Failure)failure{
    [[[NIMSDK sharedSDK] loginManager] login:username token:[password MD5String] completion:^(NSError * _Nullable error) {
        if (error == nil) {
            NSDictionary *dic = @{
                                  @"username" : username,
                                  @"password" : password
                                  };
            [self saveUsername_password:dic];
            success(@YES);

        }else{
            failure(@"登录失败");
        }
    }];
}

- (void)saveUsername_password:(NSDictionary *)dic{
    [KeyChain save:KEY_USERNAME_PASSWORD data:dic];
}
@end
