//
//  DOTableViewCell2.m
//  YHB_Prj
//
//  Created by Johnny's on 15/6/30.
//  Copyright (c) 2015年 striveliu. All rights reserved.
//

#import "DOTableViewCell2.h"

@interface DOTableViewCell2()
{
    UIImageView *topImgView;
    UILabel *nameLabel;
    UILabel *detailLabel;
}
@end

@implementation DOTableViewCell2

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
    kCreateImgView(topImgView, CGRectMake(15, 15, 40, 40), nil);
    topImgView.backgroundColor = [UIColor yellowColor];
    topImgView.layer.cornerRadius = 20;
    [topImgView clipsToBounds];
    [self addSubview:topImgView];
    
    kCreateLabel(nameLabel, CGRectMake(topImgView.right+15, topImgView.top+2, 100, 20), 16, [UIColor blackColor], @"王慧");
    [self addSubview:nameLabel];
    
    kCreateLabel(detailLabel, CGRectMake(nameLabel.left, nameLabel.bottom, nameLabel.width, 20), 12, [UIColor lightGrayColor], @"影视广告编导");
    [self addSubview:detailLabel];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
