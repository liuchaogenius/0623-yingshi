//
//  BGTableViewCell.m
//  YHB_Prj
//
//  Created by Johnny's on 15/7/4.
//  Copyright (c) 2015年 striveliu. All rights reserved.
//

#import "BGTableViewCell.h"

@interface BGTableViewCell()
{
    UILabel *nameLabel;
    UILabel *jobLabel;
    UILabel *detailLabel;
    UILabel *timeLabel;
}

@end

@implementation BGTableViewCell

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
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    kCreateLabel(nameLabel, CGRectMake(12, 12, 150, 20), 16, [UIColor blackColor], @"名字");
    [self addSubview:nameLabel];
    
    kCreateLabel(jobLabel, CGRectMake(nameLabel.left, nameLabel.bottom+10, nameLabel.width, 18), 14, RGBCOLOR(102, 102, 102), @"职位");
    [self addSubview:jobLabel];
    
    kCreateLabel(detailLabel, CGRectMake(nameLabel.left, jobLabel.bottom+4, kMainScreenWidth-24, 16), 12, RGBCOLOR(153, 153, 153), @"服务于法拉利，保时捷等汽车品牌");
    [self addSubview:detailLabel];
    
    kCreateLabel(timeLabel, CGRectMake(kMainScreenWidth-12-150, 12, 150, 14), 10, RGBCOLOR(153, 153, 153), @"02/06/2014-01/03/2015");
    [self addSubview:timeLabel];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
