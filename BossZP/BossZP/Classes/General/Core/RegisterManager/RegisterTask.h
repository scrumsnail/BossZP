//
//  RegisterTask.h
//  BossZP
//
//  Created by allthings_LuYD on 16/9/7.
//  Copyright © 2016年 scrum_snail. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RegisterData.h"
#import "ServiceTaskProtocol.h"
typedef void(^RegisterHandler)(NSError *error,NSString *errorMsg);
@interface RegisterTask : NSObject<ServiceTaskProtocol>
@property (nonatomic,copy) RegisterHandler handler;
@property (nonatomic,strong) RegisterData *data;
@end
