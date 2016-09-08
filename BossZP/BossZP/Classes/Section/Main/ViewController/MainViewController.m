//
//  MainViewController.m
//  BossZP
//
//  Created by allthings_LuYD on 16/9/8.
//  Copyright © 2016年 scrum_snail. All rights reserved.
//

#import "MainViewController.h"

#define TabbarVC    @"vc"
#define TabbarTitle @"title"
#define TabbarImage @"image"
#define TabbarSelectedImage @"selectedImage"
#define TabbarItemBadgeValue @"badgeValue"
#define TabBarCount 4

typedef NS_ENUM(NSInteger,MainTabType) {
    MainTabTypeJob,
    MainTabTypeCompany,
    MainTabTypeMessage,
    MainTabTypePersonal,
};
@interface MainViewController ()
@property (nonatomic,copy)  NSDictionary *configs;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpSubNav];

}

- (void)setUpSubNav{
    NSMutableArray *vcArray = [[NSMutableArray alloc] init];
    [self.tabbars enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSDictionary * item =[self vcInfoForTabType:[obj integerValue]];
        NSString *vcName = item[TabbarVC];
        NSString *title  = item[TabbarTitle];
        NSString *imageName = item[TabbarImage];
        NSString *imageSelected = item[TabbarSelectedImage];
        Class clazz = NSClassFromString(vcName);
        UIViewController *vc = [[clazz alloc] initWithNibName:nil bundle:nil];
        vc.hidesBottomBarWhenPushed = NO;
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        nav.tabBarItem = [[UITabBarItem alloc] initWithTitle:title
                                                       image:image(imageName)
                                               selectedImage:[image(imageSelected) imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        nav.tabBarItem.tag = idx;
        NSInteger badge = [item[TabbarItemBadgeValue] integerValue];
        if (badge) {
            nav.tabBarItem.badgeValue = [NSString stringWithFormat:@"%zd",badge];
        }

        [vcArray addObject:nav];
    }];
    self.viewControllers = [NSArray arrayWithArray:vcArray];
}

- (NSArray*)tabbars{
    NSMutableArray *items = [[NSMutableArray alloc] init];
    for (NSInteger tabbar = 0; tabbar < TabBarCount; tabbar++) {
        [items addObject:@(tabbar)];
    }
    return items;
}


#pragma mark - VC
- (NSDictionary *)vcInfoForTabType:(MainTabType)type{

    if (_configs == nil)
    {
        _configs = @{
                     @(MainTabTypeJob) : @{
                             TabbarVC           : @"JobViewController",
                             TabbarTitle        : @"",
                             TabbarImage        : @"tab_main",
                             TabbarSelectedImage: @"tab_main_s",
                             TabbarItemBadgeValue: @(0)
                             },
                     @(MainTabTypeCompany)      : @{
                             TabbarVC           : @"CompanyViewController",
                             TabbarTitle        : @"",
                             TabbarImage        : @"tab_company",
                             TabbarSelectedImage: @"tab_company_s",
                             TabbarItemBadgeValue: @(0)
                             },
                     @(MainTabTypeMessage)      : @{
                             TabbarVC           : @"MessageViewController",
                             TabbarTitle        : @"",
                             TabbarImage        : @"tab_contact",
                             TabbarSelectedImage: @"tab_contact_s",
                             },
                     @(MainTabTypePersonal)     : @{
                             TabbarVC           : @"PersonalViewController",
                             TabbarTitle        : @"",
                             TabbarImage        : @"tab_person",
                             TabbarSelectedImage: @"tab_person_s",
                             TabbarItemBadgeValue: @(0)
                             }
                     };

    }
    return _configs[@(type)];
}

- (void)viewWillLayoutSubviews{
    CGFloat offset = 5.0;
    for (UITabBarItem *item in self.tabBar.items) {
        item.imageInsets = UIEdgeInsetsMake(offset, 0, -offset, 0);
    }
}

@end
