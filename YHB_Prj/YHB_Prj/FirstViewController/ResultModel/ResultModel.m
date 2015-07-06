//
//  ResultModel.m
//
//  Created by  C陈政旭 on 15/7/6
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ResultModel.h"
#import "ResultData.h"


NSString *const kResultModelSuccess = @"success";
NSString *const kResultModelData = @"data";
NSString *const kResultModelCode = @"code";


@interface ResultModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ResultModel

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
            self.success = [[self objectOrNilForKey:kResultModelSuccess fromDictionary:dict] doubleValue];
            self.data = [ResultData modelObjectWithDictionary:[dict objectForKey:kResultModelData]];
            self.code = [[self objectOrNilForKey:kResultModelCode fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.success] forKey:kResultModelSuccess];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kResultModelData];
    [mutableDict setValue:[NSNumber numberWithDouble:self.code] forKey:kResultModelCode];

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

    self.success = [aDecoder decodeDoubleForKey:kResultModelSuccess];
    self.data = [aDecoder decodeObjectForKey:kResultModelData];
    self.code = [aDecoder decodeDoubleForKey:kResultModelCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_success forKey:kResultModelSuccess];
    [aCoder encodeObject:_data forKey:kResultModelData];
    [aCoder encodeDouble:_code forKey:kResultModelCode];
}

- (id)copyWithZone:(NSZone *)zone
{
    ResultModel *copy = [[ResultModel alloc] init];
    
    if (copy) {

        copy.success = self.success;
        copy.data = [self.data copyWithZone:zone];
        copy.code = self.code;
    }
    
    return copy;
}


@end
