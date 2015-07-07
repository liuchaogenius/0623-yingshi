//
//  SingleUserFeedsData.h
//
//  Created by  C陈政旭 on 15/7/7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SingleUserFeedsTUserFeedsVO;

@interface SingleUserFeedsData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) SingleUserFeedsTUserFeedsVO *tUserFeedsVO;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
