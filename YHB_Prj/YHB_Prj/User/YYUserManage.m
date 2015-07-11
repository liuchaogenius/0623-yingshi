//
//  YYUserManage.m
//  YHB_Prj
//
//  Created by Johnny's on 15/7/10.
//  Copyright (c) 2015年 striveliu. All rights reserved.
//

#import "YYUserManage.h"
#import "SynthesizeSingleton.h"
#import "NetManager.h"
#import "YYUser.h"
#import "YYTUser.h"
#import "YYTUserInfo.h"

@implementation YYUserManage
SYNTHESIZE_SINGLETON_FOR_CLASS(YYUserManage);

- (instancetype)init
{
    self = [super init];
    return self;
}

- (void)getVaildWithPhone:(NSString *)aPhoneNumber andSucc:(void (^)(void))aSuccBlock andFail:(void (^)(NSString *aStr))aFailBlock
{
    NSString *vaildUrl = nil;
    kHubRequestUrl(@"valid/send.htm", vaildUrl);
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:aPhoneNumber,@"mobile",nil];
    [NetManager requestWith:dict url:vaildUrl method:@"GET" operationKey:nil parameEncoding:AFJSONParameterEncoding succ:^(NSDictionary *successDict) {
        MLOG(@"%@", successDict);
        
    } failure:^(NSDictionary *failDict, NSError *error) {
        aFailBlock([failDict objectForKey:@"error"]);
    }];
}

- (void)loginInWithMobile:(NSString *)aMobile andPwd:(NSString *)aPassword andSucc:(void (^)(int aCode))aSuccBlock andFail:(void (^)(NSString *aStr))aFailBlock
{
    NSString *vaildUrl = nil;
    kHubRequestUrl(@"user/loginUser.htm", vaildUrl);
    aMobile = @"13555555555";
    aPassword = @"111111";
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:aMobile,@"mobile",aPassword,@"passWord",nil];
    [NetManager requestWith:dict url:vaildUrl method:@"GET" operationKey:nil parameEncoding:AFJSONParameterEncoding succ:^(NSDictionary *successDict) {
//        MLOG(@"%@", successDict);
        NSString *successCode = [successDict objectForKey:@"success"];
        int success = [successCode intValue];
        if (success==1)
        {
            aSuccBlock(1);
            YYUser *user = [YYUser sharedYYUser];
            NSDictionary *data = [successDict objectForKey:@"data"];
            YYTUser *tUser = [YYTUser modelObjectWithDictionary:[data objectForKey:@"tUser"]];
            YYTUserInfo *tUserInfo = [YYTUserInfo modelObjectWithDictionary:[data objectForKey:@"tUserInfo"]];
            [user saveUserInfoWithYYTUser:tUser andYYTUserInfo:tUserInfo];
        }
        else
        {
            aSuccBlock(0);
        }
    } failure:^(NSDictionary *failDict, NSError *error) {
        aFailBlock([failDict objectForKey:@"error"]);
    }];
}

@end
