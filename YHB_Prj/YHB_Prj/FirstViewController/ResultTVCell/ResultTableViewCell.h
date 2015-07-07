//
//  ResultTableViewCell.h
//  YHB_Prj
//
//  Created by Johnny's on 15/6/30.
//  Copyright (c) 2015年 striveliu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ResultDataModels.h"

@interface ResultTableViewCell : UITableViewCell

- (void)setCellWithData:(ResultTUserInfo *)aUserInfo;
@end
