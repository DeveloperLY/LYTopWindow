//
//  ViewController.m
//  LYTopWindowExample
//
//  Created by Y Liu on 16/2/21.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import "ViewController.h"
#import "LYTitleButton.h"
#import "UIView+Extension.h"
#import "LYAllViewController.h"
#import "LYVideoViewController.h"
#import "LYVoiceViewController.h"
#import "LYPictureViewController.h"
#import "LYWordViewController.h"

/** 全局统一的间距 */
static CGFloat const LYMargin = 10;

/** 导航栏最大的Y值 */
static CGFloat const LYNavMaxY = 64;

/** 标题栏高度 */
static CGFloat const LYTitlesH = 35;

@interface ViewController () <UIScrollViewDelegate>

/** 标题栏 */
@property (nonatomic, weak) UIView *titlesView;
/** 用来存放所有子控制器view的scrollView */
@property (nonatomic, weak) UIScrollView *scrollView;
/** 下划线 */
@property (nonatomic, weak) UIView *underline;
/** 被点击的按钮 */
@property (nonatomic, weak) LYTitleButton *clickedTitleButton;

@end

@implementation ViewController

#pragma mark - 初始化
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // scrollView
    [self setupScrollView];
    
    // 标题栏
    [self setupTitlesView];
    
    // 初始化子控制器
    [self setupChildVcs];
}

/**
 *  初始化子控制器
 */
- (void)setupChildVcs {
    LYAllViewController *allVC = [[LYAllViewController alloc] init];
    [allVC setTitle:@"全部"];
    LYVideoViewController *videoVC = [[LYVideoViewController alloc] init];
    [videoVC setTitle:@"视频"];
    LYVoiceViewController *voiceVC = [[LYVoiceViewController alloc] init];
    [voiceVC setTitle:@"声音"];
    LYPictureViewController *pictureVC = [[LYPictureViewController alloc] init];
    [pictureVC setTitle:@"图片"];
    LYWordViewController *wordVC = [[LYWordViewController alloc] init];
    [wordVC setTitle:@"段子"];
    [self addChildViewController:allVC];
    [self addChildViewController:videoVC];
    [self addChildViewController:voiceVC];
    [self addChildViewController:pictureVC];
    [self addChildViewController:wordVC];
    
    // 内容大小
    self.scrollView.contentSize = CGSizeMake(self.childViewControllers.count * self.scrollView.width, 0);
    // 不要自动调整scrollView的内边距
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // 默认添加第0个子控制器view到scrollView
    [self addChildVcViewIntoScrollView:0];
}

/**
 *  scrollView
 */
- (void)setupScrollView {
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.view.bounds;
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.backgroundColor = [UIColor colorWithRed:(arc4random_uniform(256)) / 255.0 green:(arc4random_uniform(256)) / 255.0 blue:(arc4random_uniform(256)) / 255.0 alpha:1];
    [scrollView addSubview:[[UISwitch alloc] init]];
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
}

/**
 *  标题栏
 */
- (void)setupTitlesView {
    UIView *titlesView = [[UIView alloc] init];
    titlesView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
    titlesView.frame = CGRectMake(0, LYNavMaxY, self.view.width, LYTitlesH);
    [self.view addSubview:titlesView];
    self.titlesView = titlesView;
    
    // 标题按钮
    [self setupTitleButtons];
    
    // 下划线
    [self setupUnderline];
}

/**
 *  标题按钮
 */
- (void)setupTitleButtons {
    // 文字
    NSArray *titles = @[@"全部", @"视频", @"声音",  @"图片", @"段子"];
    NSUInteger count = titles.count;
    
    // 标题的宽高
    CGFloat titleW = self.titlesView.width / count;
    CGFloat titleH = self.titlesView.height;
    
    for (NSUInteger i = 0; i < count; i++) {
        // 创建添加
        LYTitleButton *titleButton = [LYTitleButton buttonWithType:UIButtonTypeCustom];
        titleButton.tag = i;
        [titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.titlesView addSubview:titleButton];
        
        // frame
        CGFloat titleX = titleW * i;
        titleButton.frame = CGRectMake(titleX, 0, titleW, titleH);
        
        // 数据
        [titleButton setTitle:titles[i] forState:UIControlStateNormal];
    }
}

/**
 *  下划线
 */
- (void)setupUnderline {
    // 第一个按钮
    LYTitleButton *firstTitleButton = self.titlesView.subviews.firstObject;
    
    // 下划线
    UIView *underline = [[UIView alloc] init];
    underline.backgroundColor = [firstTitleButton titleColorForState:UIControlStateSelected];
    underline.height = 2;
    underline.y = self.titlesView.height - underline.height;
    [self.titlesView addSubview:underline];
    self.underline = underline;
    
    // 默认选中第一个按钮
    // 改变按钮状态
    firstTitleButton.selected = YES; // UIControlStateSelected
    self.clickedTitleButton = firstTitleButton;
    
    [firstTitleButton.titleLabel sizeToFit]; // 主动根据文字内容计算按钮内部label的大小
    // 下划线宽度 == 按钮内部文字的宽度
    underline.width = firstTitleButton.titleLabel.width + LYMargin;
    // 下划线中心点x
    underline.centerX = firstTitleButton.centerX;
}


/**
 *  监听标题按钮点击
 */
- (void)titleClick:(LYTitleButton *)titleButton {
    // 改变按钮状态
    self.clickedTitleButton.selected = NO; // UIControlStateNormal
    titleButton.selected = YES; // UIControlStateSelected
    self.clickedTitleButton = titleButton;
    
    // 按钮的索引
    NSInteger index = titleButton.tag;
    
    // 移动下划线
    [UIView animateWithDuration:0.25 animations:^{
        // 宽度 == 按钮内部文字的宽度
        self.underline.width = titleButton.titleLabel.width + LYMargin;
        
        // 中心点x
        self.underline.centerX = titleButton.centerX;
        
        // 滚动scrollView到最新的子控制器界面(这里只需要水平滚动, 只改contentOffset.x)
        CGPoint offset = self.scrollView.contentOffset;
        offset.x = index * self.scrollView.width;
        self.scrollView.contentOffset = offset;
    } completion:^(BOOL finished) { // 滚动动画完毕
        // 添加对应的子控制器view到scrollView上面
        [self addChildVcViewIntoScrollView:index];
    }];
}

#pragma mark - <UIScrollViewDelegate>
/**
 * scrollView停止滚动的时候调用(结束减速,速度减为0)
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSUInteger index = scrollView.contentOffset.x / scrollView.width;
    // 点击对应的按钮
    LYTitleButton *titleButton = self.titlesView.subviews[index];
    [self titleClick:titleButton];
}

#pragma mark - 其他
/**
 *  添加第index个子控制器view到scrollView中
 */
- (void)addChildVcViewIntoScrollView:(NSInteger)index {
    // 添加对应的子控制器view到scrollView上面
    UIViewController *childVc = self.childViewControllers[index];
    
    // 如果这个子控制器view已经显示在上面, 就直接返回
    if (childVc.view.superview) return;
    
    [self.scrollView addSubview:childVc.view];
    
    // 子控制器view的frame
    childVc.view.x = index * self.scrollView.width;
    childVc.view.y = 0;
    childVc.view.width = self.scrollView.width;
    childVc.view.height = self.scrollView.height;
}

@end
