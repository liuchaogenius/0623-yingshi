//
//  IndustryModel.m
//
//  Created by  C陈政旭 on 15/6/29
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "IndustryModel.h"
#import "IndustryData.h"


NSString *const kIndustryModelSuccess = @"success";
NSString *const kIndustryModelData = @"data";
NSString *const kIndustryModelCode = @"code";


@interface IndustryModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation IndustryModel

@synthesize success = _success;
@synthesize data = _data;
@synthesize code = _code;


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
            self.success = [[self objectOrNilForKey:kIndustryModelSuccess fromDictionary:dict] doubleValue];
    NSObject *receivedIndustryData = [dict objectForKey:kIndustryModelData];
    NSMutableArray *parsedIndustryData = [NSMutableArray array];
    if ([receivedIndustryData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedIndustryData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedIndustryData addObject:[IndustryData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedIndustryData isKindOfClass:[NSDictionary class]]) {
       [parsedIndustryData addObject:[IndustryData modelObjectWithDictionary:(NSDictionary *)receivedIndustryData]];
    }

    self.data = [NSArray arrayWithArray:parsedIndustryData];
            self.code = [[self objectOrNilForKey:kIndustryModelCode fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.success] forKey:kIndustryModelSuccess];
    NSMutableArray *tempArrayForData = [NSMutableArray array];
    for (NSObject *subArrayObject in self.data) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForData addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForData addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kIndustryModelData];
    [mutableDict setValue:[NSNumber numberWithDouble:self.code] forKey:kIndustryModelCode];

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

    self.success = [aDecoder decodeDoubleForKey:kIndustryModelSuccess];
    self.data = [aDecoder decodeObjectForKey:kIndustryModelData];
    self.code = [aDecoder decodeDoubleForKey:kIndustryModelCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_success forKey:kIndustryModelSuccess];
    [aCoder encodeObject:_data forKey:kIndustryModelData];
    [aCoder encodeDouble:_code forKey:kIndustryModelCode];
}

- (id)copyWithZone:(NSZone *)zone
{
    IndustryModel *copy = [[IndustryModel alloc] init];
    
    if (copy) {

        copy.success = self.success;
        copy.data = [self.data copyWithZone:zone];
        copy.code = self.code;
    }
    
    return copy;
}


@end
