//
//  FirstTPostUserFeedsUserVO.m
//
//  Created by  C陈政旭 on 15/6/28
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FirstTPostUserFeedsUserVO.h"
#import "FirstTUser.h"
#import "FirstTUserInfo.h"


NSString *const kFirstTPostUserFeedsUserVOTUser = @"tUser";
NSString *const kFirstTPostUserFeedsUserVOTUserInfo = @"tUserInfo";


@interface FirstTPostUserFeedsUserVO ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation FirstTPostUserFeedsUserVO

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
            self.tUser = [FirstTUser modelObjectWithDictionary:[dict objectForKey:kFirstTPostUserFeedsUserVOTUser]];
            self.tUserInfo = [FirstTUserInfo modelObjectWithDictionary:[dict objectForKey:kFirstTPostUserFeedsUserVOTUserInfo]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.tUser dictionaryRepresentation] forKey:kFirstTPostUserFeedsUserVOTUser];
    [mutableDict setValue:[self.tUserInfo dictionaryRepresentation] forKey:kFirstTPostUserFeedsUserVOTUserInfo];

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

    self.tUser = [aDecoder decodeObjectForKey:kFirstTPostUserFeedsUserVOTUser];
    self.tUserInfo = [aDecoder decodeObjectForKey:kFirstTPostUserFeedsUserVOTUserInfo];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_tUser forKey:kFirstTPostUserFeedsUserVOTUser];
    [aCoder encodeObject:_tUserInfo forKey:kFirstTPostUserFeedsUserVOTUserInfo];
}

- (id)copyWithZone:(NSZone *)zone
{
    FirstTPostUserFeedsUserVO *copy = [[FirstTPostUserFeedsUserVO alloc] init];
    
    if (copy) {

        copy.tUser = [self.tUser copyWithZone:zone];
        copy.tUserInfo = [self.tUserInfo copyWithZone:zone];
    }
    
    return copy;
}


@end
