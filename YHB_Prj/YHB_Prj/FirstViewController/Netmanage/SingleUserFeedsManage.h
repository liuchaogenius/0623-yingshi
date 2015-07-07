//
//  SingleUserFeedsManage.h
//  YHB_Prj
//
//  Created by Johnny's on 15/7/7.
//  Copyright (c) 2015年 striveliu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingleUserFeedsManage : NSObject

- (void)getSingleUserFeedsArrayWithID:(NSString *)aId success:(void(^)(NSArray *aArray))aSuccBlock andFail:(void(^)(NSString *aStr))aFailBlock;

@end
