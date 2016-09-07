//
//  BaseTextField.m
//  BossZP
//
//  Created by allthings_LuYD on 16/9/6.
//  Copyright © 2016年 scrum_snail. All rights reserved.
//

#import "BaseTextField.h"

@implementation BaseTextField

- (instancetype)init {
    self = [super init];
    if (self) {
        _horizontalSpace = 5;
        self.leftView = ({
            UIView * leftView = [[UIView alloc]initWithFrame:CGRectMake(_horizontalSpace, 0, self.frame.size.width - 2*_horizontalSpace, self.frame.size.height)];
            leftView.backgroundColor = [UIColor clearColor];
            leftView;
        });
        self.leftViewMode = UITextFieldViewModeAlways;
    }
    return self;
}

- (void)setHorizontalSpace:(CGFloat)horizontalSpace {
    _horizontalSpace = horizontalSpace;
    CGRect rect = CGRectMake(_horizontalSpace, 0, self.frame.size.width - 2*_horizontalSpace, self.frame.size.height);
    self.leftView.frame = rect;
}

- (void)resetTextFieldWithPlaceholder:(NSString *)placeholder{
    self.placeholder = placeholder;
    self.backgroundColor = [UIColor colorWithWhite:1 alpha:0.8];
    self.layer.cornerRadius = 10;
}
@end
