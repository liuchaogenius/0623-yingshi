//
//  YYUser.m
//  YHB_Prj
//
//  Created by Johnny's on 15/7/10.
//  Copyright (c) 2015年 striveliu. All rights reserved.
//

#import "YYUser.h"
#import "YYUserManage.h"
#import "YYDataService.h"
#import "SynthesizeSingleton.h"

@interface YYUser()
@property(nonatomic, strong) YYUserManage *userManage;
@end

@implementation YYUser
SYNTHESIZE_SINGLETON_FOR_CLASS(YYUser);

- (instancetype)init
{
    _isLogin = NO;
    [self getLocalUserInfo];
    return self;
}

//加载本地数据
- (void)getLocalUserInfo
{
    YYTUser *TUser = [[YYDataService sharedYYDataSevice] getTUser];
    YYTUserInfo *TUserInfo = [[YYDataService sharedYYDataSevice] getTUserInfo];
    if (TUser && TUserInfo)
    {
        self.user = TUser;
        self.userInfo = TUserInfo;
        _isLogin = YES;
    }
}

- (void)saveUserInfoWithYYTUser:(YYTUser *)aYYTUser andYYTUserInfo:(YYTUserInfo *)aYYTUserInfo
{
    _isLogin = YES;
    [[YYDataService sharedYYDataSevice] saveTUser:aYYTUser];
    [[YYDataService sharedYYDataSevice] saveTUserInfo:aYYTUserInfo];
}

- (void)logoutUser
{
    _isLogin = NO;
    [[YYDataService sharedYYDataSevice] clearUserInfo];
}

-(UIImage *)getImageFromURL:(NSString *)fileURL
{
    
    UIImage * result;
    
    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileURL]];
    
    result = [UIImage imageWithData:data];
    
    return result;
    
}

@end
