//
//  DetailVCManage.m
//  YHB_Prj
//
//  Created by Johnny's on 15/7/11.
//  Copyright (c) 2015年 striveliu. All rights reserved.
//

#import "DetailVCManage.h"
#import "NetManager.h"

@implementation DetailVCManage

- (void)getUserDetailWithUserId:(NSString *)aUserId andSucc:(void (^)(DetailVCData *data))aSuccBlock andFail:(void (^)(NSString *aStr))aFailBlock
{
    NSString *vaildUrl = nil;
    kHubRequestUrl(@"user/getMyPage.htm", vaildUrl);
#warning userid
    //    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:aUserId,@"userId",nil];
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"10002",@"userId",nil];
    [NetManager requestWith:dict url:vaildUrl method:@"GET" operationKey:nil parameEncoding:AFJSONParameterEncoding succ:^(NSDictionary *successDict) {
//        MLOG(@"%@", successDict);
        DetailVCModel *model = [DetailVCModel modelObjectWithDictionary:successDict];
        aSuccBlock(model.data);
    } failure:^(NSDictionary *failDict, NSError *error) {
        aFailBlock([failDict objectForKey:@"error"]);
    }];
}

@end
