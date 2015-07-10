//
//  DOTableViewCell3.m
//  YHB_Prj
//
//  Created by Johnny's on 15/6/30.
//  Copyright (c) 2015年 striveliu. All rights reserved.
//

#import "DOTableViewCell3.h"
@interface DOTableViewCell3 ()
{
    UILabel *textLabel1;
    UILabel *textLabel2;
    UILabel *textLabel3;
    UILabel *phoneLabel;
    UILabel *mailLabel;
    UILabel *jobLabel;
}
@end

@implementation DOTableViewCell3

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
    kCreateLabel(textLabel1, CGRectMake(15, 8, 40, 16), 12, [UIColor lightGrayColor], @"手机号");
    [self addSubview:textLabel1];
    kCreateLabel(textLabel2, CGRectMake(15, textLabel1.bottom+7, textLabel1.width, 16), 12, [UIColor lightGrayColor], @"邮箱");
    [self addSubview:textLabel2];
    kCreateLabel(textLabel3, CGRectMake(15, textLabel2.bottom+7, textLabel2.width, 16), 12, [UIColor lightGrayColor], @"职位");
    [self addSubview:textLabel3];
    kCreateLabel(phoneLabel, CGRectMake(textLabel1.right+15, textLabel1.top, 200, 16), 12, [UIColor blackColor], @"124 1223 1232");
    [self addSubview:phoneLabel];
    kCreateLabel(mailLabel, CGRectMake(phoneLabel.left, textLabel2.top, 200, 16), 12, [UIColor blackColor], @"12313213@qq.com");
    [self addSubview:mailLabel];
    kCreateLabel(jobLabel, CGRectMake(mailLabel.left, textLabel3.top, 200, 16), 12, [UIColor blackColor], @"影视广告编导");
    [self addSubview:jobLabel];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
