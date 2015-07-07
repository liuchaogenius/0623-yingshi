//
//  SingleUserFeedsTCommentAndUserVOList.h
//
//  Created by  C陈政旭 on 15/7/7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SingleUserFeedsTComment, SingleUserFeedsTCommentPostUserVO, SingleUserFeedsTReviceUserVO;

@interface SingleUserFeedsTCommentAndUserVOList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) SingleUserFeedsTComment *tComment;
@property (nonatomic, strong) SingleUserFeedsTCommentPostUserVO *tCommentPostUserVO;
@property (nonatomic, strong) SingleUserFeedsTReviceUserVO *tReviceUserVO;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
