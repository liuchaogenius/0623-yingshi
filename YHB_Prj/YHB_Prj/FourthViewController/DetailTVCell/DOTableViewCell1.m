//
//  DOTableViewCell1.m
//  YHB_Prj
//
//  Created by Johnny's on 15/6/30.
//  Copyright (c) 2015年 striveliu. All rights reserved.
//

#import "DOTableViewCell1.h"

@interface DOTableViewCell1()
{
    UIImageView *myImgView;
}
@end

@implementation DOTableViewCell1

- (instancetype)init
{
    if (self = [super init])
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self createView];
    }
    
    return self;
}

- (void)createView
{
    myImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, kMainScreenWidth)];
//    [myImgView setImage:IMAGE(@"model")];
    myImgView.contentMode = UIViewContentModeScaleToFill;
    [self addSubview:myImgView];
}

- (void)setCellWithData:(DetailVCTUserInfo *)aUserInfo
{
    NSString *bgUrl;
    kYyAImgUrl(aUserInfo.background, bgUrl);
    [myImgView sd_setImageWithURL:[NSURL URLWithString:bgUrl]];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
