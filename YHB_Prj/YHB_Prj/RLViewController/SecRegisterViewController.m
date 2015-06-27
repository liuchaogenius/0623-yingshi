//
//  SecRegisterViewController.m
//  YHB_Prj
//
//  Created by Johnny's on 15/6/25.
//  Copyright (c) 2015年 striveliu. All rights reserved.
//

#import "SecRegisterViewController.h"
#import "JKCountDownButton.h"
#import "RegisterManage.h"
#import "SVProgressHUD.h"
#import "ThrRegisterViewController.h"

@interface SecRegisterViewController ()<UITextFieldDelegate>
@property(nonatomic, strong) UITextField *myTextfield;
@property(nonatomic, strong) UIButton *nextBtn;
@property(nonatomic, strong) JKCountDownButton *changeBtn;
@property(nonatomic) int status;
@property(nonatomic, strong) RegisterManage *manage;
@property(nonatomic) NSMutableDictionary *userDict;
@end

@implementation SecRegisterViewController

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
}

- (instancetype)initWithUserDict:(NSMutableDictionary *)aUserDict
{
    if (self = [super init])
    {
        self.userDict = [NSMutableDictionary new];
        self.userDict = aUserDict;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBCOLOR(237, 238, 244);
    [self setTitle:@"注册"];
    self.status = 0;
    self.manage = [[RegisterManage alloc] init];
    
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 24, kMainScreenWidth-120, 35)];
    backView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backView];
    
    self.myTextfield = [[UITextField alloc] initWithFrame:CGRectMake(12, 24, kMainScreenWidth-120-12, 35)];
    self.myTextfield.backgroundColor = [UIColor whiteColor];
    self.myTextfield.font = kFont16;
    self.myTextfield.returnKeyType = UIReturnKeyDone;
    self.myTextfield.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    self.myTextfield.placeholder = @"输入短信验证码";
    [self.view addSubview:self.myTextfield];
    
    self.changeBtn = [JKCountDownButton buttonWithType:UIButtonTypeCustom];
    self.changeBtn.frame = CGRectMake(backView.right, backView.top, 120, 35);
    [self.changeBtn setTitle:@"点击获取验证码" forState:UIControlStateNormal];
    self.changeBtn.backgroundColor = RGBCOLOR(34, 35, 36);
    self.changeBtn.titleLabel.font = kFont16;
    [self.view addSubview:self.changeBtn];
    
    __weak UIButton *btn = self.changeBtn;
    __weak RegisterManage *manage = self.manage;
    __weak UITextField *textfield = self.myTextfield;
    [self.changeBtn addToucheHandler:^(JKCountDownButton*sender, NSInteger tag) {
        if (textfield.text.length == 11)
        {
            sender.enabled = NO;
            [manage getVaildWithPhone:textfield.text andSucc:^{
                
            } andFail:^(NSString *aStr) {
                
            }];
            [sender startWithSecond:60];
            
            [sender didChange:^NSString *(JKCountDownButton *countDownButton,int second) {
                btn.backgroundColor = RGBCOLOR(193, 193, 193);
                NSString *title = [NSString stringWithFormat:@"重新发送%d秒",second];
                return title;
            }];
            [sender didFinished:^NSString *(JKCountDownButton *countDownButton, int second) {
                countDownButton.enabled = YES;
                btn.backgroundColor = RGBCOLOR(34, 35, 36);
                return @"点击重新获取";
                
            }];
        }
        else
        {
            [SVProgressHUD showErrorWithStatus:@"请输入正确的手机号" cover:YES offsetY:kMainScreenHeight/2.0];
        }
    }];
    
    self.nextBtn = [[UIButton alloc] initWithFrame:CGRectMake(12, self.myTextfield.bottom+28, kMainScreenWidth-24, 35)];
    self.nextBtn.layer.cornerRadius = 2.5;
    [self.nextBtn addTarget:self action:@selector(touchNext) forControlEvents:UIControlEventTouchDown];
    [self.nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    self.nextBtn.backgroundColor = kBlueColor;
    [self.view addSubview:self.nextBtn];
}

- (void)touchNext
{
    [self.userDict setObject:self.myTextfield.text forKey:@"valid"];
    [self.navigationController pushViewController:[[ThrRegisterViewController alloc] initWithUserDict:self.userDict] animated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField
{
    [self.myTextfield resignFirstResponder];
    [self touchNext];
    return YES;
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
