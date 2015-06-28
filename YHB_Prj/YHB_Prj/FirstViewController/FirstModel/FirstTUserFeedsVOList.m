//
//  FirstTUserFeedsVOList.m
//
//  Created by  C陈政旭 on 15/6/28
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FirstTUserFeedsVOList.h"
#import "FirstTPostUserFeedsUserVO.h"
#import "FirstTUserFeeds.h"


NSString *const kFirstTUserFeedsVOListTPostUserFeedsUserVO = @"tPostUserFeedsUserVO";
NSString *const kFirstTUserFeedsVOListTUserFeeds = @"tUserFeeds";


@interface FirstTUserFeedsVOList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation FirstTUserFeedsVOList

@synthesize tPostUserFeedsUserVO = _tPostUserFeedsUserVO;
@synthesize tUserFeeds = _tUserFeeds;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.tPostUserFeedsUserVO = [FirstTPostUserFeedsUserVO modelObjectWithDictionary:[dict objectForKey:kFirstTUserFeedsVOListTPostUserFeedsUserVO]];
            self.tUserFeeds = [FirstTUserFeeds modelObjectWithDictionary:[dict objectForKey:kFirstTUserFeedsVOListTUserFeeds]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.tPostUserFeedsUserVO dictionaryRepresentation] forKey:kFirstTUserFeedsVOListTPostUserFeedsUserVO];
    [mutableDict setValue:[self.tUserFeeds dictionaryRepresentation] forKey:kFirstTUserFeedsVOListTUserFeeds];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.tPostUserFeedsUserVO = [aDecoder decodeObjectForKey:kFirstTUserFeedsVOListTPostUserFeedsUserVO];
    self.tUserFeeds = [aDecoder decodeObjectForKey:kFirstTUserFeedsVOListTUserFeeds];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_tPostUserFeedsUserVO forKey:kFirstTUserFeedsVOListTPostUserFeedsUserVO];
    [aCoder encodeObject:_tUserFeeds forKey:kFirstTUserFeedsVOListTUserFeeds];
}

- (id)copyWithZone:(NSZone *)zone
{
    FirstTUserFeedsVOList *copy = [[FirstTUserFeedsVOList alloc] init];
    
    if (copy) {

        copy.tPostUserFeedsUserVO = [self.tPostUserFeedsUserVO copyWithZone:zone];
        copy.tUserFeeds = [self.tUserFeeds copyWithZone:zone];
    }
    
    return copy;
}


@end
