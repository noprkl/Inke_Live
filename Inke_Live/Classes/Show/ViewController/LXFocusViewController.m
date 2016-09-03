//
//  LXFocusViewController.m
//  Inke_Live
//
//  Created by ma c on 16/9/1.
//  Copyright © 2016年 LXq. All rights reserved.
//  关注

#import "LXFocusViewController.h"

@interface LXFocusViewController ()

@property (weak, nonatomic) IBOutlet UIButton *moreLiveBtn;

@end

@implementation LXFocusViewController

// UI处理方法
- (void)initUI {
    
    self.moreLiveBtn.layer.borderColor = RGB(200, 200, 200).CGColor;
    self.moreLiveBtn.layer.borderWidth = 1;

}

- (IBAction)clickMoreLive:(UIButton *)sender {
    

    
}










- (void)viewDidLoad {
    [super viewDidLoad];
    
    //更新UI
    [self initUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
