//
//  LYChildViewController.m
//  LYTopWindow_Example
//
//  Created by DeveloperLY on 16/2/22.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import "LYChildViewController.h"

static NSString * const ID = @"ChildCell";

@interface LYChildViewController ()

@end

@implementation LYChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    
    self.view.backgroundColor = [UIColor colorWithRed:(arc4random_uniform(256)) / 255.0 green:(arc4random_uniform(256)) / 255.0 blue:(arc4random_uniform(256)) / 255.0 alpha:1];
    
    self.tableView.contentInset = UIEdgeInsetsMake(64 + 35, 0, 0, 0);
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@---%ld", self.title,  indexPath.row];
    
    return cell;
}

@end
