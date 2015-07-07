//
//  SingleUserFeedsTUserFeedsVO.h
//
//  Created by  C陈政旭 on 15/7/7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SingleUserFeedsTPostUserFeedsUserVO, SingleUserFeedsTUserFeeds;

@interface SingleUserFeedsTUserFeedsVO : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *tCommentAndUserVOList;
@property (nonatomic, strong) SingleUserFeedsTPostUserFeedsUserVO *tPostUserFeedsUserVO;
@property (nonatomic, strong) SingleUserFeedsTUserFeeds *tUserFeeds;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
