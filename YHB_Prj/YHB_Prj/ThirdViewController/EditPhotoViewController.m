//
//  EditPhotoViewController.m
//  YHB_Prj
//
//  Created by Johnny's on 15/6/27.
//  Copyright (c) 2015年 striveliu. All rights reserved.
//

#import "EditPhotoViewController.h"

@interface EditPhotoViewController ()
@property(nonatomic, strong) UIImageView *topImgView;
@property(nonatomic, strong) UITextField *titleTextfield;
@property(nonatomic, strong) UITextField *detailTextfield;
@property(nonatomic) NSMutableArray *myPhotoArray;
@property(nonatomic, strong) UIButton *addBtn;
@end

@implementation EditPhotoViewController

- (instancetype)initWithPhotoArray:(NSArray *)aPhotoArray
{
    if (self = [super init]) {
        self.myPhotoArray = [NSMutableArray new];
        self.myPhotoArray = [aPhotoArray mutableCopy];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self settitleLabel:@"编辑内容"];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setRightButton:nil title:@"发表" target:self action:@selector(push)];
    
    self.topImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, kMainScreenWidth)];
    [self.view addSubview:self.topImgView];
    
    if (self.myPhotoArray.count>0)
    {
        [self.topImgView setImage:[self.myPhotoArray objectAtIndex:0]];
    }
    
    UIView *textfieldView = [[UIView alloc] initWithFrame:CGRectMake(20, self.topImgView.bottom-60, kMainScreenWidth-40, 40)];
    textfieldView.layer.borderWidth = 0.5;
    textfieldView.layer.borderColor = [[UIColor blackColor] CGColor];
    [self.view addSubview:textfieldView];
    
    self.titleTextfield = [[UITextField alloc] initWithFrame:CGRectMake(10, 0, kMainScreenWidth-60, 40)];
    self.titleTextfield.font = kFont16;
    [self.titleTextfield setTextColor:[UIColor whiteColor]];
    self.titleTextfield.placeholder = @"标题";
    [textfieldView addSubview:self.titleTextfield];
    
    self.detailTextfield = [[UITextField alloc] initWithFrame:CGRectMake(20, self.topImgView.bottom+20, kMainScreenWidth-40, 25)];
    self.detailTextfield.textColor = [UIColor blackColor];
    self.detailTextfield.font = kFont12;
    self.detailTextfield.placeholder = @"说说我的故事";
    [self.view addSubview:self.detailTextfield];
    
    self.addBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, self.detailTextfield.bottom+28, (kMainScreenWidth-60)/2, (kMainScreenWidth-60)/2)];
    self.addBtn.layer.borderColor = [[UIColor blackColor] CGColor];
    self.addBtn.layer.borderWidth = 0.5;
    [self.view addSubview:self.addBtn];
}

- (void)push
{
    
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
