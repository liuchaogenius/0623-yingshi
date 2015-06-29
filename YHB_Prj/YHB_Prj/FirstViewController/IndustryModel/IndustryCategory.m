//
//  IndustryCategory.m
//
//  Created by  C陈政旭 on 15/6/29
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "IndustryCategory.h"


NSString *const kIndustryCategoryCode = @"code";
NSString *const kIndustryCategoryId = @"id";
NSString *const kIndustryCategoryNameEn = @"nameEn";
NSString *const kIndustryCategoryName = @"name";


@interface IndustryCategory ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation IndustryCategory

@synthesize code = _code;
@synthesize categoryIdentifier = _categoryIdentifier;
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
            self.code = [[self objectOrNilForKey:kIndustryCategoryCode fromDictionary:dict] doubleValue];
            self.categoryIdentifier = [[self objectOrNilForKey:kIndustryCategoryId fromDictionary:dict] doubleValue];
            self.nameEn = [self objectOrNilForKey:kIndustryCategoryNameEn fromDictionary:dict];
            self.name = [self objectOrNilForKey:kIndustryCategoryName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.code] forKey:kIndustryCategoryCode];
    [mutableDict setValue:[NSNumber numberWithDouble:self.categoryIdentifier] forKey:kIndustryCategoryId];
    [mutableDict setValue:self.nameEn forKey:kIndustryCategoryNameEn];
    [mutableDict setValue:self.name forKey:kIndustryCategoryName];

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

    self.code = [aDecoder decodeDoubleForKey:kIndustryCategoryCode];
    self.categoryIdentifier = [aDecoder decodeDoubleForKey:kIndustryCategoryId];
    self.nameEn = [aDecoder decodeObjectForKey:kIndustryCategoryNameEn];
    self.name = [aDecoder decodeObjectForKey:kIndustryCategoryName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_code forKey:kIndustryCategoryCode];
    [aCoder encodeDouble:_categoryIdentifier forKey:kIndustryCategoryId];
    [aCoder encodeObject:_nameEn forKey:kIndustryCategoryNameEn];
    [aCoder encodeObject:_name forKey:kIndustryCategoryName];
}

- (id)copyWithZone:(NSZone *)zone
{
    IndustryCategory *copy = [[IndustryCategory alloc] init];
    
    if (copy) {

        copy.code = self.code;
        copy.categoryIdentifier = self.categoryIdentifier;
        copy.nameEn = [self.nameEn copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
