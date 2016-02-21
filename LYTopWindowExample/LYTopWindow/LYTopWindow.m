//
//  LYTopWindow.m
//  LYTopWindow
//
//  Created by Y Liu on 16/2/21.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//

#import "LYTopWindow.h"
#import "LYTopRootController.h"

@interface LYTopWindow () <NSCopying, NSMutableCopying>

@end

@implementation LYTopWindow

#pragma mark - 单例模式
static LYTopWindow *_instance = nil;

+ (instancetype)sharedTopWindow {
    if (!_instance) {
        _instance = [[self alloc] init];
    }
    return _instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:zone] init];
    });
    return _instance;
}

- (id)copyWithZone:(NSZone *)zone {
    return _instance;
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    return _instance;
}

#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame {
    if (self  = [super initWithFrame:frame]) {
        self.statusBarStyle = UIStatusBarStyleDefault;
        self.statusBarHidden = NO;
        self.windowLevel = UIWindowLevelAlert;
        self.rootViewController = [[LYTopRootController alloc] init];
    }
    return self;
}

#pragma mark - 事件处理
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    return point.y > 20 ? nil : [super hitTest:point withEvent:event];
}

#pragma mark - 状态栏控制
- (void)setStatusBarStyle:(UIStatusBarStyle)statusBarStyle {
    _statusBarStyle = statusBarStyle;
    // 刷新状态栏
    [self.rootViewController setNeedsStatusBarAppearanceUpdate];
}

- (void)setStatusBarHidden:(BOOL)statusBarHidden {
    _statusBarHidden = statusBarHidden;
    // 刷新状态栏
    [self.rootViewController setNeedsStatusBarAppearanceUpdate];
}

/**
 *  保证Window的背景色一直是clearColor
 */
- (void)setBackgroundColor:(UIColor *)backgroundColor {
    [super setBackgroundColor:[UIColor clearColor]];
}

- (void)setClickStatusBarBlock:(void (^)())clickStatusBarBlock {
    _clickStatusBarBlock = clickStatusBarBlock;
    _instance.hidden = NO;
}

@end
