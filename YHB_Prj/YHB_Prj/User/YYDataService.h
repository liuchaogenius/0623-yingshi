//
//  YYDataService.h
//  YHB_Prj
//
//  Created by Johnny's on 15/7/10.
//  Copyright (c) 2015年 striveliu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYTUser.h"
#import "YYTUserInfo.h"

@interface YYDataService : NSObject

+ (YYDataService *)sharedYYDataSevice;

- (void)saveTUser:(YYTUser *)aTUser;
- (void)saveTUserInfo:(YYTUserInfo *)aTUserInfo;
- (YYTUser *)getTUser;
- (YYTUserInfo *)getTUserInfo;
- (void)clearUserInfo;
@end
