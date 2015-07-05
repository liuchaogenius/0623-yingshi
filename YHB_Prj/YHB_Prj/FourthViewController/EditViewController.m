//
//  EditViewController.m
//  YHB_Prj
//
//  Created by Johnny's on 15/7/1.
//  Copyright (c) 2015年 striveliu. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController ()
{
    UIButton *topImgBtn;
    UITextField *nameTF;
    UITextField *jobTF;
    UITextField *phoneTF;
    UITextField *mailTF;
    UILabel *textLabel1;
    UILabel *textLabel2;
    UIButton *sureBtn;
}
@end

@implementation EditViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"编辑";
    
    [self createView];
}

- (void)createView
{
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, 44*4+0.25)];
    bgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgView];
    
    kCreateButton(topImgBtn, CGRectMake(12, 24, 40, 40), nil, nil, nil, 0, nil);
    topImgBtn.backgroundColor = [UIColor yellowColor];
    topImgBtn.layer.cornerRadius = 20;
    [topImgBtn clipsToBounds];
    [bgView addSubview:topImgBtn];
    
    kCreateTextField(nameTF, CGRectMake(topImgBtn.right+12, 0, kMainScreenWidth-topImgBtn.right-12, 44), @"请输入您的用户名", 16);
    [bgView addSubview:nameTF];
    
    UIView *lineView1 = [self createLineView:CGRectMake(nameTF.left, nameTF.bottom, nameTF.width, 0.25) lineColor:[UIColor lightGrayColor]];
    [bgView addSubview:lineView1];
    
    kCreateTextField(jobTF, CGRectMake(nameTF.left, nameTF.bottom, nameTF.width, 44), @"请输入您的职位信息", 16);
    [bgView addSubview:jobTF];
    
    UIView *lineView2 = [self createLineView:CGRectMake(12, jobTF.bottom, kMainScreenWidth-12, 0.25) lineColor:[UIColor lightGrayColor]];
    [bgView addSubview:lineView2];
    
    kCreateLabel(textLabel1, CGRectMake(12, jobTF.bottom, 50, 44), 16, RGBCOLOR(102, 102, 102), @"手机号");
    [bgView addSubview:textLabel1];
    
    kCreateTextField(phoneTF, CGRectMake(jobTF.left, jobTF.bottom, jobTF.width, jobTF.height), nil, 16);
    [bgView addSubview:phoneTF];
    
    UIView *lineView3 = [self createLineView:CGRectMake(12, textLabel1.bottom, kMainScreenWidth-12, 0.25) lineColor:[UIColor lightGrayColor]];
    [bgView addSubview:lineView3];
    
    kCreateLabel(textLabel2, CGRectMake(textLabel1.left, textLabel1.bottom, textLabel1.width, textLabel1.height), 16, RGBCOLOR(102, 102, 102), @"邮箱");
    [bgView addSubview:textLabel2];
    
    kCreateTextField(mailTF, CGRectMake(phoneTF.left, phoneTF.bottom, jobTF.width, jobTF.height), nil, 16);
    [bgView addSubview:mailTF];
    
    UIView *lineView4 = [self createLineView:CGRectMake(0, mailTF.bottom, kMainScreenWidth, 0.25) lineColor:[UIColor lightGrayColor]];
    [bgView addSubview:lineView4];
    
    kCreateButton(sureBtn, CGRectMake(12, bgView.bottom+25, kMainScreenWidth-24, 40), @"确定", nil, nil, 14, [UIColor whiteColor]);
    sureBtn.backgroundColor = kBlueColor;
    sureBtn.layer.cornerRadius = 2.5;
    [self.view addSubview:sureBtn];

}

- (UIView *)createLineView:(CGRect)aFrame lineColor:(UIColor *)aColor
{
    UIView *lineView = [[UIView alloc] initWithFrame:aFrame];
    lineView.backgroundColor = aColor;
    
    return lineView;
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
