//
//  LoginManage.m
//  YHB_Prj
//
//  Created by Johnny's on 15/6/25.
//  Copyright (c) 2015年 striveliu. All rights reserved.
//

#import "LoginManage.h"
#import "NetManager.h"

@implementation LoginManage

- (void)loginInWithMobile:(NSString *)aMobile andPwd:(NSString *)aPassword andSucc:(void (^)(void))aSuccBlock andFail:(void (^)(NSString *aStr))aFailBlock
{
    NSString *vaildUrl = nil;
    kHubRequestUrl(@"user/loginUser.htm", vaildUrl);
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:aMobile,@"mobile",aPassword,@"passWord",nil];
    [NetManager requestWith:dict url:vaildUrl method:@"POST" operationKey:nil parameEncoding:AFJSONParameterEncoding succ:^(NSDictionary *successDict) {
        MLOG(@"%@", successDict);
        
    } failure:^(NSDictionary *failDict, NSError *error) {
        aFailBlock([failDict objectForKey:@"error"]);
    }];
}

@end
