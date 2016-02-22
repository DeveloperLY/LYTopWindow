//
//  LYTopRootController.m
//  LYTopWindow
//
//  Created by Y Liu on 16/2/21.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//

#import "LYTopRootController.h"
#import "LYTopWindow.h"

@class LYTopWindow;

@implementation LYTopRootController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor clearColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    ![LYTopWindow sharedTopWindow].clickStatusBarBlock ?  : [LYTopWindow sharedTopWindow].clickStatusBarBlock();
}

#pragma mark - 状态栏
- (BOOL)prefersStatusBarHidden {
    return [LYTopWindow sharedTopWindow].statusBarHidden;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return [LYTopWindow sharedTopWindow].statusBarStyle;
}

@end
