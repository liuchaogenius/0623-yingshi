//
//  ResultTableViewCell.m
//  YHB_Prj
//
//  Created by Johnny's on 15/6/30.
//  Copyright (c) 2015年 striveliu. All rights reserved.
//

#import "ResultTableViewCell.h"

@interface ResultTableViewCell()
{
    UIImageView *topImgView;
    UIButton *headBtn;
    UIButton *nameBtn;
    UILabel *detailLabel;
    UIButton *commentBtn;
    UILabel *commentLabel;
    UIButton *likeBtn;
    UILabel *likeLabel;
}
@end

@implementation ResultTableViewCell

- (instancetype)init
{
    if(self = [super init])
    {
//        [self createView];
    }
    
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self createView];
    }
    return self;
}

- (void)setViewWithData
{
    
}

- (void)createView
{
    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(20, 20, kMainScreenWidth-40, kMainScreenWidth-40+40)];
    bgView.backgroundColor = [UIColor blackColor];
    [self addSubview:bgView];
    
    kCreateImgView(topImgView, CGRectMake(0, 0, bgView.width, bgView.width), nil);
    topImgView.backgroundColor = [UIColor yellowColor];
    [bgView addSubview:topImgView];
    
    UIView *maskingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, topImgView.width, topImgView.height)];
    maskingView.backgroundColor = [UIColor blackColor];
    maskingView.alpha = 0.3;
    [topImgView addSubview:maskingView];

    
    kCreateButton(headBtn, CGRectMake(3, topImgView.bottom+8, 24, 24), nil, nil, nil, 0, nil);
    headBtn.layer.borderColor = [[UIColor whiteColor] CGColor];
    headBtn.layer.borderWidth = 1;
    headBtn.layer.cornerRadius = 12;
    headBtn.clipsToBounds = YES;
    [bgView addSubview:headBtn];
    
    kCreateButton(nameBtn, CGRectMake(headBtn.right+5, topImgView.bottom+16, 40, 18), @"王慧儿", nil, nil, 12, [UIColor whiteColor]);
    CGSize singleLineStringSize = [@"213" sizeWithFont:kFont12];
    [bgView addSubview:nameBtn];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
