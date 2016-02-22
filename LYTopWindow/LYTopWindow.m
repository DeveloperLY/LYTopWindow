//
//  LYTopWindow.m
//  LYTopWindow
//
//  Created by Y Liu on 16/2/21.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//

#import "LYTopWindow.h"
#import "LYTopRootController.h"

#pragma mark - UIView Extension
@interface UIView (Extension)

/**
 *  判断屏幕上的self是否和anotherView有重叠
 */
- (BOOL)intersectWithView:(UIView *)anotherView;

@end

@implementation UIView (Extension)

- (BOOL)intersectWithView:(UIView *)anotherView {
    if (anotherView == nil) {
        anotherView = [UIApplication sharedApplication].keyWindow;
    }
    
    CGRect rect1 = [self convertRect:self.bounds toView:nil];
    CGRect rect2 = [anotherView convertRect:anotherView.bounds toView:nil];
    return CGRectIntersectsRect(rect1, rect2);
}

@end

#pragma mark - 顶部Window
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
 *  保证UIWindow的背景色一直是clearColor
 */
- (void)setBackgroundColor:(UIColor *)backgroundColor {
    [super setBackgroundColor:[UIColor clearColor]];
}

- (void)setClickStatusBarBlock:(void (^)())clickStatusBarBlock {
    _clickStatusBarBlock = clickStatusBarBlock;
    _instance.hidden = NO;
}

#pragma mark - 查找当前View中的ScrollView,让UIScrollView滚动到最前面
/**
 *  查找view中的所有scrollView
 */
- (void)searchAllScrollViewsInView:(UIView *)view {
    // 如果不在UIWindow矩形框里面，就直接返回
    // view和UIWindow没有重叠，就直接返回
    if (![view intersectWithView:nil]) return;
    
    for (UIView *subview in view.subviews) {
        [self searchAllScrollViewsInView:subview];
    }
    
    // 如果不是UIScrollView, 直接返回
    if (![view isKindOfClass:[UIScrollView class]]) return;
    
    UIScrollView *scrollView = (UIScrollView *)view;
    
    // 让UIScrollView滚动到最前面
    CGPoint offset = scrollView.contentOffset;
    offset.y = - scrollView.contentInset.top;
    [scrollView setContentOffset:offset animated:YES];
}

- (BOOL)intersectWithView:(UIView *)anotherView {
    if (!anotherView) {
        anotherView = [UIApplication sharedApplication].keyWindow;
    }
    
    CGRect rect1 = [self convertRect:self.bounds toView:nil];
    CGRect rect2 = [anotherView convertRect:anotherView.bounds toView:nil];
    return CGRectIntersectsRect(rect1, rect2);
}

@end
