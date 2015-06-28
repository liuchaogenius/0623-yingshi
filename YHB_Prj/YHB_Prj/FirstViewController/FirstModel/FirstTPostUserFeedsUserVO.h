//
//  FirstTPostUserFeedsUserVO.h
//
//  Created by  C陈政旭 on 15/6/28
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FirstTUser, FirstTUserInfo;

@interface FirstTPostUserFeedsUserVO : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) FirstTUser *tUser;
@property (nonatomic, strong) FirstTUserInfo *tUserInfo;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
