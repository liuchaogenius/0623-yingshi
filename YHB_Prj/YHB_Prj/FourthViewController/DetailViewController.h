//
//  DetailViewController.h
//  YHB_Prj
//
//  Created by Johnny's on 15/6/30.
//  Copyright (c) 2015年 striveliu. All rights reserved.
//

#import "BaseViewController.h"
#import "DetailVCData.h"

@interface DetailViewController : BaseViewController

- (instancetype)initWithUserId:(NSString *)aUserId;
- (instancetype)initWithData:(DetailVCData *)aData;
@end
