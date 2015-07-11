//
//  YYUser.h
//  YHB_Prj
//
//  Created by Johnny's on 15/7/10.
//  Copyright (c) 2015年 striveliu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYTUserInfo.h"
#import "YYTUser.h"

@interface YYUser : NSObject

@property(nonatomic, readonly) BOOL isLogin;
@property(nonatomic, strong) YYTUser *user;
@property(nonatomic, strong) YYTUserInfo *userInfo;
//@property(nonatomic, strong) NSString *token;
@property(nonatomic, strong) UIImage *localHeadUrl;
//@property(nonatomic, strong) UIImage *localBgUrl;

+ (YYUser *)sharedYYUser;
//退出登录
- (void)logoutUser;
//保存数据
- (void)saveUserInfoWithYYTUser:(YYTUser *)aYYTUser andYYTUserInfo:(YYTUserInfo *)aYYTUserInfo;
@end
