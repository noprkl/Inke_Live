//
//  LXTabBar.h
//  Inke_Live
//
//  Created by ma c on 16/9/1.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LXItemType) {
    
    LXItemTypeLauren = 10, // 启动直播
    LXItemTypeLive = 100, // 展示直播
    LXItemTypeMe, // 我的
};

@class LXTabBar;
// 协议代理
@protocol LXTabBarDelegate <NSObject>

- (void)tabBar:(LXTabBar *)tabBar clickButton:(NSInteger)index;

@end

// block
typedef void(^TouchTabBarBlock)(LXTabBar *tabBar, LXItemType index);

@interface LXTabBar : UIView

/** 代理 */
@property (strong, nonatomic) id<LXTabBarDelegate> delegate;
/** block回调 */
@property (strong, nonatomic) TouchTabBarBlock tabBarBlock;

@end
