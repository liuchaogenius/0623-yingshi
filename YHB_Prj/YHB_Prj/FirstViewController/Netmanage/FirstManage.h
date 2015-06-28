//
//  FirstManage.h
//  YHB_Prj
//
//  Created by Johnny's on 15/6/28.
//  Copyright (c) 2015年 striveliu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FirstManage : NSObject

- (void)getFirstArray:(void(^)(NSArray *aArray))aSuccBlock andFail:(void(^)(NSString *aStr))aFailBlock;
@end
