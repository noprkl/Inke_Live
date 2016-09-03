//
//  LXPhoneLoginViewController.m
//  Inke_Live
//
//  Created by ma c on 16/9/3.
//  Copyright © 2016年 LXq. All rights reserved.
//

#import "LXPhoneLoginViewController.h"

@interface LXPhoneLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UITextField *coderField;
@property (weak, nonatomic) IBOutlet UILabel *countryLabel;


@property (weak, nonatomic) IBOutlet UIButton *codeBtn;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@end

@implementation LXPhoneLoginViewController

// 初始化UI
- (void)initUI {

    [self setSubviewsBorder];

}

- (IBAction)chosePhoneCountry:(UIButton *)sender {
}
- (IBAction)codeBtnAction:(UIButton *)sender {
}
- (IBAction)loginBtnAction:(UIButton *)sender {
}
- (IBAction)backLoginview:(UIBarButtonItem *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)setSubviewsBorder{
    
    self.codeBtn.layer.borderColor = RGB(171, 250, 252).CGColor;
    self.codeBtn.layer.borderWidth = 1;
    
    self.loginBtn.layer.borderColor = RGB(171, 250, 252).CGColor;
    self.loginBtn.layer.borderWidth = 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
