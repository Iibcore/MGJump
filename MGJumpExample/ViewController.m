//
//  ViewController.m
//  MGJumpExample
//
//  Created by Luqiang on 2017/12/28.
//  Copyright © 2017年 libcore. All rights reserved.
//

#import "ViewController.h"
#import "MGJump.h"

@interface ViewController ()

@property (nonatomic, strong) UIViewController *vc;

@end

@implementation ViewController
- (IBAction)push:(id)sender {
    [MGJump pushViewController:self.vc animated:YES];
}
- (IBAction)pushHiddenTabBar:(id)sender {
    [MGJump pushViewController:self.vc animated:YES hideBottomBar:YES];
}
- (IBAction)present:(id)sender {
    __weak typeof(self) weakSelf = self;
    [MGJump presentViewController:self.vc animated:YES completion:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf.vc dismissViewControllerAnimated:YES completion:nil];
        });
    }];
}

- (UIViewController *)vc {
    if (!_vc) {
        _vc = [UIViewController new];
        _vc.view.backgroundColor = [UIColor blackColor];
    }
    return _vc;
}

@end
