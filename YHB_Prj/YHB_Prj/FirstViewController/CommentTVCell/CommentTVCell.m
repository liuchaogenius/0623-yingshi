//
//  CommentTVCell.m
//  YHB_Prj
//
//  Created by Johnny's on 15/7/6.
//  Copyright (c) 2015年 striveliu. All rights reserved.
//

#import "CommentTVCell.h"
#define kCommentCellHeight 50
@interface CommentTVCell()
{
    UIImageView *userImgView;
    UILabel *userNameLabel;
    UILabel *commentLabel;
}
@end

@implementation CommentTVCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self createView];
    }
    return self;
}

- (void)createView
{
    kCreateImgView(userImgView, CGRectMake(kCommentCellHeight/2.0-16, kCommentCellHeight/2.0-16, 32, 32), nil);
    userImgView.layer.cornerRadius = 16;
    userImgView.clipsToBounds = YES;
    userImgView.backgroundColor = [UIColor yellowColor];
    [self addSubview:userImgView];
    
    kCreateLabel(userNameLabel, CGRectMake(userImgView.right+15, kCommentCellHeight/2-8, 40, 16), 12, [UIColor blackColor], @"用户名:");
    [self addSubview:userNameLabel];
    
    kCreateLabel(commentLabel, CGRectMake(userNameLabel.right+10, userNameLabel.top, 200, 16), 12, [UIColor lightGrayColor], @"评论评论评论");
    [self addSubview:commentLabel];
}

- (void)setCellWithData:(SingleUserFeedsTCommentAndUserVOList *)aList
{
    userImgView.image = IMAGE(@"");
    userNameLabel.text = @"";
    commentLabel.text = @"";
    
    SingleUserFeedsTCommentPostUserVO *vo = aList.tCommentPostUserVO;
    SingleUserFeedsTUser *user = vo.tUser;
    NSString *userName = [NSString stringWithFormat:@"%@:", user.userName];
    CGSize singleLineStringSize = [userName sizeWithFont:kFont12];
    userNameLabel.width = singleLineStringSize.width;
    userNameLabel.text = userName;
    commentLabel.left = userNameLabel.right+10;
    commentLabel.width = kMainScreenWidth-userNameLabel.right-10;
    
    SingleUserFeedsTComment *comment = aList.tComment;
    commentLabel.text = comment.content;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
