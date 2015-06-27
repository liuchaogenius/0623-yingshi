//
//  RegisterManage.m
//  YHB_Prj
//
//  Created by Johnny's on 15/6/25.
//  Copyright (c) 2015年 striveliu. All rights reserved.
//

#import "RegisterManage.h"
#import "NetManager.h"

@implementation RegisterManage

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

@end
