//
//  LXBaseHandler.h
//  Inke_Live
//
//  Created by ma c on 16/9/2.
//  Copyright © 2016年 LXq. All rights reserved.
//  处理层

#import <Foundation/Foundation.h>


@interface LXBaseHandler : NSObject

/** Handler处理完成后调用的Block */
typedef void(^CompleteBlock)();

/** Handler处理成功后调用的Block */
typedef void(^SuccessBlock)(id objc);

/** Handler处理失败后调用的Block */
typedef void(^FailedBlock)(NSError *error);


@end
