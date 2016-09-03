//
//  LXHotLiveCell.h
//  Inke_Live
//
//  Created by ma c on 16/9/2.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LXLive;
@interface LXHotLiveCell : UITableViewCell

/** 直播信息模型 */
@property (strong, nonatomic) LXLive *live;
@end
