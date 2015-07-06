//
//  MenuViewController.m
//  YHB_Prj
//
//  Created by Johnny's on 15/6/28.
//  Copyright (c) 2015年 striveliu. All rights reserved.
//

#import "MenuViewController.h"
#import "AppDelegate.h"
#import "ResultViewController.h"
#import "IndustryManage.h"
#import "IndustryDataModels.h"
#define kViewWidthThis 270
@interface MenuViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    UIImageView *searchImgView;
    UITextField *searchTextField;
    UISegmentedControl *segmentedControl;
    
    UIView *jobView;
    UITableView *jobTableView1;
    UITableView *jobTableView2;
    int selectedIndex1;
    NSMutableArray *jobArray1;
    NSArray *jobArray2;
    NSArray *allJobArray;
    
    UIView *locaView;
    UITableView *locaTableView1;
    UITableView *locaTableView2;
    int selectedIndex2;
    NSMutableArray *locaArray1;
    NSArray *locaArray2;
    NSArray *allLocaArray;
}
@property(nonatomic, strong) UITableView *myTableView;
@property(nonatomic, strong) IndustryManage *manage;
@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    selectedIndex1 = -1;
    selectedIndex2 = -1;
    jobArray1 = [NSMutableArray new];
    jobArray2 = [NSArray new];
    locaArray1 = [NSMutableArray new];
    locaArray2 = [NSArray new];
    allJobArray = [NSArray new];
    allLocaArray = [NSArray new];
//    self.view.alpha = 0.3;
    
//    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kViewWidthThis, 114)];
//    topView.backgroundColor = [UIColor blackColor];
//    topView.alpha = 1;
//    [self.view addSubview:topView];
    
    kCreateImgView(searchImgView, CGRectMake(12, 40, 19, 20), IMAGE(@"search"));
    [self.view addSubview:searchImgView];
    
    searchTextField = [[UITextField alloc] initWithFrame:CGRectMake(searchImgView.right+3, searchImgView.top, kViewWidthThis-searchImgView.right-3-12, searchImgView.height)];
    searchTextField.font = kFont14;
    searchTextField.textColor = [UIColor whiteColor];
    searchTextField.placeholder = @"请输入关键字";
    [self.view addSubview:searchTextField];
    
    UIView *topLine = [[UIView alloc] initWithFrame:CGRectMake(12, searchImgView.bottom+5, kViewWidthThis-24, 1)];
    topLine.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:topLine];
    
    NSArray *itemArray = @[@"行业", @"地区"];
    segmentedControl = [[UISegmentedControl alloc] initWithItems:itemArray];
    segmentedControl.frame = CGRectMake(12, topLine.bottom+20, kViewWidthThis-24, 28);
    segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
    segmentedControl.selectedSegmentIndex = 0;
    segmentedControl.tintColor = RGBCOLOR(220, 220, 220);
    [segmentedControl setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], UITextAttributeTextColor, kFont14,UITextAttributeFont,nil] forState:UIControlStateNormal];
    [segmentedControl setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor], UITextAttributeTextColor, kFont14,UITextAttributeFont,nil] forState:UIControlStateSelected];
    [segmentedControl addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segmentedControl];
    
    [self createTableView];
    
    self.manage = [[IndustryManage alloc] init];
    [self.manage getIndustryArray:^(NSArray *aArray) {
        allJobArray = aArray;
        for (int i=0; i<aArray.count; i++)
        {
            IndustryData *data = [allJobArray objectAtIndex:i];
            [jobArray1 addObject:data.category];
        }
        [jobTableView1 reloadData];
    } andFail:^(NSString *aStr) {
        
    }];
    
//    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 200, 50, 50)];
//    btn.backgroundColor = [UIColor whiteColor];
//    [btn addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchDown];
//    [self.view addSubview:btn];
}

- (void)createTableView
{
    locaView = [[UIView alloc] initWithFrame:CGRectMake(0, segmentedControl.bottom, kViewWidthThis-12, kMainScreenHeight-segmentedControl.bottom)];
    locaView.backgroundColor = [UIColor blackColor];
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(locaView.width/2.0+14, 0, 1, locaView.height)];
    view2.backgroundColor = [UIColor whiteColor];
    
    locaTableView1 = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, locaView.width, locaView.height)];
    locaTableView1.backgroundColor = [UIColor blackColor];
    locaTableView1.delegate = self;
    locaTableView1.dataSource = self;
