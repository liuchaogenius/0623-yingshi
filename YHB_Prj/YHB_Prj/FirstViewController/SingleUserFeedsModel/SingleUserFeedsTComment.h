//
//  SingleUserFeedsTComment.h
//
//  Created by  C陈政旭 on 15/7/7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SingleUserFeedsTComment : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double status;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, assign) double parentId;
@property (nonatomic, assign) double tCommentIdentifier;
@property (nonatomic, assign) double modifyTime;
@property (nonatomic, assign) double authorId;
@property (nonatomic, assign) double userId;
@property (nonatomic, assign) double type;
@property (nonatomic, assign) double createTime;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
