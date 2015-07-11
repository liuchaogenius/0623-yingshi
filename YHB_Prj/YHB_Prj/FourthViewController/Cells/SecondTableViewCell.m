//
//  SecondTableViewCell.m
//  YHB_Prj
//
//  Created by Johnny's on 15/6/28.
//  Copyright (c) 2015年 striveliu. All rights reserved.
//

#import "SecondTableViewCell.h"
#import "DetailVCListHasPicFeeds.h"

@interface SecondTableViewCell()
{
    UILabel *textLabel;
    NSArray *myFeedArray;
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
    }
    return self;
}

- (void)setCellArray:(NSArray *)feedList
{
    myFeedArray = feedList;
    DetailVCListHasPicFeeds *model = [myFeedArray objectAtIndex:0];
    if (model)
    {
        NSString *picStr = model.attributes;
//        MLOG(picStr);
        NSString *subStr = [model.attributes substringWithRange:NSMakeRange(9, picStr.length-8-3)];
//        MLOG(subStr);
        NSArray *picUrlArray = [subStr componentsSeparatedByString:@","];
        for (int i=0; i<picUrlArray.count; i++)
        {
            UIImageView *imgView = [[UIImageView alloc]
                                    initWithFrame:CGRectMake(textLabel.right+25+(70-8)*i, 8, 70-16, 70-16)];
//            imgView.backgroundColor = [UIColor yellowColor];
            NSString *picUrl;
            kYyAImgUrl([picUrlArray objectAtIndex:i], picUrl);
//            MLOG(picUrl);
            [imgView sd_setImageWithURL:[NSURL URLWithString:picUrl]];
            [self addSubview:imgView];
        }

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
