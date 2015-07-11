//
//  LoginViewController.m
//  YHB_Prj
//
//  Created by Johnny's on 15/6/25.
//  Copyright (c) 2015年 striveliu. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "YYUserManage.h"

@interface LoginViewController ()<UITextFieldDelegate>
@property(nonatomic, strong) UIScrollView *backScrollView;
@property(nonatomic, strong) UIButton *backBtn;
@property(nonatomic, strong) UITextField *currentTextField;
@property(nonatomic, strong) UIButton *loginBtn;
@property(nonatomic, strong) UIButton *changeBtn;
@property(nonatomic) YYUserManage *manage;
@end

@implementation LoginViewController

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBCOLOR(155, 155, 155);
    
    self.manage = [[YYUserManage alloc] init];
    
    self.backScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.backScrollView.contentSize = CGSizeMake(kMainScreenWidth, kMainScreenHeight+110);
    [self.view addSubview:self.backScrollView];
    
    self.backBtn = [[UIButton alloc] initWithFrame:CGRectMake(kMainScreenWidth-24-14, 40, 24, 24)];
    [self.backBtn addTarget:self action:@selector(dismissVC) forControlEvents:UIControlEventTouchDown];
    [self.backBtn setImage:[UIImage imageNamed:@"X"] forState:UIControlStateNormal];
    [self.backScrollView addSubview:self.backBtn];
    
    NSArray *array = @[@"手机号码", @"密码"];
    for (int i=0; i<2; i++)
    {
        UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(12, 80+45*i, kMainScreenWidth-24, 44)];
        backView.backgroundColor = [UIColor whiteColor];
        [self.backScrollView addSubview:backView];
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(30, 80+45*i, kMainScreenWidth-12-30, 44)];
        textField.backgroundColor = [UIColor whiteColor];
        textField.font = kFont16;
        textField.tag = i+10;
        textField.delegate = self;
        textField.placeholder = array[i];
        textField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        if (i==1)
        {
            textField.returnKeyType = UIReturnKeyDone;
            textField.secureTextEntry = YES;
        }
        else
        {
            textField.returnKeyType = UIReturnKeyNext;
        }
        [self.backScrollView addSubview:textField];
    }
    self.currentTextField = (UITextField *)[self.backScrollView viewWithTag:10];
    [self.currentTextField becomeFirstResponder];
    
    self.loginBtn = [[UIButton alloc]
                        initWithFrame:CGRectMake(12, 80+45*2+28, kMainScreenWidth-24, (kMainScreenWidth-24)/7.0)];
    [self.loginBtn setTitle:@"登陆" forState:UIControlStateNormal];
    self.loginBtn.layer.cornerRadius = 5;
    self.loginBtn.backgroundColor = kBlueColor;
    [self.loginBtn addTarget:self action:@selector(touchLogin) forControlEvents:UIControlEventTouchDown];
    [self.backScrollView addSubview:self.loginBtn];
    
    self.changeBtn = [[UIButton alloc] initWithFrame:CGRectMake(kMainScreenWidth/2.0-80, self.loginBtn.bottom+16, 160, 25)];
    [self.changeBtn setTitle:@"还没有账号？注册" forState:UIControlStateNormal];
    self.changeBtn.titleLabel.font = kFont16;
    [self.changeBtn addTarget:self action:@selector(touchChange) forControlEvents:UIControlEventTouchDown];
    [self.backScrollView addSubview:self.changeBtn];
}

#pragma mark -进行登陆
- (void)touchLogin
{
    self.currentTextField = (UITextField *)[self.backScrollView viewWithTag:10];
    NSString *mobile = self.currentTextField.text;
    self.currentTextField = (UITextField *)[self.backScrollView viewWithTag:11];
    NSString *password = self.currentTextField.text;
    [self.manage loginInWithMobile:mobile andPwd:password andSucc:^(int aCode) {
        if (aCode==1)
        {
            [self resignResponder];
            [self dismissViewControllerAnimated:YES completion:nil];
        }
        else
        {
            
        }
    } andFail:^(NSString *aStr) {
        
    }];
}

- (void)touchChange
{
    [self resignResponder];
    [self.navigationController pushViewController:[[RegisterViewController alloc] init] animated:YES];
}


- (void)resignResponder
{
    for (int i=0; i<2; i++)
    {
        self.currentTextField = (UITextField *)[self.backScrollView viewWithTag:10+i];
        [self.currentTextField resignFirstResponder];
    }
}

- (void)dismissVC
{
    [self resignResponder];
    [self dismissViewControllerAnimated:YES completion:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:kLoginFailMessage object:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField
{
    for (int i=0; i<2; i++)
    {
        self.currentTextField = (UITextField *)[self.backScrollView viewWithTag:10+i];
        
        if (self.currentTextField == theTextField)
        {
            if (i<1)
            {
                UITextField *temTextField = (UITextField *)[self.backScrollView viewWithTag:11+i];
                [temTextField becomeFirstResponder];
                break;
            }
            else
            {
                [self touchLogin];
            }
        }
    }
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
