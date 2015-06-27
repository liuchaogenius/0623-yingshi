//
//  RLViewController.m
//  YHB_Prj
//
//  Created by Johnny's on 15/6/24.
//  Copyright (c) 2015年 striveliu. All rights reserved.
//

#import "RLViewController.h"
#import "RegisterViewController.h"
#import "LoginViewController.h"

@interface RLViewController ()
@property(nonatomic, strong) UIButton *registerBtn;
@property(nonatomic, strong) UIButton *loginBtn;
@end

@implementation RLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = RGBCOLOR(255, 255, 200);
    
    self.registerBtn = [[UIButton alloc]
                        initWithFrame:CGRectMake(12, kMainScreenHeight-58, kMainScreenWidth/2.0-16, 40)];
    self.registerBtn.backgroundColor = [UIColor whiteColor];
    [self.registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    [self.registerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.registerBtn.layer.cornerRadius = 2.5;
    [self.registerBtn addTarget:self action:@selector(touchRegister) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:self.registerBtn];
    
    self.loginBtn = [[UIButton alloc]
                     initWithFrame:CGRectMake(self.registerBtn.right+8, self.registerBtn.top, kMainScreenWidth/2.0-16, 40)];
    self.loginBtn.backgroundColor = kBlueColor;
    [self.loginBtn setTitle:@"登陆" forState:UIControlStateNormal];
    self.loginBtn.layer.cornerRadius = 2.5;
    [self.loginBtn addTarget:self action:@selector(touchLogin) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:self.loginBtn];
}

- (void)touchRegister
{
    UINavigationController *nav = [[UINavigationController alloc]
                                   initWithRootViewController:[[RegisterViewController alloc] init]];
    [self presentViewController:nav animated:YES completion:nil];
}

- (void)touchLogin
{
    UINavigationController *nav = [[UINavigationController alloc]
                                   initWithRootViewController:[[LoginViewController alloc] init]];
    [self presentViewController:nav animated:YES completion:nil];
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
