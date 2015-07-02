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
#define kViewWidthThis 270
@interface MenuViewController ()
{
    UIImageView *searchImgView;
    UITextField *searchTextField;
    UISegmentedControl *segmentedControl;
}
@property(nonatomic, strong) UITableView *myTableView;
@property(nonatomic, strong) IndustryManage *manage;
@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
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
    
    self.manage = [[IndustryManage alloc] init];
    [self.manage getIndustryArray:^(NSArray *aArray) {
        
    } andFail:^(NSString *aStr) {
        
    }];
    
//    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 200, 50, 50)];
//    btn.backgroundColor = [UIColor whiteColor];
//    [btn addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchDown];
//    [self.view addSubview:btn];
}

- (void)push
{
    AppDelegate *de = [UIApplication sharedApplication].delegate;
    [de.FVC.navigationController pushViewController:[ResultViewController new] animated:YES];
}

- (void)change:(UISegmentedControl *)sender
{
    MLOG(@"%d", (int)segmentedControl.selectedSegmentIndex);
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
