//
//  DetailViewController.m
//  YHB_Prj
//
//  Created by Johnny's on 15/6/30.
//  Copyright (c) 2015年 striveliu. All rights reserved.
//

#import "DetailViewController.h"
#import "DOTableViewCell.h"
#import "EditViewController.h"
#import "BGTableViewCell.h"
#import "AddBGViewController.h"
#import "YYUser.h"
#import "DetailVCManage.h"


@interface DetailViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    BOOL isMine;
    int bgCount;
    NSString *userId;
    DetailVCData *myData;
    DetailVCManage *manage;
}
@property(nonatomic, strong) UITableView *myTableView;
@end

@implementation DetailViewController

- (instancetype)initWithData:(DetailVCData *)aData
{
    if (self = [super init])
    {
        myData = aData;
        isMine = YES;
    }
    return self;
}

- (instancetype)initWithUserId:(NSString *)aUserId
{
    if (self = [super init])
    {
        userId = aUserId;
        if ([YYUser sharedYYUser].isLogin && [YYUser sharedYYUser].userInfo.userId==[aUserId intValue])
        {
            isMine = YES;
        }
        else isMine = NO;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    bgCount=0;
    
    int tableH;
    if (isMine)
    {
        self.title = @"我的履历";
        tableH = kMainScreenHeight-64;
    }
    else tableH = kMainScreenHeight-64-40;
    
    self.myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, tableH)
                                                    style:UITableViewStyleGrouped];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    [self.view addSubview:self.myTableView];
    
    if (userId)
    {
        manage = [[DetailVCManage alloc] init];
        [manage getUserDetailWithUserId:userId andSucc:^(DetailVCData *data) {
            myData = data;
            bgCount = (int)data.tUserVO.tUserProfileList.count;
            [self.myTableView reloadData];
        } andFail:^(NSString *aStr) {
            
        }];
    }
    if (myData)
    {
        bgCount = (int)myData.tUserVO.tUserProfileList.count;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0)
    {
        if (isMine)
        {
            return 3;
        }
        else
        {
            return 4;
        }
    }
    else
    {
        return bgCount+1;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        if (indexPath.row==0)
        {
            return kMainScreenWidth;
        }
        else if(indexPath.row==1)
        {
            return 70;
        }
        else if(indexPath.row==2)
        {
            return 78;
        }
        else
        {
            return 70;
        }
    }
    else
    {
        if (isMine && indexPath.row==bgCount)
        {
            return 40;
        }
        else
        {
            return 92;
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.5;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section==0)
    {
        UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, 40)];
        UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 40-23, 100, 20)];
        textLabel.font = kFont14;
        textLabel.text = @"背景";
        textLabel.textColor = [UIColor lightGrayColor];
        [footerView addSubview:textLabel];
        return footerView;
    }
    else
    {
        return [UIView new];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        if (indexPath.row==0)
        {
            DOTableViewCell1 *cell = [[DOTableViewCell1 alloc] init];
            if (myData) [cell setCellWithData:myData.tUserVO.tUserInfo];
            return cell;
        }
        else if(indexPath.row==1)
        {
            DOTableViewCell2 *cell = [[DOTableViewCell2 alloc] init];
            if (myData) [cell setCellWithData:myData.tUserVO.tUserInfo];
            return cell;
        }
        else if(indexPath.row==2)
        {
            DOTableViewCell3 *cell = [[DOTableViewCell3 alloc] init];
            if (myData) [cell setCellWithData:myData.tUserVO.tUserInfo];
            if (isMine)
            {
                UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(kMainScreenWidth-12-15, 78-15-8, 9, 15)];
                imgView.image = IMAGE(@"arrowRight");
                [cell addSubview:imgView];
                UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(imgView.left-30, imgView.top, 30, imgView.height)];
                textLabel.textColor = [UIColor lightGrayColor];
                textLabel.font=kFont12;
                textLabel.text = @"编辑";
                [cell addSubview:textLabel];
            }
            return cell;
        }
        else
        {
            DOTableViewCell4 *cell = [[DOTableViewCell4 alloc] init];
            return cell;
        }
    }
    else
    {
        if (isMine && indexPath.row==bgCount)
        {
            UITableViewCell *cell = [[UITableViewCell alloc] init];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            UILabel *la = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, 40)];
            la.text = @"添加职业背景";
            la.font = kFont16;
            la.textAlignment = NSTextAlignmentCenter;
            la.textColor = RGBCOLOR(0, 183, 210);
            [cell addSubview:la];
            return cell;
        }
        else
        {
            static NSString *bgCell = @"bgCell";
            BGTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:bgCell];
            if (!cell)
            {
                cell = [[BGTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:bgCell];
            }
            NSArray *array = myData.tUserVO.tUserProfileList;
            DetailVCTUserProfileList *profile = [array objectAtIndex:indexPath.row];
            [cell setCellWithData:profile];
            return cell;
        }
    }
    
    return [UITableViewCell new];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0 && indexPath.row==2)
    {
        if (isMine)
        {
            EditViewController *vc = [[EditViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
        else
        {
            
        }
    }
    if (indexPath.section==1 && isMine && indexPath.row==bgCount)
    {
        AddBGViewController *vc = [[AddBGViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark tableview delete
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (isMine)
    {
        if (indexPath.section==1&&indexPath.row!=bgCount) return YES;
        else return NO;
    }
    else
    {
        return NO;
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete && indexPath.section==1)
    {
        NSMutableArray *mutableArray = [myData.tUserVO.tUserProfileList mutableCopy];
        [mutableArray removeObjectAtIndex:indexPath.row];
        NSArray *array = [NSArray arrayWithArray:mutableArray];
        myData.tUserVO.tUserProfileList = array;
        bgCount = (int)myData.tUserVO.tUserProfileList.count;
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
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
