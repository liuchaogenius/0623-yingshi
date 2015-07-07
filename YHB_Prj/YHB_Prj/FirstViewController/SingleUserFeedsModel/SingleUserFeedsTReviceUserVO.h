//
//  SingleUserFeedsTReviceUserVO.h
//
//  Created by  C陈政旭 on 15/7/7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SingleUserFeedsTUser, SingleUserFeedsTUserInfo;

@interface SingleUserFeedsTReviceUserVO : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) SingleUserFeedsTUser *tUser;
@property (nonatomic, strong) SingleUserFeedsTUserInfo *tUserInfo;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
