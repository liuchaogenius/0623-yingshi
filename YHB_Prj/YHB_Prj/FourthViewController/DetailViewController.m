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


@interface DetailViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    BOOL isMine;
    int bgCount;
}

@property(nonatomic, strong) UITableView *myTableView;
@end

@implementation DetailViewController

- (instancetype)initWithIsMine:(BOOL)aBool
{
    if (self = [super init])
    {
        isMine = aBool;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    bgCount=2;
    
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
            return 200;
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
            return cell;
        }
        else if(indexPath.row==1)
        {
            DOTableViewCell2 *cell = [[DOTableViewCell2 alloc] init];
            return cell;
        }
        else if(indexPath.row==2)
        {
            DOTableViewCell3 *cell = [[DOTableViewCell3 alloc] init];
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
