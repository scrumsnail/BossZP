//
//  MainView.m
//  BossZP
//
//  Created by allthings_LuYD on 16/9/7.
//  Copyright © 2016年 scrum_snail. All rights reserved.
//

#import "MainView.h"

@implementation MainView

- (void)ss_setupViews{
    [self addSubview:self.welcomView];
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}

- (void)updateConstraints{
    WS(weakSelf)
    [self.welcomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf);
    }];
    [super updateConstraints];
}

- (UIImageView *)welcomView{
    if (!_welcomView) {
        _welcomView = [UIImageView new];
        _welcomView.image = image(@"welcomelogo2");
    }
    return _welcomView;
}

@end
