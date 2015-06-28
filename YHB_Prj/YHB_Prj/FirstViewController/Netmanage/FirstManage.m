//
//  FirstManage.m
//  YHB_Prj
//
//  Created by Johnny's on 15/6/28.
//  Copyright (c) 2015年 striveliu. All rights reserved.
//

#import "FirstManage.h"
#import "FirstDataModels.h"
#import "NetManager.h"

int pageNo;
int pageSize;
@implementation FirstManage

- (void)getFirstArray:(void (^)(NSArray *))aSuccBlock andFail:(void (^)(NSString *))aFailBlock
{
    NSString *firstUrl = nil;
    pageNo = 1;
    pageSize = 20;
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%d", pageNo],@"pageNo",[NSString stringWithFormat:@"%d", pageSize],@"pageSize",nil];
    kHubRequestUrl(@"userFeeds/getHome.htm", firstUrl);
    [NetManager requestWith:dict url:firstUrl method:@"POST" operationKey:nil parameEncoding:AFJSONParameterEncoding succ:^(NSDictionary *successDict) {
        MLOG(@"%@", successDict);
        FirstModel *model = [FirstModel modelObjectWithDictionary:successDict];
        NSArray *array = model.data.tUserFeedsVOList;
        aSuccBlock(array);
    } failure:^(NSDictionary *failDict, NSError *error) {
        aFailBlock([failDict objectForKey:@"error"]);
    }];
}

@end
