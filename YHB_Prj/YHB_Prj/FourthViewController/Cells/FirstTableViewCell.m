//
//  FirstTableViewCell.m
//  YHB_Prj
//
//  Created by Johnny's on 15/6/28.
//  Copyright (c) 2015年 striveliu. All rights reserved.
//

#import "FirstTableViewCell.h"
#import "YYUser.h"

@interface FirstTableViewCell()
{
    UIImageView *topImgView;
    UILabel *nameLabel;
    UILabel *detailLabel;
}
@end

@implementation FirstTableViewCell

- (instancetype)init
{
    if(self = [super init])
    {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        kCreateImgView(topImgView, CGRectMake(15, 15, 40, 40), nil);
        topImgView.backgroundColor = [UIColor yellowColor];
        topImgView.layer.cornerRadius = 20;
        [topImgView clipsToBounds];
        [self addSubview:topImgView];
        
        kCreateLabel(nameLabel, CGRectMake(topImgView.right+15, topImgView.top+2, 100, 20), 16, [UIColor blackColor], @"用户名");
        [self addSubview:nameLabel];
        
        kCreateLabel(detailLabel, CGRectMake(nameLabel.left, nameLabel.bottom, kMainScreenWidth-nameLabel.left-15, 20), 12, [UIColor lightGrayColor], @"一句话定义你自己！");
        [self addSubview:detailLabel];
        
        YYUser *user = [YYUser sharedYYUser];
        if (user.isLogin)
        {
            topImgView.image = user.localHeadUrl;
            nameLabel.text = user.userInfo.nickName;
            detailLabel.text = user.userInfo.introduce;
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
