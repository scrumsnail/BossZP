//
//  BaseViewProtocol.h
//  BossZP
//
//  Created by allthings_LuYD on 16/9/6.
//  Copyright © 2016年 scrum_snail. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BaseViewModelProtocol;

@protocol BaseViewProtocol <NSObject>

@optional

- (instancetype)initWithViewModel:(id <BaseViewModelProtocol>)viewModel;

- (void)ss_bindViewModel;
- (void)ss_setupViews;
- (void)ss_addReturnKeyBoard;

@end
