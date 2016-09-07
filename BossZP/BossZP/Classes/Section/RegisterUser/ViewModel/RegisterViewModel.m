//
//  RegisterViewModel.m
//  BossZP
//
//  Created by allthings_LuYD on 16/9/7.
//  Copyright © 2016年 scrum_snail. All rights reserved.
//

#import "RegisterViewModel.h"
#import "RegisterService.h"
#import "RegisterData.h"
@implementation RegisterViewModel

- (void)registerUserWithNikeName:(NSString *)nikeName username:(NSString *)username password:(NSString *)password success:(Success)success failure:(Failure)failure{
    RegisterData *data = [[RegisterData alloc] init];
    data.account = username;
    data.nickname = nikeName;
    data.token = [password MD5String];
    [[RegisterService sharedService] registerUser:data completion:^(NSError *error, NSString *errorMsg) {
        if (error == nil) {
            success(@YES);
        }else{
            failure(errorMsg);
        }
    }];
}

@end
