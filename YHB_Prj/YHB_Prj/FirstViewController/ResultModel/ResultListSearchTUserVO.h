//
//  ResultListSearchTUserVO.h
//
//  Created by  C陈政旭 on 15/7/6
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ResultTUser, ResultTUserInfo;

@interface ResultListSearchTUserVO : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) ResultTUser *tUser;
@property (nonatomic, strong) ResultTUserInfo *tUserInfo;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
