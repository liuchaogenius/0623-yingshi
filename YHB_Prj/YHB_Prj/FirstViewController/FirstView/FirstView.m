//
//  FirstView.m
//  YHB_Prj
//
//  Created by Johnny's on 15/6/27.
//  Copyright (c) 2015年 striveliu. All rights reserved.
//

#import "FirstView.h"
#define kGrayColor RGBCOLOR(22, 169, 199)

@implementation FirstView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        
    }
    return self;
}

- (void)setViewData:(FirstTUserFeedsVOList *)aModel
{
    [self createView];
    FirstTPostUserFeedsUserVO *userFeedsUserVO = aModel.tPostUserFeedsUserVO;
    FirstTUser *user = userFeedsUserVO.tUser;
    FirstTUserInfo *userInfo = userFeedsUserVO.tUserInfo;
    FirstTUserFeeds *userFeeds = aModel.tUserFeeds;
    userNameLabel.text = userInfo.nickName;
    titleLabel.text = userInfo.title;
    detailLabel.text = userInfo.tUserInfoDescription;
    likeLabel.text = [NSString stringWithFormat:@"%d", (int)userFeeds.praise];
    commentLabel.text = [NSString stringWithFormat:@"%d", (int)userFeeds.commentCount];
}

-(void)createView
{
    kCreateImgView(mainImgView, CGRectMake(0, 0, self.width, self.width), IMAGE(@"model"));
    mainImgView.contentMode = UIViewContentModeScaleToFill;
    [self addSubview:mainImgView];
    
    UIView *maskingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.width)];
    maskingView.backgroundColor = [UIColor blackColor];
    maskingView.opaque = YES;
    maskingView.alpha = 0.3;
    [self addSubview:maskingView];
    
    kCreateImgView(userImgView, CGRectMake(self.width/2-22, mainImgView.bottom-15, 44, 44), nil);
    userImgView.backgroundColor = [UIColor whiteColor];
    userImgView.layer.borderWidth = 2.0;
    userImgView.layer.borderColor = [[UIColor whiteColor] CGColor];
    userImgView.layer.cornerRadius = 22;
    [userImgView clipsToBounds];
    [self addSubview:userImgView];
    
    kCreateLabel(userNameLabel, CGRectMake(self.width/2-50, userImgView.bottom+4, 100, 20), 16, [UIColor blackColor], nil);
    userNameLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:userNameLabel];
    
    kCreateLabel(userDetailLabel, CGRectMake(self.width/2-50, userNameLabel.bottom, 100, 16), 12, [UIColor grayColor], nil);
    userDetailLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:userDetailLabel];
    
    kCreateButton(chatBtn, CGRectMake(self.width/2-55, userDetailLabel.bottom+8, 110, 24), @"给TA讯息", nil, nil, 16, kGrayColor);
    chatBtn.layer.cornerRadius = 10;
    chatBtn.layer.borderColor = [kGrayColor CGColor];
    chatBtn.layer.borderWidth = 1;
    [self addSubview:chatBtn];
    
    kCreateButton(likeBtn, CGRectMake(self.width/5-8, mainImgView.bottom+20, 16, 16), nil, IMAGE(@"likeN"), nil, 0, nil);
    [self addSubview:likeBtn];
    
    kCreateButton(commentBtn, CGRectMake(self.width*4/5-8, likeBtn.top, 16, 16), nil, IMAGE(@"commentN"), nil, 0, nil);
    [self addSubview:commentBtn];
    
    kCreateLabel(likeLabel, CGRectMake(likeBtn.left-10, likeBtn.bottom+4, likeBtn.width+20, likeBtn.height), 16, [UIColor grayColor], nil);
    likeLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:likeLabel];
    
    kCreateLabel(commentLabel, CGRectMake(commentBtn.left-10, likeLabel.top, likeLabel.width, likeLabel.height), 16, [UIColor grayColor], nil);
    commentLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:commentLabel];
    
    kCreateLabel(detailLabel, CGRectMake(self.width/2-70, userImgView.top-50, 140, 35), 14, [UIColor whiteColor], nil);
    detailLabel.numberOfLines = 2;
    detailLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:detailLabel];
    
    UIImageView *tubiaoView;
    kCreateImgView(tubiaoView, CGRectMake(self.width/2-95, detailLabel.top-18, 190, 14), IMAGE(@"tubiao"));
    [self addSubview:tubiaoView];
    
    kCreateLabel(titleLabel, CGRectMake(self.width/2-100, tubiaoView.top-30, 200, 25), 18, [UIColor whiteColor], nil);
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:titleLabel];
}


@end
