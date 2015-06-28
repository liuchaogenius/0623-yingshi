//
//  FirstView.h
//  YHB_Prj
//
//  Created by Johnny's on 15/6/27.
//  Copyright (c) 2015年 striveliu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstDataModels.h"

@interface FirstView : UIView
{
    UIImageView *mainImgView;
    UILabel *titleLabel;
    UILabel *detailLabel;
    UIImageView *userImgView;
    UIButton *likeBtn;
    UIButton *commentBtn;
    UILabel *likeLabel;
    UILabel *commentLabel;
    UILabel *userNameLabel;
    UILabel *userDetailLabel;
    UIButton *chatBtn;
    
}
- (instancetype)initWithFrame:(CGRect)frame;
- (void)setViewData:(FirstTUserFeedsVOList *)aModel;
@end
