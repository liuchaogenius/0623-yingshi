//
//  DetailVCModel.h
//
//  Created by  C陈政旭 on 15/7/11
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DetailVCData;

@interface DetailVCModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double success;
@property (nonatomic, strong) DetailVCData *data;
@property (nonatomic, assign) double code;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
