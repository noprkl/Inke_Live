//
//  UIImageView+SDWebImage.m
//  03-封装二次
//
//  Created by ma c on 16/8/4.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "UIImageView+SDWebImage.h"
#import "UIImageView+WebCache.h"

@implementation UIImageView (SDWebImage)
- (void)downImgae:(NSString *)url placeholder:(UIImage *)image
{
    //占位图
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:image options:SDWebImageRetryFailed|SDWebImageLowPriority];
}

- (void)downImgae:(NSString *)url placeholder:(UIImage *)image success:(DownloadImageSuccessBlock)success failed:(DownloadImageFailedBlock)failed preogress:(DownloadImageProgressBlock)progress
{
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:image options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        /** 下载进度 */
        progress(receivedSize/expectedSize*1.0);
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        /** 监听下载是否成功 */
        if (error) {
            failed(error);
        }else{
            success(image);
        }
    }];
}
@end
