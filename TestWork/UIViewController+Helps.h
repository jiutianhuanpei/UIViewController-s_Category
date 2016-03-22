//
//  UIViewController+Helps.h
//  TestWork
//
//  Created by shenhongbang on 16/3/22.
//  Copyright © 2016年 shenhongbang. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *const      SHBUSERLOGIN;
extern NSString *const      SHBUSERLOGOUT;



@interface UIViewController (Helps)

- (void)userDidLogin;
- (void)userDidLogout;

@end
