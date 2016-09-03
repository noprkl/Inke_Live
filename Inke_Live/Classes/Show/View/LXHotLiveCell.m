//
//  LXHotLiveCell.m
//  Inke_Live
//
//  Created by ma c on 16/9/2.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXHotLiveCell.h"
#import "LXLive.h"

@interface LXHotLiveCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLable;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *onLineNumLabel;
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;

@end


@implementation LXHotLiveCell
- (void)setLive:(LXLive *)live
{
    _live = live;
    
    self.userNameLable.text = live.creator.nick;
    self.cityLabel.text = live.city;
    self.onLineNumLabel.text = [@(live.onlineUsers) stringValue];
    
    // 异步加载图片
    [self.iconImageView downImgae:[NSString stringWithFormat:@"%@%@", IMAGE_HOST, live.creator.portrait] placeholder:[UIImage imageNamed:@"default_room"]];
    [self.userImageView downImgae:[NSString stringWithFormat:@"%@%@", IMAGE_HOST, live.creator.portrait] placeholder:[UIImage imageNamed:@"default_room"]];
    
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
