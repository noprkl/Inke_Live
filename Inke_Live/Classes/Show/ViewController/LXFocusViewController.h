//
//  LXFocusViewController.h
//  Inke_Live
//
//  Created by ma c on 16/9/1.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXBaseViewController.h"

typedef void(^MoreLiveBtnBlock)();

@interface LXFocusViewController : LXBaseViewController

/** 精彩按钮回调 */
@property (strong, nonatomic) MoreLiveBtnBlock moreLiveBlock;
@end
