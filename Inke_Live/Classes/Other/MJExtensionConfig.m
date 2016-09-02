//
//  MJExtensionConfig.m
//  Inke_Live
//
//  Created by ma c on 16/9/2.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "MJExtensionConfig.h"
#import <MJExtension.h>
#import "LXCreateor.h"
#import "LXLive.h"


@implementation MJExtensionConfig
+ (void)load
{
    [NSObject mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"ID" : @"id"
                 };
    }];
    
    [LXCreateor mj_setupReplacedKeyFromPropertyName121:^id(NSString *propertyName) {
        return @{
                 @"desc" : @"desciption"
                 };
    }];
    
    // 下划线
    [LXCreateor mj_setupReplacedKeyFromPropertyName121:^NSString *(NSString *propertyName) {
        return [propertyName mj_underlineFromCamel];
    }];
    
    [LXLive mj_setupReplacedKeyFromPropertyName121:^NSString *(NSString *propertyName) {
        return [propertyName mj_underlineFromCamel];
    }];
}
@end
