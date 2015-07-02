//
//  IndustryManage.h
//  YHB_Prj
//
//  Created by Johnny's on 15/6/29.
//  Copyright (c) 2015年 striveliu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IndustryManage : NSObject

- (void)getIndustryArray:(void(^)(NSArray *aArray))aSuccBlock andFail:(void(^)(NSString *aStr))aFailBlock;
@end
