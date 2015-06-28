//
//  FirstData.m
//
//  Created by  C陈政旭 on 15/6/28
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FirstData.h"
#import "FirstTUserFeedsVOList.h"


NSString *const kFirstDataCount = @"count";
NSString *const kFirstDataTUserFeedsVOList = @"tUserFeedsVOList";


@interface FirstData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation FirstData

@synthesize count = _count;
@synthesize tUserFeedsVOList = _tUserFeedsVOList;


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
            self.count = [[self objectOrNilForKey:kFirstDataCount fromDictionary:dict] doubleValue];
    NSObject *receivedFirstTUserFeedsVOList = [dict objectForKey:kFirstDataTUserFeedsVOList];
    NSMutableArray *parsedFirstTUserFeedsVOList = [NSMutableArray array];
    if ([receivedFirstTUserFeedsVOList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedFirstTUserFeedsVOList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedFirstTUserFeedsVOList addObject:[FirstTUserFeedsVOList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedFirstTUserFeedsVOList isKindOfClass:[NSDictionary class]]) {
       [parsedFirstTUserFeedsVOList addObject:[FirstTUserFeedsVOList modelObjectWithDictionary:(NSDictionary *)receivedFirstTUserFeedsVOList]];
    }

    self.tUserFeedsVOList = [NSArray arrayWithArray:parsedFirstTUserFeedsVOList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kFirstDataCount];
    NSMutableArray *tempArrayForTUserFeedsVOList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.tUserFeedsVOList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForTUserFeedsVOList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForTUserFeedsVOList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTUserFeedsVOList] forKey:kFirstDataTUserFeedsVOList];

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

    self.count = [aDecoder decodeDoubleForKey:kFirstDataCount];
    self.tUserFeedsVOList = [aDecoder decodeObjectForKey:kFirstDataTUserFeedsVOList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_count forKey:kFirstDataCount];
    [aCoder encodeObject:_tUserFeedsVOList forKey:kFirstDataTUserFeedsVOList];
}

- (id)copyWithZone:(NSZone *)zone
{
    FirstData *copy = [[FirstData alloc] init];
    
    if (copy) {

        copy.count = self.count;
        copy.tUserFeedsVOList = [self.tUserFeedsVOList copyWithZone:zone];
    }
    
    return copy;
}


@end
