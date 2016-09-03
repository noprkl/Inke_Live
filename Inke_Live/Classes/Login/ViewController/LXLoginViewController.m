//
//  LXLoginViewController.m
//  Inke_Live
//
//  Created by ma c on 16/9/3.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXLoginViewController.h"
#import "LXPhoneLoginViewController.h"

@interface LXLoginViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *cloudImage1;
@property (weak, nonatomic) IBOutlet UIImageView *cloudImage2;

@property (weak, nonatomic) IBOutlet UIImageView *cloudImage3;

@property (weak, nonatomic) IBOutlet UIButton *bottomClause;


@end

@implementation LXLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
}
- (void)initUI {
    
    [self cloudImageAnimation];
    
    
    // 设置协议的下划线
    [self setClauseUndrLine];
}
// 云朵动画
- (void)cloudImageAnimation {

    CGFloat width1 = self.cloudImage1.frame.size.width;
    
    //定时器
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(0, 0));
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 5 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        
        // cloudImage1动画
        [UIView animateWithDuration:5 animations:^{
            
            CGRect rect = self.cloudImage1.frame;
            rect.origin.x = - width1;
            self.cloudImage1.frame = rect;
        } completion:^(BOOL finished) {
            
            CGRect rect = self.cloudImage1.frame;
            rect.origin.x = SCREEN_WITH + width1;
            self.cloudImage1.frame = rect;
            
        }];
  
        
    });
    dispatch_resume(timer);
}
- (IBAction)QQLogin:(UIButton *)sender {
}
- (IBAction)WeChatLogin:(UIButton *)sender {
}
- (IBAction)SinaLogin:(UIButton *)sender {
}
- (IBAction)phoneNumLogin:(UIButton *)sender {
    
    LXPhoneLoginViewController *phoneVC = [[LXPhoneLoginViewController alloc] init];
//    [self.navigationController pushViewController:phoneVC animated:YES];
    [self presentViewController:phoneVC animated:YES completion:nil];
}

- (IBAction)clickBottomClause:(UIButton *)sender {
}

- (void)setClauseUndrLine
{
    NSDictionary *dict = @{
                           NSUnderlineStyleAttributeName:@(1)
                           };
    NSAttributedString *attribute = [[NSAttributedString alloc] initWithString:@"映客服务和隐私条款" attributes:dict];
    [self.bottomClause setAttributedTitle:attribute forState:UIControlStateNormal];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
