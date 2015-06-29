//
//  IndustryIndustries.h
//
//  Created by  C陈政旭 on 15/6/29
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface IndustryIndustries : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double code;
@property (nonatomic, assign) double industriesIdentifier;
@property (nonatomic, assign) double cateCode;
@property (nonatomic, strong) NSString *nameEn;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
