//
//  IndustryData.m
//
//  Created by  C陈政旭 on 15/6/29
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "IndustryData.h"
#import "IndustryIndustries.h"
#import "IndustryCategory.h"


NSString *const kIndustryDataIndustries = @"industries";
NSString *const kIndustryDataCategory = @"category";


@interface IndustryData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation IndustryData

@synthesize industries = _industries;
@synthesize category = _category;


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
    NSObject *receivedIndustryIndustries = [dict objectForKey:kIndustryDataIndustries];
    NSMutableArray *parsedIndustryIndustries = [NSMutableArray array];
    if ([receivedIndustryIndustries isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedIndustryIndustries) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedIndustryIndustries addObject:[IndustryIndustries modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedIndustryIndustries isKindOfClass:[NSDictionary class]]) {
       [parsedIndustryIndustries addObject:[IndustryIndustries modelObjectWithDictionary:(NSDictionary *)receivedIndustryIndustries]];
    }

    self.industries = [NSArray arrayWithArray:parsedIndustryIndustries];
            self.category = [IndustryCategory modelObjectWithDictionary:[dict objectForKey:kIndustryDataCategory]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForIndustries = [NSMutableArray array];
    for (NSObject *subArrayObject in self.industries) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForIndustries addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForIndustries addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForIndustries] forKey:kIndustryDataIndustries];
    [mutableDict setValue:[self.category dictionaryRepresentation] forKey:kIndustryDataCategory];

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

    self.industries = [aDecoder decodeObjectForKey:kIndustryDataIndustries];
    self.category = [aDecoder decodeObjectForKey:kIndustryDataCategory];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_industries forKey:kIndustryDataIndustries];
    [aCoder encodeObject:_category forKey:kIndustryDataCategory];
}

- (id)copyWithZone:(NSZone *)zone
{
    IndustryData *copy = [[IndustryData alloc] init];
    
    if (copy) {

        copy.industries = [self.industries copyWithZone:zone];
        copy.category = [self.category copyWithZone:zone];
    }
    
    return copy;
}


@end
