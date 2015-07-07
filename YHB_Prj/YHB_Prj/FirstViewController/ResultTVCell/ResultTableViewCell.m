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
    
    kCreateButton(nameBtn, CGRectMake(headBtn.right+5, topImgView.bottom, 40, 40), @"王慧儿", nil, nil, 12, [UIColor whiteColor]);
//    CGSize singleLineStringSize = [@"999" sizeWithFont:kFont12];
    [bgView addSubview:nameBtn];
    
    kCreateLabel(detailLabel, CGRectMake(nameBtn.right+5, topImgView.bottom, 70, 40), 10, [UIColor lightGrayColor], @"浙江音乐学院");
    [bgView addSubview:detailLabel];
    
    kCreateLabel(likeLabel, CGRectMake(bgView.width-25, topImgView.bottom+12, 25, 16), 12, [UIColor lightGrayColor], @"999");
    likeLabel.textAlignment = NSTextAlignmentCenter;
    [bgView addSubview:likeLabel];
    
    kCreateButton(likeBtn, CGRectMake(likeLabel.left-18, likeLabel.top, 16, 16), nil, IMAGE(@"likeN"), nil, 0, nil);
    [bgView addSubview:likeBtn];
    
    kCreateLabel(commentLabel, CGRectMake(likeBtn.left-25, likeBtn.top, 25, 16), 12, [UIColor lightGrayColor], @"999");
    commentLabel.textAlignment = NSTextAlignmentCenter;
    [bgView addSubview:commentLabel];
    
    kCreateButton(commentBtn, CGRectMake(commentLabel.left-18, commentLabel.top, 16, 16), nil, IMAGE(@"commentN"), nil, 0, nil);
    [bgView addSubview:commentBtn];
}

- (void)setCellWithData:(ResultTUserInfo *)aUserInfo
{
    topImgView.image = [UIImage imageNamed:@""];
    [headBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [nameBtn setTitle:@"" forState:UIControlStateNormal];
    detailLabel.text = @"";
    likeLabel.text = @"";
    commentLabel.text = @"";
    
    CGSize singleLineStringSize = [aUserInfo.nickName sizeWithFont:kFont12];
    nameBtn.width = singleLineStringSize.width;
    [nameBtn setTitle:aUserInfo.nickName forState:UIControlStateNormal];
    detailLabel.left = nameBtn.width+nameBtn.left+5;
    
    NSString *industryStr = [NSString stringWithFormat:@"%d", (int)aUserInfo.industry];
    CGSize singleLineStringSize2 = [industryStr sizeWithFont:kFont12];
    detailLabel.width = singleLineStringSize2.width;
    detailLabel.text = industryStr;
    
    likeLabel.text = [NSString stringWithFormat:@"%d", (int)aUserInfo.praise];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
