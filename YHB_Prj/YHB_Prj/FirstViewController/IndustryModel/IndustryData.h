//
//  IndustryData.h
//
//  Created by  C陈政旭 on 15/6/29
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IndustryCategory;

@interface IndustryData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *industries;
@property (nonatomic, strong) IndustryCategory *category;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
