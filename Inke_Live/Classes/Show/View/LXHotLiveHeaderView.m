//
//  LXHotLiveHeaderView.m
//  Inke_Live
//
//  Created by ma c on 16/9/2.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXHotLiveHeaderView.h"
#import <SDCycleScrollView.h>

@interface LXHotLiveHeaderView ()<SDCycleScrollViewDelegate>

/** 广告位 */
@property (strong, nonatomic) SDCycleScrollView *scrollView;

@end

@implementation LXHotLiveHeaderView

- (instancetype)initWithFrame:(CGRect)frame cycleImages:(NSArray *)images
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.scrollView.imageURLStringsGroup = images;
        [self addSubview:self.scrollView];
        
    }
    return self;
}
- (SDCycleScrollView *)scrollView {
    
    if (!_scrollView) {
        _scrollView = [SDCycleScrollView cycleScrollViewWithFrame:self.frame delegate:nil placeholderImage:[UIImage imageNamed:@"login_tree"]];
        // page位置
        _scrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    }
    return _scrollView;
}
@end
