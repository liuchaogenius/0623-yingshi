//
//  FirstData.h
//
//  Created by  C陈政旭 on 15/6/28
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface FirstData : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double count;
@property (nonatomic, strong) NSArray *tUserFeedsVOList;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
