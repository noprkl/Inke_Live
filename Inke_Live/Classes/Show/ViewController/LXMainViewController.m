//
//  LXMainViewController.m
//  Inke_Live
//
//  Created by ma c on 16/9/1.
//  Copyright © 2016年 LXq. All rights reserved.
//  主控制器 上边放了3个控制器的view

#import "LXMainViewController.h"
#import "LXMainTopView.h"

@interface LXMainViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;

/** title */
@property (strong, nonatomic) NSArray *titleNames;

/** 顶部titleView */
@property (strong, nonatomic) LXMainTopView *topView;
@end

@implementation LXMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 更新UI
    [self initUI];
}
- (void)initUI {
    
    // 设置导航条
    [self setNav];
    
    // 添加子视图控制器
    [self setChildViewControllers];
    
    
}

#pragma mark
#pragma mark - 添加子控制器
- (void)setChildViewControllers {
    
    NSArray *array = @[@"LXFocusViewController", @"LXHotViewController", @"LXNearViewController"];
    
    for (NSInteger i = 0; i < array.count; i ++) {
        
        NSString *vcName = array[i];
        UIViewController *vc = [[NSClassFromString(vcName) alloc] init];
        vc.title = self.titleNames[i];
        
        // 执行addChildViewController时不会执行viewDidLoad 视图不会被加载
        [self addChildViewController:vc];
    }
    
    // 将子控制器的view 加载到MainVC的ScrollView上  这里用的是加载时的屏幕宽
    self.contentScrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * self.titleNames.count, 0);
    
    // 设置contentScrollView加载时的位置
    self.contentScrollView.contentOffset = CGPointMake(SCREEN_WITH, 0);
    
    // 减速结束加载控制器视图 代理
    self.contentScrollView.delegate = self;
    
    
    [self scrollViewDidEndDecelerating:self.contentScrollView];
}

#pragma mark - UIScrollViewDelegate代理
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    // 每个子控制器的宽高
    CGFloat width = SCREEN_WITH;
    CGFloat height = SCREEN_HEIGHT;
    
    // 偏移量 - x
    CGFloat offset = scrollView.contentOffset.x;
    
    // 获取视图的索引
    NSInteger index = offset / width;
    
    // 标题线
    [self.topView scrolling:index];
    
    //根据索引返回vc的引用
    UIViewController *childVC = self.childViewControllers[index];
    
    // 判断当前vc是否加载过
    if ([childVC isViewLoaded]) return;
    
    // 给没加载过的控制器设置frame
    childVC.view.frame = CGRectMake(offset, 0, width, height);
    
    // 添加控制器视图到contentScrollView上
    [scrollView addSubview:childVC.view];
}

// 减速结束时调用 加载子控制器view的方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {

    // 传的调用这个代理方法的scrollview
    [self scrollViewDidEndScrollingAnimation:scrollView];
}

#pragma mark - 设置导航条

- (void)setNav {
    
    // 设置nav的tittleview
    self.navigationItem.titleView = self.topView;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"global_search"] style:UIBarButtonItemStyleDone target:self action:@selector(leftItemAction)];
   
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"title_button_more"] style:UIBarButtonItemStylePlain target:self action:@selector(rightItemAction)];
}

- (void)leftItemAction {
    
}

- (void)rightItemAction {
    
}

#pragma mark
#pragma mark - 懒加载

- (NSArray *)titleNames {
    
    if (!_titleNames) {
        _titleNames = @[@"关注", @"热点", @"附近"];
    }
    return _titleNames;
}

- (LXMainTopView *)topView {
    
    if (!_topView) {
        
        _topView = [[LXMainTopView alloc] initWithFrame:CGRectMake(0, 0, 200, 40) titleNames:self.titleNames tapView:^(NSInteger btnTag) {
            
            CGPoint center = CGPointMake(btnTag * SCREEN_WITH, self.contentScrollView.contentOffset.y);
            
            [self.contentScrollView setContentOffset:center animated:YES];
        }];
    }
    return _topView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
