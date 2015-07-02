//
//  InviteViewController.m
//  YHB_Prj
//
//  Created by Johnny's on 15/6/29.
//  Copyright (c) 2015年 striveliu. All rights reserved.
//

#import "InviteViewController.h"
#define kBtnWidth 200
@interface InviteViewController ()
{
    UIImageView *inviteImgView;
    UILabel *textLabel;
    UILabel *iLabel;
    UIButton *smsBtn;
    UIButton *wcBtn;
}
@end

@implementation InviteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setTitle:@"我的邀请码"];
    
    kCreateImgView(inviteImgView, CGRectMake(kMainScreenWidth/2-70, 80, 140, 68), IMAGE(@"invite"));
    [self.view addSubview:inviteImgView];
    
    kCreateLabel(textLabel, CGRectMake(0, inviteImgView.bottom+80, kMainScreenWidth, 20), 14, RGBCOLOR(153, 153, 153), @"发送您的邀请码");
    textLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:textLabel];
    
    kCreateLabel(iLabel, CGRectMake(0, textLabel.bottom, kMainScreenWidth, 26), 20, [UIColor blackColor], @"231143");
    iLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:iLabel];
    
    kCreateButton(smsBtn, CGRectMake((kMainScreenWidth-kBtnWidth)/2, iLabel.bottom+40, kBtnWidth, 40), @"短信邀请", nil, nil, 15, [UIColor blackColor]);
    smsBtn.layer.cornerRadius = 2.5;
    smsBtn.layer.borderColor = [[UIColor blackColor] CGColor];
    smsBtn.layer.borderWidth = 1;
    [self.view addSubview:smsBtn];
    
    kCreateButton(wcBtn, CGRectMake(smsBtn.left, smsBtn.bottom+12, smsBtn.width, smsBtn.height), @"微信邀请", nil, nil, 15, [UIColor whiteColor]);
    wcBtn.layer.cornerRadius = 2.5;
    wcBtn.backgroundColor = RGBCOLOR(22, 169, 200);
    [self.view addSubview:wcBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
