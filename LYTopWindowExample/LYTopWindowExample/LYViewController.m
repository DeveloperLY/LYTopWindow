//
//  LYViewController.m
//  LYTopWindowExample
//
//  Created by Y Liu on 16/2/27.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import "LYViewController.h"
#import "LYTopWindow.h"

@interface LYViewController ()

@end

@implementation LYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
//- (BOOL)prefersStatusBarHidden
//{
//    return YES;
//}
//
//- (UIStatusBarStyle)preferredStatusBarStyle
//{
//    return UIStatusBarStyleLightContent;
//}

@end
