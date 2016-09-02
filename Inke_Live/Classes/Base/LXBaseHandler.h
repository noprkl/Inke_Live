//
//  LXBaseHandler.h
//  Inke_Live
//
//  Created by ma c on 16/9/2.
//  Copyright © 2016年 LXq. All rights reserved.
//  处理层

#import <Foundation/Foundation.h>

/** 处理事件 */
typedef void(^CompleteBlock)();

/** 处理成功事件 */
typedef void(^SuccessBlock)(id objc);

/** 处理失败事件 */
typedef void(^FailedBlock)(NSError *error);

@interface LXBaseHandler : NSObject

@end
