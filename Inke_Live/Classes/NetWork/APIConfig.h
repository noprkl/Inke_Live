//
//  APIConfig.h
//  Inke_Live
//
//  Created by ma c on 16/9/2.
//  Copyright © 2016年 LXq. All rights reserved.

//  项目中用到的地址

#import <Foundation/Foundation.h>

@interface APIConfig : NSObject

// 信息类服务器
#define SERVER_HOST @"http://service.ingkee.com"

// 图片服务器
#define IMAGE_HOST @"http://img.meelive.cn/"


// 子地址

// 热门直播数据
#define API_HotLive @"api/live/gettop"

// 附近的人
#define API_NearLive @"api/live/near_recommend" // ?uid=85148376&latitude= 1763&longitude=234

// 广告地址
#define API_Advertise @"advertise/get"


@end
