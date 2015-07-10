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
    UITextField *detailTF;
    UITextField *phoneTF;
    UITextField *mailTF;
    UILabel *textLabel1;
    UILabel *textLabel2;
    UIButton *jobBtn;
    UILabel *jobLabel;
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
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, 44*5+0.25)];
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
    
    kCreateTextField(detailTF, CGRectMake(nameTF.left, nameTF.bottom, nameTF.width, 44), @"一句话定义你自己!", 16);
    [bgView addSubview:detailTF];
    
    UIView *lineView2 = [self createLineView:CGRectMake(12, detailTF.bottom, kMainScreenWidth-12, 0.25) lineColor:[UIColor lightGrayColor]];
    [bgView addSubview:lineView2];
    
    kCreateLabel(textLabel1, CGRectMake(12, detailTF.bottom, 50, 44), 16, RGBCOLOR(102, 102, 102), @"手机号");
    [bgView addSubview:textLabel1];
    
    kCreateTextField(phoneTF, CGRectMake(detailTF.left, detailTF.bottom, detailTF.width, detailTF.height), nil, 16);
    [bgView addSubview:phoneTF];
    
    UIView *lineView3 = [self createLineView:CGRectMake(12, textLabel1.bottom, kMainScreenWidth-12, 0.5) lineColor:[UIColor lightGrayColor]];
    [bgView addSubview:lineView3];
    
    kCreateLabel(textLabel2, CGRectMake(textLabel1.left, textLabel1.bottom, textLabel1.width, textLabel1.height), 16, RGBCOLOR(102, 102, 102), @"邮箱");
    [bgView addSubview:textLabel2];
    
    kCreateTextField(mailTF, CGRectMake(phoneTF.left, phoneTF.bottom, detailTF.width, detailTF.height), nil, 16);
    [bgView addSubview:mailTF];
    
    UIView *lineView4 = [self createLineView:CGRectMake(12, mailTF.bottom, kMainScreenWidth, 0.5) lineColor:[UIColor lightGrayColor]];
    [bgView addSubview:lineView4];
    
    kCreateButton(jobBtn, CGRectMake(0, mailTF.bottom, kMainScreenWidth, 44), nil, nil, nil, 0, nil);
    [jobBtn addTarget:self action:@selector(touchJobBtn) forControlEvents:UIControlEventTouchDown];
    [bgView addSubview:jobBtn];
    
    UIImageView *arrowImgView = [[UIImageView alloc] initWithFrame:CGRectMake(kMainScreenWidth-25, 14.5, 9, 15)];
    arrowImgView.image = [UIImage imageNamed:@"arrowRight"];
    [jobBtn addSubview:arrowImgView];
    
    kCreateLabel(jobLabel, CGRectMake(12, 0, 200, 44), 16, [UIColor lightGrayColor], @"请输入你的职位信息");
    [jobBtn addSubview:jobLabel];
    
    UIView *lineView5 = [self createLineView:CGRectMake(0, jobBtn.bottom, kMainScreenWidth, 0.5) lineColor:[UIColor lightGrayColor]];
    [bgView addSubview:lineView5];
    
    kCreateButton(sureBtn, CGRectMake(12, bgView.bottom+25, kMainScreenWidth-24, 40), @"确定", nil, nil, 16, [UIColor whiteColor]);
    sureBtn.backgroundColor = kBlueColor;
    sureBtn.layer.cornerRadius = 2.5;
    [sureBtn addTarget:self action:@selector(touchSureBtn) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:sureBtn];

}

- (void)touchJobBtn
{
    MLOG(@"1");
}

- (void)touchSureBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (UIView *)createLineView:(CGRect)aFrame lineColor:(UIColor *)aColor
{
    UIView *lineView = [[UIView alloc] initWithFrame:aFrame];
    lineView.backgroundColor = aColor;
    
    return lineView;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [nameTF resignFirstResponder];
    [detailTF resignFirstResponder];
    [phoneTF resignFirstResponder];
    [mailTF resignFirstResponder];
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
