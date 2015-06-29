//
//  FirstViewController.m
//  YHB_Prj
//
//  Created by  striveliu on 14-11-9.
//  Copyright (c) 2014年 striveliu. All rights reserved.
//

#import "FirstViewController.h"
#import "SlideImageView.h"
#import "FirstManage.h"
#import "AppDelegate.h"

@interface FirstViewController ()<SlideImageViewDelegate>
@property(nonatomic, strong) SlideImageView *slideImageView;
@property(nonatomic, strong) FirstManage *manage;
@end

@implementation FirstViewController

- (void)panGestureRecognized:(UIPanGestureRecognizer *)sender
{
    AppDelegate *de = [UIApplication sharedApplication].delegate;
    [de.FVC panGestureRecognized:sender];
}

- (void)touchClass
{
    AppDelegate *de = [UIApplication sharedApplication].delegate;
    [de.FVC presentMenuViewController];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self settitleLabel:@"广场"];
    
    UIButton *leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 24, 24)];
    [leftBtn addTarget:self action:@selector(touchClass) forControlEvents:UIControlEventTouchDown];
    [leftBtn setImage:IMAGE(@"class") forState:UIControlStateNormal];
    UIBarButtonItem *leftBI = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftBI;
    
    UIImageView *bgImgView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    bgImgView.image = IMAGE(@"bg");
    [self.view addSubview:bgImgView];
    
    CGRect rect = {{(kMainScreenWidth-265)/2.0,40},{265,380}};
    self.slideImageView = [[SlideImageView alloc]initWithFrame:rect ZMarginValue:5 XMarginValue:10 AngleValue:0.0 Alpha:1000];
    self.slideImageView.borderColor = [UIColor whiteColor];
    self.slideImageView.delegate = self;
    [self.view addSubview:self.slideImageView];
    
    self.manage = [[FirstManage alloc] init];
    [self.manage getFirstArray:^(NSArray *aArray) {
        for(int i=0; i<aArray.count; i++)
        {
            FirstTUserFeedsVOList *model = [aArray objectAtIndex:i];
            [self.slideImageView addModel:model];
        }
        [self.slideImageView setImageShadowsWtihDirectionX:2 Y:2 Alpha:0.7];
        [self.slideImageView reLoadUIview];
    } andFail:^(NSString *aStr) {
        
    }];
    
    UIPanGestureRecognizer *panGes = [[UIPanGestureRecognizer alloc]
                                      initWithTarget:self action:@selector(panGestureRecognized:)];
    [self.view addGestureRecognizer:panGes];
}

- (void)SlideImageViewDidClickWithIndex:(int)index
{
    NSString* indexStr = [[NSString alloc]initWithFormat:@"点击了第%d张",index];
    MLOG(@"%@", indexStr);
}

- (void)SlideImageViewDidEndScorllWithIndex:(int)index
{
    NSString* indexStr = [[NSString alloc]initWithFormat:@"当前为第%d张",index];
    MLOG(@"%@", indexStr);
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
