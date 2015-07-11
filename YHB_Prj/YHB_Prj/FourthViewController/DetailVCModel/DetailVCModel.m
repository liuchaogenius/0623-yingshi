//
//  DetailVCModel.m
//
//  Created by  C陈政旭 on 15/7/11
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "DetailVCModel.h"
#import "DetailVCData.h"


NSString *const kDetailVCModelSuccess = @"success";
NSString *const kDetailVCModelData = @"data";
NSString *const kDetailVCModelCode = @"code";


@interface DetailVCModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DetailVCModel

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
            self.success = [[self objectOrNilForKey:kDetailVCModelSuccess fromDictionary:dict] doubleValue];
            self.data = [DetailVCData modelObjectWithDictionary:[dict objectForKey:kDetailVCModelData]];
            self.code = [[self objectOrNilForKey:kDetailVCModelCode fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.success] forKey:kDetailVCModelSuccess];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kDetailVCModelData];
    [mutableDict setValue:[NSNumber numberWithDouble:self.code] forKey:kDetailVCModelCode];

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

    self.success = [aDecoder decodeDoubleForKey:kDetailVCModelSuccess];
    self.data = [aDecoder decodeObjectForKey:kDetailVCModelData];
    self.code = [aDecoder decodeDoubleForKey:kDetailVCModelCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_success forKey:kDetailVCModelSuccess];
    [aCoder encodeObject:_data forKey:kDetailVCModelData];
    [aCoder encodeDouble:_code forKey:kDetailVCModelCode];
}

- (id)copyWithZone:(NSZone *)zone
{
    DetailVCModel *copy = [[DetailVCModel alloc] init];
    
    if (copy) {

        copy.success = self.success;
        copy.data = [self.data copyWithZone:zone];
        copy.code = self.code;
    }
    
    return copy;
}


@end
