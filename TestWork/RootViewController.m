//
//  RootViewController.m
//  TestWork
//
//  Created by shenhongbang on 16/3/22.
//  Copyright © 2016年 shenhongbang. All rights reserved.
//

#import "RootViewController.h"
#import "UIViewController+Helps.h"
//#import "FirstRootController.h"
//#import "SecondRootController.h"

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
//    UINavigationController *first = [self creatNaByClass:[FirstRootController class] title:@"first"];
//    UINavigationController *second = [self creatNaByClass:[SecondRootController class] title:@"Second"];
//    
//    self.viewControllers = @[first, second];
    
    UINavigationController *first = [self creatNaByClassName:@"FirstRootController" title:@"First"];
    UINavigationController *second = [self creatNaByClassName:@"SecondRootController" title:@"Second"];
    self.viewControllers = @[first, second];

    
    [self createBtn:@"Login" action:@selector(login:) frame:CGRectMake(30, 100, 50, 40)];
    [self createBtn:@"Logout" action:@selector(logout:) frame:CGRectMake(30, 160, 50, 50)];
    
    
}

- (void)login:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:SHBUSERLOGIN object:nil];
}

- (void)logout:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:SHBUSERLOGOUT object:nil];
}

- (UIButton *)createBtn:(NSString *)title action:(SEL)action frame:(CGRect)frame {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    btn.frame = frame;
    [self.view addSubview:btn];
    return btn;
}

- (UINavigationController *)creatNaByClass:(Class)class title:(NSString *)title {
    id controller = [[class alloc] init];
    [controller setTitle:title];
    UINavigationController *na = [[UINavigationController alloc] initWithRootViewController:controller];
    return na;
}

- (UINavigationController *)creatNaByClassName:(NSString *)className title:(NSString *)title {
    Class class = NSClassFromString(className);
    
    UINavigationController *nv = [self creatNaByClass:class title:title];
    
    return nv;
}

@end
