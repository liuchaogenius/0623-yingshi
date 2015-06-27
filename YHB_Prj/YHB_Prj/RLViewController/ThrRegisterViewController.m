//
//  ThrViewController.m
//  YHB_Prj
//
//  Created by Johnny's on 15/6/25.
//  Copyright (c) 2015年 striveliu. All rights reserved.
//

#import "ThrRegisterViewController.h"

@interface ThrRegisterViewController ()<UITextFieldDelegate>
@property(nonatomic, strong) UITextField *myTextfield;
@property(nonatomic, strong) UIButton *nextBtn;
@property(nonatomic) NSMutableDictionary *userDict;
@end

@implementation ThrRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBCOLOR(237, 238, 244);
    [self setTitle:@"编辑密码"];
    
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 24, kMainScreenWidth, 35)];
    backView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backView];
    
    self.myTextfield = [[UITextField alloc] initWithFrame:CGRectMake(12, 24, kMainScreenWidth-12, 35)];
    self.myTextfield.backgroundColor = [UIColor whiteColor];
    self.myTextfield.font = kFont16;
    self.myTextfield.returnKeyType = UIReturnKeyDone;
    self.myTextfield.placeholder = @"设置密码";
    self.myTextfield.secureTextEntry = YES;
    [self.view addSubview:self.myTextfield];

    self.nextBtn = [[UIButton alloc] initWithFrame:CGRectMake(12, self.myTextfield.bottom+28, kMainScreenWidth-24, 35)];
    self.nextBtn.layer.cornerRadius = 2.5;
    [self.nextBtn addTarget:self action:@selector(touchNext) forControlEvents:UIControlEventTouchDown];
    [self.nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    self.nextBtn.backgroundColor = kBlueColor;
    [self.view addSubview:self.nextBtn];
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

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField
{
    [self.myTextfield resignFirstResponder];
    [self touchNext];
    return YES;
}

- (void)touchNext
{
    [self.userDict setObject:self.myTextfield.text forKey:@"passWord"];
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
