//
//  LXTabBar.m
//  Inke_Live
//
//  Created by ma c on 16/9/1.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXTabBar.h"

@interface LXTabBar ()

/** 背景图片 */
@property (strong, nonatomic) UIImageView *tabBarBackView;

/** 相机 */
@property (strong, nonatomic) UIButton *cameraBtn;

/** 数据源 */
@property (strong, nonatomic) NSArray *dataArr;

/** 上一个btn */
@property (strong, nonatomic) UIButton *lastButton;

@end

@implementation LXTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //添加背景
        [self addSubview:self.tabBarBackView];
        
        //添加item
        for (NSInteger i = 0; i < self.dataArr.count; i ++) {
           
            UIButton *item = [UIButton buttonWithType:UIButtonTypeCustom];
            // 取消高亮
            item.adjustsImageWhenHighlighted = NO;
            
            [item setImage:[UIImage imageNamed:self.dataArr[i]] forState:UIControlStateNormal];
            [item setImage:[UIImage imageNamed:[self.dataArr[i] stringByAppendingString:@"_p"]] forState:UIControlStateSelected];
            
            // 设置按钮初始状态
            if (i == 0) {
                item.selected = YES;
                self.lastButton = item;
            }
            
            item.tag = LXItemTypeLive + i;
            [item addTarget:self action:@selector(tabBarItemAction:) forControlEvents:UIControlEventTouchDown];
            [self addSubview:item];
        }
        
        // 添加相机按钮
        [self addSubview:self.cameraBtn];
        
    }
    return self;
}
// 点击事件
- (void)tabBarItemAction:(UIButton *)item {
    
    if ([self.delegate respondsToSelector:@selector(tabBar:clickButton:)]) {
        [self.delegate tabBar:self clickButton:item.tag];
    }
    
    if (_tabBarBlock) {
        _tabBarBlock(self, item.tag);
    }
    
    // 将上一个按钮的选中状态置为NO
    self.lastButton.selected = NO;
    
    // 将正在点击的按钮状态置为YES
    item.selected = YES;
    
    // 将当前按钮设置成上一个按钮
    self.lastButton = item;
    
    // 设置点击相机是的状态 没有选中
    if (item.tag == LXItemTypeLauren) {
        return;
    }
    
    //按钮动画 分为两部分
    [UIView animateWithDuration:0.2 animations:^{
        
        // 放大
        item.transform = CGAffineTransformMakeScale(1.2, 1.2);
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.2 animations:^{
            
            // 变回来
            item.transform = CGAffineTransformIdentity;
        }];
    }];
}

#pragma mark - 布局
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat width = self.bounds.size.width / self.dataArr.count;
    
    for (UIButton *btn in self.subviews) {
        if (btn.tag >= LXItemTypeLive) {
             btn.frame = CGRectMake((btn.tag - LXItemTypeLive) * width, 0, width, self.frame.size.height);
        }
    }
    
    self.tabBarBackView.frame = self.frame;

    self.cameraBtn.center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5 - 25);
}

#pragma mark - 懒加载
- (UIImageView *)tabBarBackView
{
    if (!_tabBarBackView) {
        _tabBarBackView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"global_tab_bg"]];
    }
    return _tabBarBackView;
}

- (NSArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = @[@"tab_live",@"tab_me"];;
    }
    return _dataArr;
}

- (UIButton *)cameraBtn
{
    if (!_cameraBtn) {
        
        _cameraBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cameraBtn setImage:[UIImage imageNamed:@"tab_launch"] forState:UIControlStateNormal];
        [_cameraBtn sizeToFit];
        
        [_cameraBtn addTarget:self action:@selector(tabBarItemAction:) forControlEvents:UIControlEventTouchDown];
        _cameraBtn.tag = LXItemTypeLauren;
    }
    return _cameraBtn;
}
@end
