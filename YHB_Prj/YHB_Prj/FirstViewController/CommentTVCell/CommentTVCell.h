//
//  CommentTVCell.h
//  YHB_Prj
//
//  Created by Johnny's on 15/7/6.
//  Copyright (c) 2015年 striveliu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SingleUserFeedsDataModels.h"

@interface CommentTVCell : UITableViewCell

- (void)setCellWithData:(SingleUserFeedsTCommentAndUserVOList *)aList;
@end
