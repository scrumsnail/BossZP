//
//  BaseButton.m
//  BossZP
//
//  Created by allthings_LuYD on 16/9/7.
//  Copyright © 2016年 scrum_snail. All rights reserved.
//

#import "BaseButton.h"

@implementation BaseButton

- (instancetype)init{
    if (self = [super init]) {
        
    }
    return self;
}

- (void)resetButtonWithNormalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage title:(NSString *)title{
    [self setTitle:title forState:UIControlStateNormal];
    [self setBackgroundImage:normalImage forState:UIControlStateNormal];
    [self setBackgroundImage:selectedImage forState:UIControlStateSelected];
    self.layer.cornerRadius = 10;
    self.layer.masksToBounds = YES;
}
@end
