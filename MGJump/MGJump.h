//
//  MGJump.h
//  MGJumpExample
//
//  Created by Luqiang on 2017/12/28.
//  Copyright © 2017年 libcore. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MGJump : NSObject

/**
 *  获取当前显示的ViewController
 */
+ (UIViewController *_Nullable)currentDisplayViewController;

/**
 *  pushViewController: animated:
 */
+ (void)pushViewController:(UIViewController *_Nonnull)viewController animated:(BOOL)animated;

/**
 *  pushViewController: animated: hideBottomBar:
 */
+ (void)pushViewController:(UIViewController *_Nonnull)viewController animated:(BOOL)animated hideBottomBar:(BOOL)isHide;

/**
 *  presentViewController: animated: completion:
 */
+ (void)presentViewController:(UIViewController *_Nonnull)viewControllerToPresent animated:(BOOL)flag completion:(void (^ __nullable)(void))completion;

@end
