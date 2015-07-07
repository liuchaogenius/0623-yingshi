//
//  ResultViewController.m
//  YHB_Prj
//
//  Created by Johnny's on 15/6/28.
//  Copyright (c) 2015年 striveliu. All rights reserved.
//

#import "ResultViewController.h"
#import "ResultTableViewCell.h"
#import "SVPullToRefresh.h"
#import "ResultManage.h"
#import "SingleUserFeedsViewController.h"
#import "ResultDataModels.h"

@interface ResultViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    NSDictionary *myDict;
    ResultManage *manage;
    NSMutableArray *dataArray;
}
@property (nonatomic, strong) UITableView *myTableView;
@end

@implementation ResultViewController

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
}

- (instancetype)initWithDict:(NSDictionary *)aDict
{
    if (self = [super init])
    {
        myDict = aDict;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor blackColor];
    manage = [[ResultManage alloc] init];
    
    UIImageView *bgImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, -64, kMainScreenWidth, kMainScreenHeight)];
    bgImgView.image = IMAGE(@"bg");
    [self.view addSubview:bgImgView];
    
    self.myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, kMainScreenHeight-64)];
    self.myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.myTableView.backgroundColor = [UIColor clearColor];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    [self.view addSubview:self.myTableView];
    
    [self addTableViewTrag];
    
    [manage getResultArrayWithDict:myDict success:^(NSArray *aArray) {
        dataArray = [aArray mutableCopy];
        [self.myTableView reloadData];
    } andFail:^(NSString *aStr) {
        
    }];
}

#pragma mark 增加上拉下拉
- (void)addTableViewTrag
{
    __weak ResultViewController *weakself = self;
    [weakself.myTableView addPullToRefreshWithActionHandler:^{
        [weakself.myTableView.pullToRefreshView stopAnimating];

    }];
    
    
    [weakself.myTableView addInfiniteScrollingWithActionHandler:^{
        [weakself.myTableView.infiniteScrollingView stopAnimating];
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kMainScreenWidth-40+20+40;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"resultCell";
    ResultTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell = [[ResultTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    ResultListSearchTUserVO *vo = [dataArray objectAtIndex:indexPath.row];
    ResultTUserInfo *userInfo = vo.tUserInfo;
    [cell setCellWithData:userInfo];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    ResultListSearchTUserVO *vo = [dataArray objectAtIndex:indexPath.row];
//
//    SingleUserFeedsViewController *vc = [SingleUserFeedsViewController alloc] initWithId:
//    [self.navigationController pushViewController:[SingleUserFeedsViewController new] animated:YES];
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
