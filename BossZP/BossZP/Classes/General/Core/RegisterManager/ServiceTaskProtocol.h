//
//  ServiceTaskProtocol.h
//  BossZP
//
//  Created by allthings_LuYD on 16/9/7.
//  Copyright © 2016年 scrum_snail. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ServiceTaskProtocol <NSObject>
- (NSURLRequest *)taskRequest;
- (void)onGetResponse:(id)jsonObject
                error:(NSError *)error;
@end
