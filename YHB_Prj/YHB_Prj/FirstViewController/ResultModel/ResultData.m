//
//  ResultData.m
//
//  Created by  C陈政旭 on 15/7/6
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ResultData.h"
#import "ResultListSearchTUserVO.h"


NSString *const kResultDataListSearchTUserVO = @"listSearchTUserVO";


@interface ResultData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ResultData

@synthesize listSearchTUserVO = _listSearchTUserVO;


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
    NSObject *receivedResultListSearchTUserVO = [dict objectForKey:kResultDataListSearchTUserVO];
    NSMutableArray *parsedResultListSearchTUserVO = [NSMutableArray array];
    if ([receivedResultListSearchTUserVO isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedResultListSearchTUserVO) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedResultListSearchTUserVO addObject:[ResultListSearchTUserVO modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedResultListSearchTUserVO isKindOfClass:[NSDictionary class]]) {
       [parsedResultListSearchTUserVO addObject:[ResultListSearchTUserVO modelObjectWithDictionary:(NSDictionary *)receivedResultListSearchTUserVO]];
    }

    self.listSearchTUserVO = [NSArray arrayWithArray:parsedResultListSearchTUserVO];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForListSearchTUserVO = [NSMutableArray array];
    for (NSObject *subArrayObject in self.listSearchTUserVO) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForListSearchTUserVO addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForListSearchTUserVO addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForListSearchTUserVO] forKey:kResultDataListSearchTUserVO];

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

    self.listSearchTUserVO = [aDecoder decodeObjectForKey:kResultDataListSearchTUserVO];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_listSearchTUserVO forKey:kResultDataListSearchTUserVO];
}

- (id)copyWithZone:(NSZone *)zone
{
    ResultData *copy = [[ResultData alloc] init];
    
    if (copy) {

        copy.listSearchTUserVO = [self.listSearchTUserVO copyWithZone:zone];
    }
    
    return copy;
}


@end
