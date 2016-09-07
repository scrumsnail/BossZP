//
//  RegisterService.m
//  BossZP
//
//  Created by allthings_LuYD on 16/9/7.
//  Copyright © 2016年 scrum_snail. All rights reserved.
//

#import "RegisterService.h"

@implementation RegisterService

+ (instancetype)sharedService{
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[[self class] alloc] init];
    });
    return instance;
}

- (void)registerUser:(RegisterData *)data completion:(RegisterHandler)completion{
    RegisterTask *task = [[RegisterTask alloc] init];
    task.data = data;
    task.handler = completion;
    [self runTask:task];
}

- (void)runTask:(id<ServiceTaskProtocol>)task {
    NSURLRequest *request = [task taskRequest];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        id jsonObject = nil;
        NSError *error = connectionError;
        if (connectionError == nil &&
            [response isKindOfClass:[NSHTTPURLResponse class]] &&
            [(NSHTTPURLResponse *)response statusCode] == 200){
            if (data){
                jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            }else{
                error = [NSError errorWithDomain:@"ntes domain" code:-1 userInfo:@{@"description" : @"invalid data"}];
            }
        }
        [task onGetResponse:jsonObject error:error];
    }];
}

@end
