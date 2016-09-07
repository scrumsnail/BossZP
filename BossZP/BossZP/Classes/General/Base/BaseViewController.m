//
//  BaseViewController.m
//  BossZP
//
//  Created by allthings_LuYD on 16/9/6.
//  Copyright © 2016年 scrum_snail. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    BaseViewController * viewController = [super allocWithZone:zone];
    @weakify(viewController)

    [[viewController rac_signalForSelector:@selector(viewWillAppear:)]subscribeNext:^(id x){

        @strongify(viewController);
        [viewController ss_layoutNavigation];
        [viewController ss_getNewData];
    }];

    [[viewController rac_signalForSelector:@selector(viewDidLoad)]subscribeNext:^(id x) {

        @strongify(viewController)
        viewController.view.backgroundColor = [UIColor blackColor];
        [viewController layoutBackItem];
        [viewController ss_addSubviews];
        [viewController ss_bindView];
    }];

    return viewController;
}


#pragma mark -- RAC --
//添加View到ViewController
- (void)ss_addSubviews {}

//用来绑定V(VC)与VM
- (void)ss_bindView {}

//初次获取数据的时候调用（不是特别必要）
- (void)ss_getNewData {}

//设置导航栏、分栏
- (void)ss_layoutNavigation {}

- (void)recoverKeyboard {
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]init];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [tap.rac_gestureSignal subscribeNext:^(id x) {

        [[UIApplication sharedApplication].keyWindow endEditing:YES];
    }];
    [self.view addGestureRecognizer:tap];
}


- (void)layoutBackItem{
    UIImage *buttonNormal = [image(@"back_cycle") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self.navigationController.navigationBar setBackIndicatorImage:buttonNormal];
    [self.navigationController.navigationBar setBackIndicatorTransitionMaskImage:buttonNormal];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backItem;
}
@end
