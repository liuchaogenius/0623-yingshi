//
//  SingleUserFeedsData.m
//
//  Created by  C陈政旭 on 15/7/7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "SingleUserFeedsData.h"
#import "SingleUserFeedsTUserFeedsVO.h"


NSString *const kSingleUserFeedsDataTUserFeedsVO = @"tUserFeedsVO";


@interface SingleUserFeedsData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SingleUserFeedsData

@synthesize tUserFeedsVO = _tUserFeedsVO;


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
            self.tUserFeedsVO = [SingleUserFeedsTUserFeedsVO modelObjectWithDictionary:[dict objectForKey:kSingleUserFeedsDataTUserFeedsVO]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.tUserFeedsVO dictionaryRepresentation] forKey:kSingleUserFeedsDataTUserFeedsVO];

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

    self.tUserFeedsVO = [aDecoder decodeObjectForKey:kSingleUserFeedsDataTUserFeedsVO];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_tUserFeedsVO forKey:kSingleUserFeedsDataTUserFeedsVO];
}

- (id)copyWithZone:(NSZone *)zone
{
    SingleUserFeedsData *copy = [[SingleUserFeedsData alloc] init];
    
    if (copy) {

        copy.tUserFeedsVO = [self.tUserFeedsVO copyWithZone:zone];
    }
    
    return copy;
}


@end
