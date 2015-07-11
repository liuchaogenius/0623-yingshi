//
//  FourthViewController.m
//  YHB_Prj
//
//  Created by  striveliu on 14-11-9.
//  Copyright (c) 2014年 striveliu. All rights reserved.
//

#import "FourthViewController.h"
#import "FirstTableViewCell.h"
#import "SecondTableViewCell.h"
#import "InviteViewController.h"
#import "SettingsViewController.h"
#import "DetailViewController.h"
#import "NotifyFactoryObject.h"
#import "YYUser.h"
#import "FourthViewController.h"
#import "DetailVCManage.h"
#import "DetailVCModels.h"

@interface FourthViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    DetailVCData *myData;
}
@property (nonatomic, strong) DetailVCManage *manage;
@property(nonatomic, strong) UITableView *myTableView;
@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self settitleLabel:@"个人中心"];
    
    self.myTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.automaticallyAdjustsScrollViewInsets = false;
    [self.view addSubview:self.myTableView];
    
    if ([YYUser sharedYYUser].isLogin)
    {
        [self getDetail];
    }
    
    [NotifyFactoryObject registerLoginSuccMsgNotify:self action:@selector(getDetail)];
    [NotifyFactoryObject registerLogOut:self action:@selector(reloadTableView)];
}

- (void)getDetail
{
    NSString *userId = [NSString stringWithFormat:@"%d", (int)[YYUser sharedYYUser].userInfo.userId];
    [self.manage getUserDetailWithUserId:userId andSucc:^(DetailVCData *data) {
        myData = data;
        [self.myTableView reloadData];
    } andFail:^(NSString *aStr) {
        
    }];
}

- (DetailVCManage *)manage
{
    if (!_manage)
    {
        _manage = [[DetailVCManage alloc] init];
    }
    return _manage;
}

- (void)reloadTableView
{
    myData = nil;
    [self.myTableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 19.5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section >= 2)
    {
        return 44;
    }
    return 70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        FirstTableViewCell *cell = [[FirstTableViewCell alloc] init];
        return cell;
    }
    else if (indexPath.section==1)
    {
        SecondTableViewCell *cell = [[SecondTableViewCell alloc] init];
        if (myData)
        {
            [cell setCellArray:myData.listHasPicFeeds];
        }
        return cell;
    }
    else
    {
        UITableViewCell *cell = [[UITableViewCell alloc] init];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//        if (indexPath.section==2)
//        {
//            cell.textLabel.text = @"我的邀请卡";
//        }
//        else
//        {
            cell.textLabel.text = @"设置";
//        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        DetailViewController *vc = [[DetailViewController alloc] initWithData:myData];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.section==2)
    {
//        InviteViewController *vc = [[InviteViewController alloc] init];
//        vc.hidesBottomBarWhenPushed = YES;
//        [self.navigationController pushViewController:vc animated:YES];
        SettingsViewController *vc = [[SettingsViewController alloc] init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
//    if (indexPath.section==3)
//    {
//        SettingsViewController *vc = [[SettingsViewController alloc] init];
//        vc.hidesBottomBarWhenPushed = YES;
//        [self.navigationController pushViewController:vc animated:YES];
//    }
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
