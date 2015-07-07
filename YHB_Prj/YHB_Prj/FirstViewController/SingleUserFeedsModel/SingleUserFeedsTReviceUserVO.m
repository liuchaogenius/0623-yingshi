//
//  SingleUserFeedsTReviceUserVO.m
//
//  Created by  C陈政旭 on 15/7/7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "SingleUserFeedsTReviceUserVO.h"
#import "SingleUserFeedsTUser.h"
#import "SingleUserFeedsTUserInfo.h"


NSString *const kSingleUserFeedsTReviceUserVOTUser = @"tUser";
NSString *const kSingleUserFeedsTReviceUserVOTUserInfo = @"tUserInfo";


@interface SingleUserFeedsTReviceUserVO ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SingleUserFeedsTReviceUserVO

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
            self.tUser = [SingleUserFeedsTUser modelObjectWithDictionary:[dict objectForKey:kSingleUserFeedsTReviceUserVOTUser]];
            self.tUserInfo = [SingleUserFeedsTUserInfo modelObjectWithDictionary:[dict objectForKey:kSingleUserFeedsTReviceUserVOTUserInfo]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.tUser dictionaryRepresentation] forKey:kSingleUserFeedsTReviceUserVOTUser];
    [mutableDict setValue:[self.tUserInfo dictionaryRepresentation] forKey:kSingleUserFeedsTReviceUserVOTUserInfo];

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

    self.tUser = [aDecoder decodeObjectForKey:kSingleUserFeedsTReviceUserVOTUser];
    self.tUserInfo = [aDecoder decodeObjectForKey:kSingleUserFeedsTReviceUserVOTUserInfo];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_tUser forKey:kSingleUserFeedsTReviceUserVOTUser];
    [aCoder encodeObject:_tUserInfo forKey:kSingleUserFeedsTReviceUserVOTUserInfo];
}

- (id)copyWithZone:(NSZone *)zone
{
    SingleUserFeedsTReviceUserVO *copy = [[SingleUserFeedsTReviceUserVO alloc] init];
    
    if (copy) {

        copy.tUser = [self.tUser copyWithZone:zone];
        copy.tUserInfo = [self.tUserInfo copyWithZone:zone];
    }
    
    return copy;
}


@end
