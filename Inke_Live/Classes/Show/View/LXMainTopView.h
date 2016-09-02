//
//  LXMainTopView.h
//  Inke_Live
//
//  Created by ma c on 16/9/2.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^MainTopBlock)(NSInteger btnTag);

@interface LXMainTopView : UIView

/** 重写view初始化方法 */
- (instancetype)initWithFrame:(CGRect)frame titleNames:(NSArray *)titles tapView:(MainTopBlock)tapBlock;



/** 滑动时btn变化 */
- (void)scrolling:(NSInteger)btnTag;
@end
