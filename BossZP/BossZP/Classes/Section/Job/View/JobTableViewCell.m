//
//  JobTableViewCell.m
//  BossZP
//
//  Created by allthings_LuYD on 16/9/8.
//  Copyright © 2016年 scrum_snail. All rights reserved.
//

#import "JobTableViewCell.h"

@implementation JobTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = [UIColor blueColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self createUI];
    }
    return self;
}

- (void)createUI{
    [self.contentView addSubview:self.testLable];
    [self.testLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
}

- (void)setJobModel:(JobModel *)jobModel{
    _jobModel = jobModel;
    self.testLable.text = jobModel.job;
    [self layoutIfNeeded];
}

- (UILabel *)testLable{
    if (!_testLable) {
        _testLable = [UILabel new];
        _testLable.numberOfLines = 0;
        _testLable.textColor = [UIColor redColor];
    }
    return _testLable;
}
@end
