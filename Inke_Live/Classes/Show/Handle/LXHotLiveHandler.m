//
//  LXHotLiveHandler.m
//  Inke_Live
//
//  Created by ma c on 16/9/2.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXHotLiveHandler.h"
#import <MJExtension.h>

// HotLive
#import "HttpTool.h"
#import "LXLive.h"

// HotAdvertise
#import "LXResource.h"
@implementation LXHotLiveHandler

+ (void)executeGetHotLiveTaskWithPage:(NSInteger)pageNum
                              Success:(SuccessBlock)success
                               failed:(FailedBlock)failed {
    
    [HttpTool getWithPath:API_HotLive params:nil success:^(id json) {
        NSInteger dm_error = [json[@"dm_error"] integerValue];

        if (!dm_error) {
            NSArray *liveArr = [LXLive mj_objectArrayWithKeyValuesArray:json[@"lives"]];
            success(liveArr);
        }else{
            failed(json);
        }

    } failed:^(NSError *error) {
        failed(error);
    }];
}

+ (void)executeGetHotLiveAdvertiseWithSuccess:(SuccessBlock)success
                                       failed:(FailedBlock)failed {

    [HttpTool getWithPath:API_Advertise params:nil success:^(id json) {
      

        NSDictionary *resourceDict = json[@"resources"][0];

        LXResource *advertise = [LXResource mj_objectWithKeyValues:resourceDict];

        success(advertise);
    
    } failed:^(NSError *error) {
       
        failed(error);
    }];
}
@end
