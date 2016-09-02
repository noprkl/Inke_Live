//
//  LXHotLiveHandler.m
//  Inke_Live
//
//  Created by ma c on 16/9/2.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXHotLiveHandler.h"
#import "HttpTool.h"

@implementation LXHotLiveHandler

+ (void)executeGetHotLiveTaskWithSuccess:(SuccessBlock)success
                                  failed:(FailedBlock)failed {
    
    [HttpTool getWithPath:API_HotLive params:nil success:^(id json) {
        
        if (json) {
            
            success(json);
        }
    } failed:^(NSError *error) {
        
        if (error) {
            
            failed(error);
        }
    }];
}

@end
