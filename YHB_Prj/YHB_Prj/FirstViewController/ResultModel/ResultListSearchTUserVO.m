//
//  ResultListSearchTUserVO.m
//
//  Created by  C陈政旭 on 15/7/6
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ResultListSearchTUserVO.h"
#import "ResultTUser.h"
#import "ResultTUserInfo.h"


NSString *const kResultListSearchTUserVOTUser = @"tUser";
NSString *const kResultListSearchTUserVOTUserInfo = @"tUserInfo";


@interface ResultListSearchTUserVO ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ResultListSearchTUserVO

@synthesize tUser = _tUser;
@synthesize tUserInfo = _tUserInfo;


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
            self.tUser = [ResultTUser modelObjectWithDictionary:[dict objectForKey:kResultListSearchTUserVOTUser]];
            self.tUserInfo = [ResultTUserInfo modelObjectWithDictionary:[dict objectForKey:kResultListSearchTUserVOTUserInfo]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.tUser dictionaryRepresentation] forKey:kResultListSearchTUserVOTUser];
    [mutableDict setValue:[self.tUserInfo dictionaryRepresentation] forKey:kResultListSearchTUserVOTUserInfo];

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

    self.tUser = [aDecoder decodeObjectForKey:kResultListSearchTUserVOTUser];
    self.tUserInfo = [aDecoder decodeObjectForKey:kResultListSearchTUserVOTUserInfo];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_tUser forKey:kResultListSearchTUserVOTUser];
    [aCoder encodeObject:_tUserInfo forKey:kResultListSearchTUserVOTUserInfo];
}

- (id)copyWithZone:(NSZone *)zone
{
    ResultListSearchTUserVO *copy = [[ResultListSearchTUserVO alloc] init];
    
    if (copy) {

        copy.tUser = [self.tUser copyWithZone:zone];
        copy.tUserInfo = [self.tUserInfo copyWithZone:zone];
    }
    
    return copy;
}


@end
