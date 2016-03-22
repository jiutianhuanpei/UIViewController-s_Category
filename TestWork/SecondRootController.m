//
//  SecondRootController.m
//  TestWork
//
//  Created by shenhongbang on 16/3/22.
//  Copyright © 2016年 shenhongbang. All rights reserved.
//

#import "SecondRootController.h"
#import "UIViewController+Helps.h"

@implementation SecondRootController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
}

- (void)userDidLogin {
    NSLog(@"%s", __FUNCTION__);
}

- (void)userDidLogout {
    NSLog(@"%s", __FUNCTION__);
}

@end
