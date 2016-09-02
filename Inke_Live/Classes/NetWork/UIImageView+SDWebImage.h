//
//  UIImageView+SDWebImage.h
//  03-封装二次
//
//  Created by ma c on 16/8/4.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import <UIKit/UIKit.h>
/** 要监听的内容 */
typedef void(^DownloadImageSuccessBlock)(UIImage *image);
typedef void(^DownloadImageFailedBlock)(NSError *error);
typedef void(^DownloadImageProgressBlock)(CGFloat progress);


@interface UIImageView (SDWebImage)
/**
 *  异步加载图片
 *
 *  @param url   图片地址
 *  @param image 占位图片
 */
- (void)downImgae:(NSString *)url placeholder:(UIImage *)image;
/**
 *  异步加载图片 可以监听下载成功 失败 下载进度
 *
 *  @param url      地址
 *  @param image    占位图
 *  @param success  下载成功
 *  @param failed   下载失败
 *  @param progress 下载进度
 */
- (void)downImgae:(NSString *)url
      placeholder:(UIImage *)image
          success:(DownloadImageSuccessBlock)success
           failed:(DownloadImageFailedBlock)failed
        preogress:(DownloadImageProgressBlock)progress;
@end
