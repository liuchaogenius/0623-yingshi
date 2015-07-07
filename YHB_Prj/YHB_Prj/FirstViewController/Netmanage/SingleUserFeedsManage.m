//
//  SingleUserFeedsManage.m
//  YHB_Prj
//
//  Created by Johnny's on 15/7/7.
//  Copyright (c) 2015年 striveliu. All rights reserved.
//

#import "SingleUserFeedsManage.h"
#import "NetManager.h"
#import "SingleUserFeedsDataModels.h"

@interface SingleUserFeedsManage()
{
    int pageSize;
    int pageNo;
}
@end

@implementation SingleUserFeedsManage

- (void)getSingleUserFeedsArrayWithID:(NSString *)aId success:(void(^)(NSArray *aArray))aSuccBlock andFail:(void(^)(NSString *aStr))aFailBlock
{
    pageSize = 20;
    pageNo = 1;
    NSString *supplyUrl = nil;
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:aId,@"id",[NSString stringWithFormat:@"%d", pageNo],@"pageNo",[NSString stringWithFormat:@"%d", pageSize],@"pageSize", nil];
    kHubRequestUrl(@"userFeeds/getUserFeedsById.htm", supplyUrl);
    [NetManager requestWith:dict url:supplyUrl method:@"GET" operationKey:nil parameEncoding:AFJSONParameterEncoding succ:^(NSDictionary *successDict) {
//        MLOG(@"%@", successDict);
        SingleUserFeedsModel *model = [SingleUserFeedsModel modelObjectWithDictionary:successDict];
        SingleUserFeedsTUserFeedsVO *vo = model.data.tUserFeedsVO;
        NSArray *commentArray = vo.tCommentAndUserVOList;
        aSuccBlock(commentArray);
        //            aSuccBlock(resultArray);
    } failure:^(NSDictionary *failDict, NSError *error) {
        aFailBlock([failDict objectForKey:@"error"]);
    }];
}


@end
