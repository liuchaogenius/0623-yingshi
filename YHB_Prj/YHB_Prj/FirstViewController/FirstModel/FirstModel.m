//
//  FirstModel.m
//
//  Created by  C陈政旭 on 15/6/28
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FirstModel.h"
#import "FirstData.h"


NSString *const kFirstModelSuccess = @"success";
NSString *const kFirstModelData = @"data";
NSString *const kFirstModelCode = @"code";


@interface FirstModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation FirstModel

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
            self.success = [[self objectOrNilForKey:kFirstModelSuccess fromDictionary:dict] doubleValue];
            self.data = [FirstData modelObjectWithDictionary:[dict objectForKey:kFirstModelData]];
            self.code = [[self objectOrNilForKey:kFirstModelCode fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.success] forKey:kFirstModelSuccess];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kFirstModelData];
    [mutableDict setValue:[NSNumber numberWithDouble:self.code] forKey:kFirstModelCode];

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

    self.success = [aDecoder decodeDoubleForKey:kFirstModelSuccess];
    self.data = [aDecoder decodeObjectForKey:kFirstModelData];
    self.code = [aDecoder decodeDoubleForKey:kFirstModelCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_success forKey:kFirstModelSuccess];
    [aCoder encodeObject:_data forKey:kFirstModelData];
    [aCoder encodeDouble:_code forKey:kFirstModelCode];
}

- (id)copyWithZone:(NSZone *)zone
{
    FirstModel *copy = [[FirstModel alloc] init];
    
    if (copy) {

        copy.success = self.success;
        copy.data = [self.data copyWithZone:zone];
        copy.code = self.code;
    }
    
    return copy;
}


@end
