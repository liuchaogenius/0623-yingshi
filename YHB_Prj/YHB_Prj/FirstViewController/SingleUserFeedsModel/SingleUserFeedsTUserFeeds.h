//
//  SingleUserFeedsTUserFeeds.h
//
//  Created by  C陈政旭 on 15/7/7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SingleUserFeedsTUserFeeds : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double modifyTime;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, assign) double userId;
@property (nonatomic, assign) double tUserFeedsIdentifier;
@property (nonatomic, assign) double praise;
@property (nonatomic, assign) double pageCount;
@property (nonatomic, strong) NSString *attributes;
@property (nonatomic, assign) double createTime;
@property (nonatomic, assign) double commentCount;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
