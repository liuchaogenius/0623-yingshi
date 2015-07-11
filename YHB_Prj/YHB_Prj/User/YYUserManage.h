//
//  YYUserManage.h
//  YHB_Prj
//
//  Created by Johnny's on 15/7/10.
//  Copyright (c) 2015年 striveliu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YYUserManage : NSObject
+ (YYUserManage *)sharedYYUserManage;

//登录
- (void)loginInWithMobile:(NSString *)aMobile andPwd:(NSString *)aPassword andSucc:(void (^)(int aCode))aSuccBlock andFail:(void (^)(NSString *aStr))aFailBlock;
//注册
- (void)getVaildWithPhone:(NSString *)aPhoneNumber andSucc:(void (^)(void))aSuccBlock andFail:(void (^)(NSString *aStr))aFailBlock;


@end
