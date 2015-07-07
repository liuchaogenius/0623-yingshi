//
//  SingleUserFeedsModel.m
//
//  Created by  C陈政旭 on 15/7/7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "SingleUserFeedsModel.h"
#import "SingleUserFeedsData.h"


NSString *const kSingleUserFeedsModelSuccess = @"success";
NSString *const kSingleUserFeedsModelData = @"data";
NSString *const kSingleUserFeedsModelCode = @"code";


@interface SingleUserFeedsModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SingleUserFeedsModel

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
            self.success = [[self objectOrNilForKey:kSingleUserFeedsModelSuccess fromDictionary:dict] doubleValue];
            self.data = [SingleUserFeedsData modelObjectWithDictionary:[dict objectForKey:kSingleUserFeedsModelData]];
            self.code = [[self objectOrNilForKey:kSingleUserFeedsModelCode fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.success] forKey:kSingleUserFeedsModelSuccess];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kSingleUserFeedsModelData];
    [mutableDict setValue:[NSNumber numberWithDouble:self.code] forKey:kSingleUserFeedsModelCode];

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

    self.success = [aDecoder decodeDoubleForKey:kSingleUserFeedsModelSuccess];
    self.data = [aDecoder decodeObjectForKey:kSingleUserFeedsModelData];
    self.code = [aDecoder decodeDoubleForKey:kSingleUserFeedsModelCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_success forKey:kSingleUserFeedsModelSuccess];
    [aCoder encodeObject:_data forKey:kSingleUserFeedsModelData];
    [aCoder encodeDouble:_code forKey:kSingleUserFeedsModelCode];
}

- (id)copyWithZone:(NSZone *)zone
{
    SingleUserFeedsModel *copy = [[SingleUserFeedsModel alloc] init];
    
    if (copy) {

        copy.success = self.success;
        copy.data = [self.data copyWithZone:zone];
        copy.code = self.code;
    }
    
    return copy;
}


@end
