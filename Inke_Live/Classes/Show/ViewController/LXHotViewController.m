//
//  LXHotViewController.m
//  Inke_Live
//
//  Created by ma c on 16/9/1.
//  Copyright © 2016年 LXq. All rights reserved.
//  热点

#import "LXHotViewController.h"
#import "LXHotLiveHandler.h"
#import "LXHotLiveCell.h"

/** cell唯一标示 */
static NSString *cellid = @"HotCellId";

@interface LXHotViewController ()<UITableViewDataSource, UITableViewDelegate>

/** 数据源 */
@property (strong, nonatomic) NSArray *dataArr;

/** TableView */
@property (strong, nonatomic) UITableView *tableView;

@end

@implementation LXHotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
}

#pragma mark - 热播数据请求
- (void)loadData {
//    [LXHotLiveHandler executeGetHotLiveTaskWithSuccess:^(id objc) {
//
//        NSLog(@"%@", objc);
//    } failed:^(NSError *error) {
//        
//        NSLog(@"%@", error);
//    }];
//     
}

#pragma mark
#pragma mark - UITableViewDataSource, UITableViewDelegate 代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
//    return self.dataArr.count;
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

//    LXHotLiveCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    
    // 把数据传给模型
//    cell.live = self.dataArr[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70 + SCREEN_WITH;
}
#pragma mark
#pragma mark - 懒加载
- (NSArray *)dataArr {
    
    if (!_dataArr) {
        _dataArr = [NSArray array];
    }
    return _dataArr;
}
- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
