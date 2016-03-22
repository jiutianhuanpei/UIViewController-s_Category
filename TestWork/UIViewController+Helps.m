//
//  UIViewController+Helps.m
//  TestWork
//
//  Created by shenhongbang on 16/3/22.
//  Copyright © 2016年 shenhongbang. All rights reserved.
//

#import "UIViewController+Helps.h"
#import <objc/runtime.h>

NSString *const SHBUSERLOGIN = @"SHBUSERLOGIN";
NSString *const SHBUSERLOGOUT = @"SHBUSERLOGOUT";

@implementation UIViewController (Helps)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class class = [self class];
        
        SEL didLoad = @selector(viewDidLoad);
        SEL tempDidLoad = @selector(shb_viewDidLoad);
        
        Method didLoadMethod = class_getInstanceMethod(class, didLoad);
        Method tempDidLoadMethod = class_getInstanceMethod(class, tempDidLoad);
        
        /**
         *  为指定的类 class 添加一个新方法
         *
         *  @param class             为这个类添加方法
         *  @param didLoad           用于给指定的方法添加一个新的方法
         
         *  @param imp               函数的新方法的实现
         *  @param types             描述的字符数组的类型参数的方法
         
         *  @param tempDidLoadMethod 新的方法
         *
         *  @return                  是否添加成功
         */
        BOOL addDidLoad = class_addMethod(class, didLoad, method_getImplementation(tempDidLoadMethod), method_getTypeEncoding(tempDidLoadMethod));
        if (addDidLoad) {
            /**
             *  取代一个类的中指定的实现方法
             *
             *  @param class         就是这个类
             *  @param tempDidLoad   要取代的方法
             *  @param didLoadMethod 就是用这个方法来取代旧方法
             *
             *  @return 
             */
            class_replaceMethod(class, tempDidLoad, method_getImplementation(didLoadMethod), method_getTypeEncoding(didLoadMethod));
        } else {
            /**
             *  交换两个方法的实现
             */
            method_exchangeImplementations(didLoadMethod, tempDidLoadMethod);
        }
        
        
        
        SEL didUnload = @selector(viewDidUnload);
        SEL tempDidUnload = @selector(shb_viewDidUnload);
        
        Method didUnloadMethod = class_getInstanceMethod(class, didUnload);
        Method tempDidUnloadMethod = class_getInstanceMethod(class, tempDidUnload);
        
        BOOL addDidUnload = class_addMethod(class, didUnload, method_getImplementation(tempDidUnloadMethod), method_getTypeEncoding(tempDidUnloadMethod));
        
        if (addDidUnload) {
            class_replaceMethod(class, tempDidUnload, method_getImplementation(didUnloadMethod), method_getTypeEncoding(didUnloadMethod));
        } else {
            method_exchangeImplementations(didUnloadMethod, tempDidUnloadMethod);
        }
    });
}

- (void)shb_viewDidLoad {
    [self shb_viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userDidLogin) name:SHBUSERLOGIN object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userDidLogout) name:SHBUSERLOGOUT object:nil];
}

- (void)userDidLogin {
    NSLog(@"Controller Category Login");
}

-(void)userDidLogout {
    NSLog(@"Controller Category Logout");
}

- (void)shb_viewDidUnload {
    [self shb_viewDidUnload];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}


@end
