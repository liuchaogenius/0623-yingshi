//
//  IndustryManage.m
//  YHB_Prj
//
//  Created by Johnny's on 15/6/29.
//  Copyright (c) 2015年 striveliu. All rights reserved.
//

#import "IndustryManage.h"
#import "NetManager.h"
#import "IndustryDataModels.h"

@implementation IndustryManage

- (void)getIndustryArray:(void (^)(NSArray *))aSuccBlock andFail:(void (^)(NSString *))aFailBlock
{
    NSString *firstUrl = nil;
    kHubRequestUrl(@"industry/getAll.htm", firstUrl);
    [NetManager requestWith:nil url:firstUrl method:@"POST" operationKey:nil parameEncoding:AFJSONParameterEncoding succ:^(NSDictionary *successDict) {
//            MLOG(@"%@", successDict);
        IndustryModel *model = [IndustryModel modelObjectWithDictionary:successDict];
        NSArray *array = model.data;
        aSuccBlock(array);
    } failure:^(NSDictionary *failDict, NSError *error) {
        aFailBlock([failDict objectForKey:@"error"]);
    }];
}

@end
