//
//  LXBaseTabBarController.m
//  Inke_Live
//
//  Created by ma c on 16/9/1.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXBaseTabBarController.h"
#import "LXTabBar.h"
#import "LXBaseNavigationController.h"
#import "LXLaurenViewController.h"//直播界面
@interface LXBaseTabBarController ()<LXTabBarDelegate>

/** tabBar */
@property (strong, nonatomic) LXTabBar *tabBarView;
@end

@implementation LXBaseTabBarController
- (LXTabBar *)tabBarView
{
    if (!_tabBarView) {
        _tabBarView = [[LXTabBar alloc] initWithFrame:CGRectMake(0, 0, KSCREEN_WITH, 49)];
        // block调用
//        __weak typeof(self) weakSelf = self;
//        _tabBarView.tabBarBlock = ^(LXTabBar *tabBar, LXItemType index){
//            [weakSelf tabBar:tabBar clickButton:index];
//        };
        // 代理
        _tabBarView.delegate = self;
    }
    return _tabBarView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 加载控制器
    [self configViewController];
    
    [self.tabBar addSubview:self.tabBarView];
    
    // 去掉TabBar的阴影
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc]init]];
}

// 加载控制器
- (void)configViewController
{
    NSMutableArray *mutableArr = [NSMutableArray arrayWithObjects:@"LXMainViewController", @"LXMeViewController", nil];
    
    for (NSInteger i = 0; i < mutableArr.count; i ++) {
        
        UIViewController *vc = [[NSClassFromString(mutableArr[i]) alloc] init];
        
        LXBaseNavigationController *nav = [[LXBaseNavigationController alloc] initWithRootViewController:vc];
        
        [mutableArr replaceObjectAtIndex:i withObject:nav];
    }
    self.viewControllers = mutableArr;
}

#pragma mark - LXTabBarDelegate代理
- (void)tabBar:(LXTabBar *)tabBar clickButton:(NSInteger)index
{
    if (index != LXItemTypeLauren) {
        self.selectedIndex = index - LXItemTypeLive;
        return ;
    }
    
    LXLaurenViewController *laurenVC = [[LXLaurenViewController alloc] init];
    [self presentViewController:laurenVC animated:YES completion:nil];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
