//
//  FirstTUserFeedsVOList.h
//
//  Created by  C陈政旭 on 15/6/28
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FirstTPostUserFeedsUserVO, FirstTUserFeeds;

@interface FirstTUserFeedsVOList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) FirstTPostUserFeedsUserVO *tPostUserFeedsUserVO;
@property (nonatomic, strong) FirstTUserFeeds *tUserFeeds;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
