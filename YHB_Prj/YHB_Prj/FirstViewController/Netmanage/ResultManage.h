//
//  ResultManage.h
//  YHB_Prj
//
//  Created by Johnny's on 15/7/6.
//  Copyright (c) 2015年 striveliu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResultManage : NSObject

- (void)getResultArrayWithDict:(NSDictionary *)aDict success:(void(^)(NSMutableArray *aArray))aSuccBlock andFail:(void(^)(NSString *aStr))aFailBlock;

@end
