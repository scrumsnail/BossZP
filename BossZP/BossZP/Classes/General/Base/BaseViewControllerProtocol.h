//
//  BaseViewControllerProtocol.h
//  BossZP
//
//  Created by allthings_LuYD on 16/9/6.
//  Copyright © 2016年 scrum_snail. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol BaseViewProtocol;

@protocol BaseViewControllerProtocol <NSObject>

@optional

- (instancetype)initWithViewModel:(id<BaseViewProtocol>)viewModel;

- (void)ss_bindView;
- (void)ss_addSubviews;
- (void)ss_layoutNavigation;
- (void)ss_getNewData;
- (void)recoverKeyboard;
@end
