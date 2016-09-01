//
//  LXMainViewController.m
//  Inke_Live
//
//  Created by ma c on 16/9/1.
//  Copyright © 2016年 LXq. All rights reserved.
//  主控制器 上边放了3个控制器的view

#import "LXMainViewController.h"

@interface LXMainViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;

/** 数据源 */
@property (strong, nonatomic) NSArray *dataArr;

@end

@implementation LXMainViewController
- (NSArray *)dataArr {

    if (!_dataArr) {
        _dataArr = @[@"关注", @"热点", @"附近"];
    }
    return _dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    //更新UI
    [self initUI];
}
#pragma mark
#pragma mark - 添加子控制器
- (void)setChildViewControllers {
    
    NSArray *array = @[@"LXFocusViewController", @"LXHotViewController", @"LXNearViewController"];
    
    for (NSInteger i = 0; i < array.count; i ++) {
        NSString *vcName = array[i];
        UIViewController *vc = [[NSClassFromString(vcName) alloc] init];
        vc.title = self.dataArr[i];
        
        // 执行addChildViewController时不会执行viewDidLoad 视图不会被加载
        [self addChildViewController:vc];
    }
    
    // 将子控制器的view 加载到MainVC的ScrollView上
    self.contentScrollView.contentSize = CGSizeMake(KSCREEN_WITH * self.dataArr.count, 0);
    
    // 设置contentScrollView加载时的位置
    self.contentScrollView.contentOffset = CGPointMake(KSCREEN_WITH, 0);
    
    // 减速结束加载控制器视图 代理
    self.contentScrollView.delegate = self;
    
}

#pragma mark - UIScrollViewDelegate代理
// 减速结束时调用 加载子控制器view的方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {

    // 每个子控制器的宽高
    CGFloat width = KSCREEN_WITH;
    CGFloat height = KSCREEN_HEIGHT;
    
    // 偏移量 - x
    CGFloat offset = scrollView.contentOffset.x;
    
    // 获取视图的索引
    NSInteger index = offset / width;
    
    //根据索引返回vc的引用
    UIViewController *vc = self.childViewControllers[index];
    
    // 判断当前vc是否加载过
    if ([vc isViewLoaded]) return;
    
    // 给没加载过的控制器设置frame
    vc.view.frame = CGRectMake(offset, 0, width, height);
    
    // 添加控制器视图到contentScrollView上
    [self.contentScrollView addSubview:vc.view];
}

#pragma mark - 左右item 导航条
- (void)initUI {
    
    //添加左右item
    [self setNav];
    
    //添加子视图控制器
    [self setChildViewControllers];
    
}

- (void)setNav {
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"global_search"] style:UIBarButtonItemStyleDone target:self action:@selector(leftItemAction)];
   
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"title_button_more"] style:UIBarButtonItemStylePlain target:self action:@selector(rightItemAction)];
}

- (void)leftItemAction {
    
}

- (void)rightItemAction {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
