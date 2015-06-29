//
//  IndustryIndustries.m
//
//  Created by  C陈政旭 on 15/6/29
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "IndustryIndustries.h"


NSString *const kIndustryIndustriesCode = @"code";
NSString *const kIndustryIndustriesId = @"id";
NSString *const kIndustryIndustriesCateCode = @"cateCode";
NSString *const kIndustryIndustriesNameEn = @"nameEn";
NSString *const kIndustryIndustriesName = @"name";


@interface IndustryIndustries ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation IndustryIndustries

@synthesize code = _code;
@synthesize industriesIdentifier = _industriesIdentifier;
@synthesize cateCode = _cateCode;
@synthesize nameEn = _nameEn;
@synthesize name = _name;


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
            self.code = [[self objectOrNilForKey:kIndustryIndustriesCode fromDictionary:dict] doubleValue];
            self.industriesIdentifier = [[self objectOrNilForKey:kIndustryIndustriesId fromDictionary:dict] doubleValue];
            self.cateCode = [[self objectOrNilForKey:kIndustryIndustriesCateCode fromDictionary:dict] doubleValue];
            self.nameEn = [self objectOrNilForKey:kIndustryIndustriesNameEn fromDictionary:dict];
            self.name = [self objectOrNilForKey:kIndustryIndustriesName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.code] forKey:kIndustryIndustriesCode];
    [mutableDict setValue:[NSNumber numberWithDouble:self.industriesIdentifier] forKey:kIndustryIndustriesId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cateCode] forKey:kIndustryIndustriesCateCode];
    [mutableDict setValue:self.nameEn forKey:kIndustryIndustriesNameEn];
    [mutableDict setValue:self.name forKey:kIndustryIndustriesName];

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

    self.code = [aDecoder decodeDoubleForKey:kIndustryIndustriesCode];
    self.industriesIdentifier = [aDecoder decodeDoubleForKey:kIndustryIndustriesId];
    self.cateCode = [aDecoder decodeDoubleForKey:kIndustryIndustriesCateCode];
    self.nameEn = [aDecoder decodeObjectForKey:kIndustryIndustriesNameEn];
    self.name = [aDecoder decodeObjectForKey:kIndustryIndustriesName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_code forKey:kIndustryIndustriesCode];
    [aCoder encodeDouble:_industriesIdentifier forKey:kIndustryIndustriesId];
    [aCoder encodeDouble:_cateCode forKey:kIndustryIndustriesCateCode];
    [aCoder encodeObject:_nameEn forKey:kIndustryIndustriesNameEn];
    [aCoder encodeObject:_name forKey:kIndustryIndustriesName];
}

- (id)copyWithZone:(NSZone *)zone
{
    IndustryIndustries *copy = [[IndustryIndustries alloc] init];
    
    if (copy) {

        copy.code = self.code;
        copy.industriesIdentifier = self.industriesIdentifier;
        copy.cateCode = self.cateCode;
        copy.nameEn = [self.nameEn copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
