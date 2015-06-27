//
//  LoginManage.h
//  YHB_Prj
//
//  Created by Johnny's on 15/6/25.
//  Copyright (c) 2015年 striveliu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginManage : NSObject
- (void)loginInWithMobile:(NSString *)aMobile andPwd:(NSString *)aPassword andSucc:(void (^)(void))aSuccBlock andFail:(void (^)(NSString *aStr))aFailBlock;
@end
