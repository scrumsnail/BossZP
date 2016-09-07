//
//  RegisterViewModel.h
//  BossZP
//
//  Created by allthings_LuYD on 16/9/7.
//  Copyright © 2016年 scrum_snail. All rights reserved.
//

#import "BaseViewModel.h"

@interface RegisterViewModel : BaseViewModel

- (void)registerUserWithNikeName:(NSString *)nikeName username:(NSString *)username password:(NSString *)password success:(Success)success failure:(Failure)failure;
@end
