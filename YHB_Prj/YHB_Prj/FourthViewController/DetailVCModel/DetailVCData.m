//
//  DetailVCData.m
//
//  Created by  C陈政旭 on 15/7/11
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "DetailVCData.h"
#import "DetailVCTUserVO.h"
#import "DetailVCListHasPicFeeds.h"


NSString *const kDetailVCDataTUserVO = @"tUserVO";
NSString *const kDetailVCDataNoReadFeedsCount = @"noReadFeedsCount";
NSString *const kDetailVCDataListHasPicFeeds = @"listHasPicFeeds";


@interface DetailVCData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DetailVCData

@synthesize tUserVO = _tUserVO;
@synthesize noReadFeedsCount = _noReadFeedsCount;
@synthesize listHasPicFeeds = _listHasPicFeeds;


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
            self.tUserVO = [DetailVCTUserVO modelObjectWithDictionary:[dict objectForKey:kDetailVCDataTUserVO]];
            self.noReadFeedsCount = [[self objectOrNilForKey:kDetailVCDataNoReadFeedsCount fromDictionary:dict] doubleValue];
    NSObject *receivedDetailVCListHasPicFeeds = [dict objectForKey:kDetailVCDataListHasPicFeeds];
    NSMutableArray *parsedDetailVCListHasPicFeeds = [NSMutableArray array];
    if ([receivedDetailVCListHasPicFeeds isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedDetailVCListHasPicFeeds) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedDetailVCListHasPicFeeds addObject:[DetailVCListHasPicFeeds modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedDetailVCListHasPicFeeds isKindOfClass:[NSDictionary class]]) {
       [parsedDetailVCListHasPicFeeds addObject:[DetailVCListHasPicFeeds modelObjectWithDictionary:(NSDictionary *)receivedDetailVCListHasPicFeeds]];
    }

    self.listHasPicFeeds = [NSArray arrayWithArray:parsedDetailVCListHasPicFeeds];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.tUserVO dictionaryRepresentation] forKey:kDetailVCDataTUserVO];
    [mutableDict setValue:[NSNumber numberWithDouble:self.noReadFeedsCount] forKey:kDetailVCDataNoReadFeedsCount];
    NSMutableArray *tempArrayForListHasPicFeeds = [NSMutableArray array];
    for (NSObject *subArrayObject in self.listHasPicFeeds) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForListHasPicFeeds addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForListHasPicFeeds addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForListHasPicFeeds] forKey:kDetailVCDataListHasPicFeeds];

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

    self.tUserVO = [aDecoder decodeObjectForKey:kDetailVCDataTUserVO];
    self.noReadFeedsCount = [aDecoder decodeDoubleForKey:kDetailVCDataNoReadFeedsCount];
    self.listHasPicFeeds = [aDecoder decodeObjectForKey:kDetailVCDataListHasPicFeeds];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_tUserVO forKey:kDetailVCDataTUserVO];
    [aCoder encodeDouble:_noReadFeedsCount forKey:kDetailVCDataNoReadFeedsCount];
    [aCoder encodeObject:_listHasPicFeeds forKey:kDetailVCDataListHasPicFeeds];
}

- (id)copyWithZone:(NSZone *)zone
{
    DetailVCData *copy = [[DetailVCData alloc] init];
    
    if (copy) {

        copy.tUserVO = [self.tUserVO copyWithZone:zone];
        copy.noReadFeedsCount = self.noReadFeedsCount;
        copy.listHasPicFeeds = [self.listHasPicFeeds copyWithZone:zone];
    }
    
    return copy;
}


@end
