//
//  RegisterManage.h
//  YHB_Prj
//
//  Created by Johnny's on 15/6/25.
//  Copyright (c) 2015年 striveliu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegisterManage : NSObject
- (void)getVaildWithPhone:(NSString *)aPhoneNumber andSucc:(void (^)(void))aSuccBlock andFail:(void (^)(NSString *aStr))aFailBlock;
@end
