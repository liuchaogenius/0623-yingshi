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

- (void)setCellWithData:(DetailVCTUserProfileList *)aProfile
{
    nameLabel.text = aProfile.company?aProfile.company:@"";
    jobLabel.text = aProfile.position?aProfile.position:@"";
    detailLabel.text = aProfile.introduce?aProfile.introduce:@"";
    NSString *startTime = [self changeTime:[NSString stringWithFormat:@"%ld", (long)aProfile.jobStartTime]];
    NSString *endTime = [self changeTime:[NSString stringWithFormat:@"%ld", (long)aProfile.jobEndTime]];
    if (startTime && endTime)
    {
        timeLabel.text = [NSString stringWithFormat:@"%@-%@", startTime, endTime];
    }
}

- (void)createView
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    kCreateLabel(nameLabel, CGRectMake(12, 12, 150, 20), 16, [UIColor blackColor], @"");
    [self addSubview:nameLabel];
    
    kCreateLabel(jobLabel, CGRectMake(nameLabel.left, nameLabel.bottom+10, nameLabel.width, 18), 14, RGBCOLOR(102, 102, 102), @"");
    [self addSubview:jobLabel];
    
    kCreateLabel(detailLabel, CGRectMake(nameLabel.left, jobLabel.bottom+4, kMainScreenWidth-24, 16), 12, RGBCOLOR(153, 153, 153), @"");
    [self addSubview:detailLabel];
    
    kCreateLabel(timeLabel, CGRectMake(kMainScreenWidth-12-150, 12, 150, 14), 10, RGBCOLOR(153, 153, 153), @"");
    [self addSubview:timeLabel];
}

- (NSString *)changeTime:(NSString *)oldTime
{
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]];
    [inputFormatter setDateFormat:@"yyyyMMdd"];
    NSDate* inputDate = [inputFormatter dateFromString:oldTime];

    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setLocale:[NSLocale currentLocale]];
    [outputFormatter setDateFormat:@"MM/dd/yyyy"];
    NSString *str = [outputFormatter stringFromDate:inputDate];
    
    return str;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
