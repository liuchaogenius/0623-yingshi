//
//  DOTableViewCell4.m
//  YHB_Prj
//
//  Created by Johnny's on 15/6/30.
//  Copyright (c) 2015年 striveliu. All rights reserved.
//

#import "DOTableViewCell4.h"

@interface DOTableViewCell4()
{
    UILabel *textLabel;
    UILabel *textLabel2;
}
@end

@implementation DOTableViewCell4

- (instancetype)init
{
    if (self = [super init])
    {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self createView];
    }
    
    return self;
}

- (void)createView
{
    kCreateLabel(textLabel, CGRectMake(12, 18, 50, 16), 12, [UIColor lightGrayColor], @"Ta的动态");
    textLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:textLabel];
    
    kCreateLabel(textLabel2, CGRectMake(textLabel.left, textLabel.bottom, 50, 14), 10, [UIColor blackColor], @"(共24条)");
    textLabel2.textAlignment = NSTextAlignmentCenter;
    [self addSubview:textLabel2];
    
    for (int i=0; i<3; i++)
    {
        UIImageView *imgView = [[UIImageView alloc]
                                initWithFrame:CGRectMake(textLabel.right+10+(70-8)*i, 8, 70-16, 70-16)];
        imgView.backgroundColor = [UIColor yellowColor];
        [self addSubview:imgView];
    }
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
