//
//	LYStatusBarStyleViewController.m
//  LYTopWindow_Example
//
//  Created by DeveloperLY on 16/2/21.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import "LYStatusBarStyleViewController.h"
#import <LYTopWindow/LYTopWindow.h>

@interface LYStatusBarStyleViewController ()

@end

@implementation LYStatusBarStyleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)changeHidden:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {
        [LYTopWindow sharedTopWindow].statusBarHidden = NO;
    } else {
        [LYTopWindow sharedTopWindow].statusBarHidden = YES;
    }
}

- (IBAction)changeStyle:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {
        [LYTopWindow sharedTopWindow].statusBarStyle = UIStatusBarStyleDefault;
    } else {
        [LYTopWindow sharedTopWindow].statusBarStyle = UIStatusBarStyleLightContent;
    }
}

#pragma mark - 状态栏控制
//- (BOOL)prefersStatusBarHidden {
//    return YES;
//}
//
//- (UIStatusBarStyle)preferredStatusBarStyle {
//    return UIStatusBarStyleLightContent;
//}

@end
