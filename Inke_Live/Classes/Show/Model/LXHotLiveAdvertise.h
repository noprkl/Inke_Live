//
//  LXHotLiveAdvertise.h
//  Inke_Live
//
//  Created by ma c on 16/9/3.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LXHotLiveAdvertise : NSObject

@property (nonatomic, assign) NSInteger dmError;
@property (nonatomic, strong) NSString * errorMsg;
@property (nonatomic, strong) NSString * md5;
@property (nonatomic, strong) NSArray * resources;

@end
