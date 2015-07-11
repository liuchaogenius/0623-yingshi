//
//  DetailVCData.h
//
//  Created by  C陈政旭 on 15/7/11
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DetailVCTUserVO;

@interface DetailVCData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) DetailVCTUserVO *tUserVO;
@property (nonatomic, assign) double noReadFeedsCount;
@property (nonatomic, strong) NSArray *listHasPicFeeds;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
