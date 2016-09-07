//
//  BaseViewModelProtocol.h
//  BossZP
//
//  Created by allthings_LuYD on 16/9/6.
//  Copyright © 2016年 scrum_snail. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol BaseViewModelProtocol <NSObject>

@optional

- (instancetype)initWithModel:(id)model;
- (void)ss_initialize;

@end
