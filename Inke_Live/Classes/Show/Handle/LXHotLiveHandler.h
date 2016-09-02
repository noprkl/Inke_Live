//
//  LXHotLiveHandler.h
//  Inke_Live
//
//  Created by ma c on 16/9/2.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXBaseHandler.h"

@interface LXHotLiveHandler : LXBaseHandler

/** 请求热门直播数据 */
+ (void)executeGetHotLiveTaskWithSuccess:(SuccessBlock)success
                                  failed:(FailedBlock)failed;

@end
