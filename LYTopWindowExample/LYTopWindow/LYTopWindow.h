//
//  LYTopWindow.h
//  LYTopWindow
//
//  Created by Y Liu on 16/2/21.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYTopWindow : UIWindow

/**
 *  单例创建方法
 *
 *  @return LYTopWindow 单例对象
 */
+ (instancetype)sharedTopWindow;

/** 点击状态栏的时候调用 */
@property (nonatomic, copy) void (^clickStatusBarBlock)();

/** 状态栏的显示/隐藏 */
@property (nonatomic, assign, getter=isStatusBarHidden) BOOL statusBarHidden;

/** 状态栏的显示样式 */
@property (nonatomic, assign) UIStatusBarStyle statusBarStyle;

/** 查找当前View中的ScrollView,让UIScrollView滚动到最前面 */
- (void)searchAllScrollViewsInView:(UIView *)view;

@end
