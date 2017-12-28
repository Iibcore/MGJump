//
//  MGJump.m
//  MGJumpExample
//
//  Created by Luqiang on 2017/12/28.
//  Copyright © 2017年 libcore. All rights reserved.
//

#import "MGJump.h"

@implementation MGJump

+ (UIViewController *_Nullable)currentDisplayViewController {
    UIViewController *result = nil;
    id nextResponder = nil;
    
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    
    //rootViewController
    UIViewController *rootViewController = window.rootViewController;
    
    if (rootViewController.presentedViewController) {
        nextResponder = rootViewController.presentedViewController;
    }else{
        NSArray *subviews = [window subviews];
        for (UIView *frontView in subviews) {
            nextResponder = [frontView nextResponder];//  这方法下面有详解
            if (![nextResponder isKindOfClass:[UIWindow class]]) {
                break;
            }
        }
    }
    
    if ([nextResponder isKindOfClass:[UITabBarController class]]){
        UITabBarController * tabbar = (UITabBarController *)nextResponder;
        UINavigationController * nav = (UINavigationController *)tabbar.viewControllers[tabbar.selectedIndex];
        result = nav.childViewControllers.lastObject;
    }else if ([nextResponder isKindOfClass:[UINavigationController class]]){
        UIViewController * nav = (UIViewController *)nextResponder;
        result = nav.childViewControllers.lastObject;
    }else{
        result = nextResponder;
    }
    if ([result isKindOfClass:[UIViewController class]]) {
        return result;
    } else {
        return nil;
    }
}

+ (void)pushViewController:(UIViewController *_Nonnull)viewController animated:(BOOL)animated {
    [[self currentDisplayViewController].navigationController pushViewController:viewController animated:animated];
}

+ (void)pushViewController:(UIViewController *_Nonnull)viewController animated:(BOOL)animated hideBottomBar:(BOOL)isHide {
    UIViewController *currentViewController = [self currentDisplayViewController];
    if (!currentViewController.tabBarController || !isHide || currentViewController.tabBarController.tabBar.isHidden) {
        [self pushViewController:viewController animated:YES];
        return;
    }
    viewController.hidesBottomBarWhenPushed = isHide;
    [self pushViewController:viewController animated:YES];
}

+ (void)presentViewController:(UIViewController *_Nonnull)viewControllerToPresent animated:(BOOL)flag completion:(void (^ __nullable)(void))completion {
    [[self currentDisplayViewController] presentViewController:viewControllerToPresent animated:flag completion:completion];
}

@end
