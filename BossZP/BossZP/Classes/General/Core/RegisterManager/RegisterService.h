//
//  RegisterService.h
//  BossZP
//
//  Created by allthings_LuYD on 16/9/7.
//  Copyright © 2016年 scrum_snail. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RegisterTask.h"
@interface RegisterService : NSObject
+ (instancetype)sharedService;
- (void)registerUser:(RegisterData *)data
          completion:(RegisterHandler)completion;
@end
