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

@interface FirstViewController ()<SlideImageViewDelegate>
@property(nonatomic, strong) SlideImageView *slideImageView;
@property(nonatomic, strong) FirstManage *manage;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBCOLOR(40, 41, 41);
    [self settitleLabel:@"广场"];
    [self setLeftButton:IMAGE(@"class") title:nil target:self action:@selector(touchClass)];
    
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
}

- (void)touchClass
{
    
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
