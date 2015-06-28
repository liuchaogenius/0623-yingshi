//
//  YHBPhotoImageView.m
//  YHB_Prj
//
//  Created by Johnny's on 14/12/1.
//  Copyright (c) 2014年 striveliu. All rights reserved.
//

#import "YHBPhotoImageView.h"

@implementation YHBPhotoImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.maskingView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width-15-3, 3, 15, 15)];
        self.maskingView.image = [UIImage imageNamed:@"chooseN"];
        [self addSubview:self.maskingView];
    }
    return self;
}

- (void)changeSelected
{
    if (self.isSelected)
    {
        [self hiddenMaskingView];
    }
    else
    {
        [self showMaskingView];
    }
    self.isSelected = !self.isSelected;
}

- (void)showMaskingView
{
    self.maskingView.image = [UIImage imageNamed:@"chooseY"];
}

- (void)hiddenMaskingView
{
    self.maskingView.image = [UIImage imageNamed:@"chooseN"];
}

//- (UIImageView *)maskingView
//{
//    if (!_maskingView)
//    {
//        _maskingView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
//        _maskingView.backgroundColor = [UIColor grayColor];
//        _maskingView.alpha=0.7;
//        _maskingView.tag = 1000;
//    }
//    return _maskingView;
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
