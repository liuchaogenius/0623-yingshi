//
//  DetailVCManage.h
//  YHB_Prj
//
//  Created by Johnny's on 15/7/11.
//  Copyright (c) 2015年 striveliu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DetailVCModels.h"

@interface DetailVCManage : NSObject

- (void)getUserDetailWithUserId:(NSString *)aUserId andSucc:(void (^)(DetailVCData *data))aSuccBlock andFail:(void (^)(NSString *aStr))aFailBlock;

@end
