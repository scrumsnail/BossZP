//
//  RegisterViewController.h
//  BossZP
//
//  Created by allthings_LuYD on 16/9/7.
//  Copyright © 2016年 scrum_snail. All rights reserved.
//

#import "BaseViewController.h"

@interface RegisterViewController : BaseViewController
@property (nonatomic,copy) NSString *r;
@property (nonatomic,strong) RACSubject *delegateSignal;
@end
