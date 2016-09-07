//
//  UtilsMacro.h
//  BossZP
//
//  Created by allthings_LuYD on 16/9/7.
//  Copyright © 2016年 scrum_snail. All rights reserved.
//

#ifndef UtilsMacro_h
#define UtilsMacro_h
typedef void(^Success)(id response);
typedef void(^Failure)(id x);
typedef void(^Error)(NSError * error);
#define UIScreenWidth  [UIScreen mainScreen].bounds.size.width
#define UIScreenHeight [UIScreen mainScreen].bounds.size.height
#define BASE_FONT_SIZE 14


#pragma mark - UIColor宏定义
#define UIColorFromRGBA(rgbValue, alphaValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0x0000FF))/255.0 \
alpha:alphaValue]

#define UIColorFromRGB(rgbValue) UIColorFromRGBA(rgbValue, 1.0)
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
#define image(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"BossZPKit.bundle/%@",imageName]]
#define USE_CLEAR_BAR    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];[self.navigationController.navigationBar setShadowImage:[UIImage new]];

#endif /* UtilsMacro_h */
