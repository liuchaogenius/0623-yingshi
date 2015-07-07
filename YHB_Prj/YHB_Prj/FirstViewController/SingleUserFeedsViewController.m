//
//  SingleUserFeedsViewController.m
//  YHB_Prj
//
//  Created by Johnny's on 15/7/7.
//  Copyright (c) 2015年 striveliu. All rights reserved.
//

#import "SingleUserFeedsViewController.h"
#import "CommentTVCell.h"
#import "SingleUserFeedsManage.h"

@interface SingleUserFeedsViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    BOOL isHide;
    BOOL isHaveData;
    SingleUserFeedsManage *manage;
    NSString *myid;
    NSMutableArray *commentArray;
    CGFloat secondCellHeight;
}
@property(nonatomic, strong) UITableView *myTableView;
@end

@implementation SingleUserFeedsViewController

- (instancetype)initWithId:(NSString *)aId
{
    if (self = [super init])
    {
        myid = aId;
        NSString *textStr = @"发球方嘎达路附近嘎达非公开的韩国发快递就回复该骄傲的回复刚卡机发球方嘎达路附近嘎达非公开的韩国发快递就回复该骄傲的回复刚卡机发健康法哈德尽快发哈";
        CGRect textFrame = [textStr boundingRectWithSize:CGSizeMake(kMainScreenWidth-24,1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:kFont14}context:nil];
        secondCellHeight = textFrame.size.height+24.0;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    isHide = YES;
    isHaveData = NO;
    
    self.myTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.myTableView];
    
    manage = [[SingleUserFeedsManage alloc] init];
}

- (void)change:(UIButton *)aBtn;
{
    [manage getSingleUserFeedsArrayWithID:myid success:^(NSArray *aArray) {
        commentArray = [NSMutableArray new];
        commentArray = [aArray mutableCopy];
        NSMutableArray *mutaArray = [NSMutableArray new];
        for (int i=0; i<commentArray.count; i++)
        {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:3+i inSection:0];
            [mutaArray addObject:indexPath];
        }
        isHaveData = YES;
        [self.myTableView insertRowsAtIndexPaths:mutaArray withRowAnimation:UITableViewRowAnimationFade];
        isHide = NO;
        [self.myTableView beginUpdates];
        [self.myTableView endUpdates];
        [aBtn removeFromSuperview];
    } andFail:^(NSString *aStr) {
        
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (isHaveData==NO) return 3;
    else return 3+commentArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0)
    {
        return kMainScreenWidth;
    }
    
    if (indexPath.row==1 && isHide==YES)
    {
        return kMainScreenHeight-62-50-kMainScreenWidth;
    }
    if (indexPath.row==1 && isHide==NO)
    {
        return secondCellHeight;
    }
    
    if (indexPath.row==2)
    {
        return 50;
    }
    
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0)
    {
        UITableViewCell *cell = [[UITableViewCell alloc] init];
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, kMainScreenWidth)];
        imgView.backgroundColor = [UIColor yellowColor];
        [cell addSubview:imgView];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    if (indexPath.row==1)
    {
        UITableViewCell *cell = [[UITableViewCell alloc] init];
        UILabel *myTextLabel;
        NSString *textStr = @"发球方嘎达路附近嘎达非公开的韩国发快递就回复该骄傲的回复刚卡机发球方嘎达路附近嘎达非公开的韩国发快递就回复该骄傲的回复刚卡机发健康法哈德尽快发哈";
        kCreateLabel(myTextLabel, CGRectMake(12, 12, kMainScreenWidth-24, secondCellHeight-24), 14, [UIColor blackColor], textStr);
        myTextLabel.numberOfLines = 0;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell addSubview:myTextLabel];
        return cell;
    }
    if (indexPath.row==2)
    {
        UITableViewCell *cell = [[UITableViewCell alloc] init];
        if (isHaveData==NO)
        {
            UIButton *btn;
            kCreateButton(btn, CGRectMake(12, 25, 80, 16), @"查看更多评论", nil, nil, 12, [UIColor lightGrayColor]);
            [cell addSubview:btn];
            [btn addTarget:self action:@selector(change:) forControlEvents:UIControlEventTouchDown];
        }
        cell.backgroundColor = RGBCOLOR(241, 241, 241);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    static NSString *cellid = @"commentCell";
    CommentTVCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell)
    {
        cell = [[CommentTVCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 49.5, kMainScreenWidth, 0.5)];
        lineView.backgroundColor = [UIColor lightGrayColor];
        [cell addSubview:lineView];
    }
    SingleUserFeedsTCommentAndUserVOList *list = [commentArray objectAtIndex:indexPath.row-3];
    [cell setCellWithData:list];
    return cell;
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
