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
#import "LXHotLiveHeaderView.h"

/** cell唯一标示 */
static NSString *cellid = @"HotLiveCellId";

@interface LXHotViewController ()<UITableViewDataSource, UITableViewDelegate>

/** 数据源(需要时刻更新,还要保留旧数据用可变的) */
@property (strong, nonatomic) NSMutableArray  *dataArr;

/** 头部广告 */
@property (strong, nonatomic) LXHotLiveHeaderView *headerView;

/** 广告图片数据 */
@property (strong, nonatomic) NSMutableArray *advertiseArr;

@end

@implementation LXHotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
}

- (void)initUI {
    
    // 注册xib文件的cell
    [self.tableView registerNib:[UINib nibWithNibName:@"LXHotLiveCell" bundle:nil] forCellReuseIdentifier:cellid];
    
    
    
    // 加载直播数据
    [self loadData];
    // 广告数据
//    [self loadAdvertiseData];
}
#pragma mark - 头部广告数据请求
- (void)loadAdvertiseData {

    [LXHotLiveHandler executeGetHotLiveAdvertiseWithSuccess:^(id objc) {

    } failed:^(NSError *error) {
        NSLog(@"%@", error);
    }];
}
#pragma mark - 热播数据请求
- (void)loadData {
    
    [LXHotLiveHandler executeGetHotLiveTaskWithPage:0 Success:^(id objc) {
        // 添加数据
        [self.dataArr addObjectsFromArray:objc];

        // 刷新表格
        [self.tableView reloadData];
        
    } failed:^(NSError *error) {
        
        NSLog(@"%@", error);
    }];
    
    /*
     {"city":"北京市","creator":{"emotion":"","inke_verify":0,"verified":1,"description":" ","gender":1,"profession":"","id":183746825,"verified_reason":"陈俊廷音乐工作室歌手","nick":"宋秉洋BY","location":"北京市","birth":"","hometown":"","portrait":"http://tva4.sinaimg.cn/crop.0.0.511.511.1024/9c64c39bjw8f728z5fgxwj20e70e8q30.jpg","gmutex":0,"third_platform":"0","level":1,"rank_veri":1,"veri_info":"陈俊廷音乐工作室歌手"},"id":"1472817455082496","image":"","name":"2016 Music Radio 映客直播 1200助学行动 爱心传递_宋秉洋","pub_stat":1,"room_id":569419968,"share_addr":"http://mlive6.inke.cn/share/live.html?uid=183746825&liveid=1472817455082496&ctime=1472817455","slot":6,"status":1,"stream_addr":"http://pull.a8.com/live/1472817455082496.flv","version":0,"online_users":31621,"group":1,"link":0,"optimal":0,"multi":0,"rotate":0}
     */
}

#pragma mark
#pragma mark - UITableViewDataSource, UITableViewDelegate 代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    LXHotLiveCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    
    // 把数据传给模型
    cell.live = self.dataArr[indexPath.row];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 70 + SCREEN_WITH;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {

    // 点击完cell弹起
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
#pragma mark
#pragma mark - 懒加载

- (NSMutableArray *)dataArr {
    
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

- (NSMutableArray *)advertiseArr {
    
    if (!_advertiseArr) {
        _advertiseArr = [NSMutableArray array];
    }
    return _advertiseArr;
}
- (LXHotLiveHeaderView *)headerView {

    if (!_headerView) {
        _headerView = [[LXHotLiveHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WITH, 70) cycleImages:self.advertiseArr];
    }
    return _headerView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
