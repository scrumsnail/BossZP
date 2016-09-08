//
//  JobView.h
//  BossZP
//
//  Created by allthings_LuYD on 16/9/8.
//  Copyright © 2016年 scrum_snail. All rights reserved.
//

#import "BaseView.h"
#import "JobViewModel.h"
#import "JobTableViewCell.h"
#import "JobModel.h"
@interface JobView : BaseView<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) JobViewModel *viewModel;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataArray;
@end
