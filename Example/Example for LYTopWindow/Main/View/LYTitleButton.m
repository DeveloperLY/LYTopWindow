//
//	LYTitleButton.m
//  LYTopWindow_Example
//
//  Created by DeveloperLY on 16/2/21.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import "LYTitleButton.h"

@implementation LYTitleButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        [self setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    }
    return self;
}

/**
 *  去除高亮状态下的所有操作
 */
- (void)setHighlighted:(BOOL)highlighted {
    
}

@end
