//
//  SecondTableViewCell.m
//  YHB_Prj
//
//  Created by Johnny's on 15/6/28.
//  Copyright (c) 2015年 striveliu. All rights reserved.
//

#import "SecondTableViewCell.h"

@interface SecondTableViewCell()
{
    UILabel *textLabel;
}
@end
@implementation SecondTableViewCell

- (instancetype)init
{
    if(self = [super init])
    {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    
        kCreateLabel(textLabel, CGRectMake(25, 25, 30, 20), 14, [UIColor lightGrayColor], @"动态");
        textLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:textLabel];
        
        for (int i=0; i<3; i++)
        {
            UIImageView *imgView = [[UIImageView alloc]
                                    initWithFrame:CGRectMake(textLabel.right+25+(70-8)*i, 8, 70-16, 70-16)];
            imgView.backgroundColor = [UIColor yellowColor];
            [self addSubview:imgView];
        }
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
