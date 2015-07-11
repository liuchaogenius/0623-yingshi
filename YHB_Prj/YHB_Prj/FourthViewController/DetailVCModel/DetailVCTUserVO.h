//
//  DetailVCTUserVO.h
//
//  Created by  C陈政旭 on 15/7/11
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DetailVCTUser, DetailVCTUserInfo;

@interface DetailVCTUserVO : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) DetailVCTUser *tUser;
@property (nonatomic, strong) DetailVCTUserInfo *tUserInfo;
@property (nonatomic, strong) NSArray *tUserProfileList;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
