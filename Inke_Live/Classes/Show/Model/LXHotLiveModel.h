//
//  LXHotLiveModel.h
//  Inke_Live
//
//  Created by ma c on 16/9/2.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LXHotLiveModel : NSObject

@property (nonatomic, assign) NSInteger dmError;
@property (nonatomic, strong) NSString * errorMsg;
@property (nonatomic, assign) NSInteger expireTime;
@property (nonatomic, strong) NSArray * lives;

@end
