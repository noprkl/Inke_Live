//
//  LXBaseNavigationController.m
//  Inke_Live
//
//  Created by ma c on 16/9/1.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXBaseNavigationController.h"

@interface LXBaseNavigationController ()

@end

@implementation LXBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 导航条颜色
    self.navigationBar.barTintColor = RGB(0, 216, 201);
    // 导航字体颜色
    self.navigationBar.tintColor = [UIColor whiteColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
