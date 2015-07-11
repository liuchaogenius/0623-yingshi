//
//  SettingsViewController.m
//  YHB_Prj
//
//  Created by Johnny's on 15/6/29.
//  Copyright (c) 2015年 striveliu. All rights reserved.
//

#import "SettingsViewController.h"
#import "AppDelegate.h"
#import "RootTabBarController.h"
#import "SVProgressHUD.h"
#import "YYUser.h"

@interface SettingsViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    UIButton *outBtn;
}
@property(nonatomic, strong) UITableView *myTableView;
@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    
    self.myTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    [self.view addSubview:self.myTableView];
    
    kCreateButton(outBtn, CGRectMake(20, kMainScreenHeight-60-64, kMainScreenWidth-40, 40), @"登出", nil, nil, 15, [UIColor blackColor]);
    [outBtn addTarget:self action:@selector(touchOutBtn) forControlEvents:UIControlEventTouchDown];
    outBtn.backgroundColor = [UIColor whiteColor];
    outBtn.layer.borderWidth = 1;
    outBtn.layer.borderColor = [[UIColor blackColor] CGColor];
    outBtn.layer.cornerRadius = 2.5;
    [self.myTableView addSubview:outBtn];
}

- (void)touchOutBtn
{
    [self.navigationController popViewControllerAnimated:YES];
    [SVProgressHUD showSuccessWithStatus:@"退出成功" cover:YES offsetY:kMainScreenHeight/2.0];
    [[YYUser sharedYYUser] logoutUser];
    [self performSelector:@selector(selectMain) withObject:nil afterDelay:0.05];
}

- (void)selectMain
{
    AppDelegate *de = [UIApplication sharedApplication].delegate;
    RootTabBarController *vc = de.rootvc;
    vc.selectedIndex = 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = @"关于我们";
    
    return cell;
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
