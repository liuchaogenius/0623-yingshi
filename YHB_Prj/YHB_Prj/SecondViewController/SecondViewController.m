//
//  SecondViewController.m
//  YHB_Prj
//
//  Created by  striveliu on 14-11-9.
//  Copyright (c) 2014年 striveliu. All rights reserved.
//

#import "SecondViewController.h"
#import "IntroduceWebView.h"

@interface SecondViewController ()
{
    IntroduceWebView *webView;
}
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self settitleLabel:@"品牌页"];
    webView = [[IntroduceWebView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, kMainScreenHeight-49-62)];
    [webView loadUrl:@"http://www.aclili.com:3040/brand/brand.html"];
    [self.view addSubview:webView];
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