//    locaTableView1.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    locaTableView2 = [[UITableView alloc] initWithFrame:CGRectMake(locaView.width/2.0+15, 0, locaView.width/2-10, locaView.height)];
    locaTableView2.delegate = self;
    locaTableView2.dataSource = self;
    locaTableView2.backgroundColor = [UIColor blackColor];
    locaTableView2.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:locaView];
    [locaView addSubview:view2];
    [locaView addSubview:locaTableView2];
    [locaView addSubview:locaTableView1];
    
    jobView = [[UIView alloc] initWithFrame:CGRectMake(0, segmentedControl.bottom, kViewWidthThis-12, kMainScreenHeight-segmentedControl.bottom)];
    jobView.backgroundColor = [UIColor blackColor];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(jobView.width/2.0+14, 0, 1, jobView.height)];
    view.backgroundColor = [UIColor whiteColor];
    
    jobTableView1 = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, jobView.width, jobView.height)];
    jobTableView1.backgroundColor = [UIColor blackColor];
    jobTableView1.delegate = self;
    jobTableView1.dataSource = self;
    jobTableView1.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    jobTableView2 = [[UITableView alloc] initWithFrame:CGRectMake(jobView.width/2.0+15, 0, jobView.width/2-10, jobView.height)];
    jobTableView2.delegate = self;
    jobTableView2.dataSource = self;
    jobTableView2.backgroundColor = [UIColor blackColor];
    jobTableView2.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:jobView];
    [jobView addSubview:view];
    [jobView addSubview:jobTableView2];
    [jobView addSubview:jobTableView1];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == jobTableView1)
    {
        return jobArray1.count;
    }
    if (tableView == jobTableView2)
    {
        return jobArray2.count;
    }
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==jobTableView1)
    {
        static NSString *cellId1 = @"cell1";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId1];
        if (!cell)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId1];
            cell.textLabel.font = kFont14;
            cell.textLabel.textColor = [UIColor whiteColor];
            UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(12, 39.5, locaTableView1.width-12, 0.5)];
            lineView.backgroundColor = [UIColor whiteColor];
            [cell addSubview:lineView];
        }
        cell.backgroundColor = [UIColor clearColor];
        if (selectedIndex1>-1 && selectedIndex1==indexPath.row)
        {
            cell.backgroundColor = [UIColor blackColor];
        }
        IndustryCategory *cat = [jobArray1 objectAtIndex:indexPath.row];
        cell.textLabel.text = cat.name;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }
    if (tableView==jobTableView2)
    {
        static NSString *cellId2 = @"cell2";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId2];
        if (!cell)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId2];
            cell.textLabel.font = kFont14;
            cell.textLabel.textColor = [UIColor whiteColor];
        }
        cell.backgroundColor = [UIColor blackColor];
        IndustryIndustries *model = [jobArray2 objectAtIndex:indexPath.row];
        cell.textLabel.text = model.name;
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    if (tableView==locaTableView1)
    {
        static NSString *cellId1 = @"cell3";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId1];
        if (!cell)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId1];
            cell.textLabel.font = kFont14;
            cell.textLabel.textColor = [UIColor whiteColor];
        }
        cell.backgroundColor = [UIColor clearColor];
        if (selectedIndex2>-1 && selectedIndex2==indexPath.row)
        {
            cell.backgroundColor = [UIColor blackColor];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    if (tableView==locaTableView2)
    {
        static NSString *cellId2 = @"cell4";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId2];
        if (!cell)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId2];
            cell.textLabel.font = kFont14;
            cell.textLabel.textColor = [UIColor whiteColor];
        }
        cell.backgroundColor = [UIColor blackColor];
        cell.textLabel.text = [NSString stringWithFormat:@"%d", (int)indexPath.row+1];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    return [UITableViewCell new];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==jobTableView1)
    {
        jobTableView1.backgroundColor = [UIColor clearColor];
        selectedIndex1 = (int)indexPath.row;
        [jobTableView1 reloadData];
        IndustryData *data = [allJobArray objectAtIndex:indexPath.row];
        if (data.industries && data.industries.count>0)
        {
            [jobView bringSubviewToFront:jobTableView2];
            jobArray2 = data.industries;
            [jobTableView2 reloadData];
            [jobTableView2 scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
        }
        else
        {
            [jobView bringSubviewToFront:jobTableView1];
            NSString *str = [NSString stringWithFormat:@"%d", (int)data.category.categoryIdentifier];
            NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:str,@"industry", nil];
            [self pushToResult:dict withTitle:data.category.name];
        }
    }
    if (tableView==jobTableView2)
    {
        IndustryIndustries *model = [jobArray2 objectAtIndex:indexPath.row];
        NSString *str = [NSString stringWithFormat:@"%d", (int)model.industriesIdentifier];
        NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:str,@"industry", nil];
        [self pushToResult:dict withTitle:model.name];
    }
    if (tableView==locaTableView1)
    {
        locaTableView1.backgroundColor = [UIColor clearColor];
        [locaView bringSubviewToFront:locaTableView2];
        selectedIndex2 = (int)indexPath.row;
        [locaTableView1 reloadData];
        [locaTableView2 scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
        [locaTableView2 reloadData];
    }
}

- (void)pushToResult:(NSDictionary *)aDict withTitle:(NSString *)aTitle
{
    AppDelegate *de = [UIApplication sharedApplication].delegate;
    ResultViewController *vc = [[ResultViewController alloc] initWithDict:aDict];
    vc.title = aTitle;
    [de.FVC.navigationController pushViewController:vc animated:YES];
}

- (void)change:(UISegmentedControl *)sender
{
//    MLOG(@"%d", (int)segmentedControl.selectedSegmentIndex);
    int selectedIndex = (int)segmentedControl.selectedSegmentIndex;
    if (selectedIndex==0)
    {
        [self.view bringSubviewToFront:jobView];
    }
    else
    {
        [self.view bringSubviewToFront:locaView];
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
