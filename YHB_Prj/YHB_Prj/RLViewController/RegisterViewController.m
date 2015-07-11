//
//  RegisterViewController.m
//  YHB_Prj
//
//  Created by Johnny's on 15/6/24.
//  Copyright (c) 2015年 striveliu. All rights reserved.
//

#import "RegisterViewController.h"
#import "LoginViewController.h"
#import "SecRegisterViewController.h"

@interface RegisterViewController ()<UITextFieldDelegate>
@property(nonatomic, strong) UIScrollView *backScrollView;
@property(nonatomic, strong) UIButton *backBtn;
@property(nonatomic, strong) UITextField *currentTextField;
@property(nonatomic, strong) UIButton *registerBtn;
@property(nonatomic, strong) UIButton *changeBtn;
@end

@implementation RegisterViewController

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBCOLOR(155, 155, 155);
    
    self.backScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.backScrollView.contentSize = CGSizeMake(kMainScreenWidth, kMainScreenHeight+130);
    [self.view addSubview:self.backScrollView];
    
    self.backBtn = [[UIButton alloc] initWithFrame:CGRectMake(kMainScreenWidth-24-14, 40, 24, 24)];
    [self.backBtn addTarget:self action:@selector(dismissVC) forControlEvents:UIControlEventTouchDown];
    [self.backBtn setImage:[UIImage imageNamed:@"X"] forState:UIControlStateNormal];
    [self.backScrollView addSubview:self.backBtn];
    
    NSArray *array = @[@"用户名", @"输入手机号", @"输入6位数邀请码"];
    for (int i=0; i<3; i++)
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
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        if (i!=0)
        {
            textField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
        }
        if (i==2)
        {
            textField.returnKeyType = UIReturnKeyDone;
        }
        else
        {
            textField.returnKeyType = UIReturnKeyNext;
        }
        [self.backScrollView addSubview:textField];
    }
    self.currentTextField = (UITextField *)[self.backScrollView viewWithTag:10];
    [self.currentTextField becomeFirstResponder];
    
    self.registerBtn = [[UIButton alloc]
                        initWithFrame:CGRectMake(12, 80+45*3+28, kMainScreenWidth-24, (kMainScreenWidth-24)/7.0)];
    [self.registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    self.registerBtn.layer.cornerRadius = 5;
    self.registerBtn.backgroundColor = kBlueColor;
    [self.registerBtn addTarget:self action:@selector(touchRegister) forControlEvents:UIControlEventTouchDown];
    [self.backScrollView addSubview:self.registerBtn];
    
    self.changeBtn = [[UIButton alloc] initWithFrame:CGRectMake(kMainScreenWidth/2.0-80, self.registerBtn.bottom+16, 160, 25)];
    [self.changeBtn setTitle:@"已有账号？登陆" forState:UIControlStateNormal];
    self.changeBtn.titleLabel.font = kFont16;
    [self.changeBtn addTarget:self action:@selector(touchChange) forControlEvents:UIControlEventTouchDown];
    [self.backScrollView addSubview:self.changeBtn];
}

#pragma mark -进行注册
- (void)touchRegister
{
#warning 判断输入框的内容
    self.currentTextField = (UITextField *)[self.backScrollView viewWithTag:10];
    NSString *userName = self.currentTextField.text;
    self.currentTextField = (UITextField *)[self.backScrollView viewWithTag:11];
    NSString *mobile = self.currentTextField.text;
    NSMutableDictionary *userDict = [[NSMutableDictionary alloc]
                                     initWithObjectsAndKeys:userName,@"userName", mobile, @"mobile", nil];
    [self.navigationController pushViewController:[[SecRegisterViewController alloc] initWithUserDict:userDict] animated:YES];
}

- (void)touchChange
{
    [self resignResponder];
    [self.navigationController pushViewController:[[LoginViewController alloc] init] animated:YES];
}

- (void)resignResponder
{
    for (int i=0; i<3; i++)
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
    for (int i=0; i<3; i++)
    {
        self.currentTextField = (UITextField *)[self.backScrollView viewWithTag:10+i];

        if (self.currentTextField == theTextField)
        {
            if (i<2)
            {
                UITextField *temTextField = (UITextField *)[self.backScrollView viewWithTag:11+i];
                [temTextField becomeFirstResponder];
                break;
            }
            else
            {
                [self touchRegister];
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
