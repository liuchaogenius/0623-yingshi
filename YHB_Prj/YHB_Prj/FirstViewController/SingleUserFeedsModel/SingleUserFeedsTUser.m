//
//  SingleUserFeedsTUser.m
//
//  Created by  C陈政旭 on 15/7/7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "SingleUserFeedsTUser.h"


NSString *const kSingleUserFeedsTUserPassword = @"password";
NSString *const kSingleUserFeedsTUserId = @"id";
NSString *const kSingleUserFeedsTUserCreateTime = @"createTime";
NSString *const kSingleUserFeedsTUserLastLoginTime = @"lastLoginTime";
NSString *const kSingleUserFeedsTUserStatus = @"status";
NSString *const kSingleUserFeedsTUserUserName = @"userName";


@interface SingleUserFeedsTUser ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SingleUserFeedsTUser

@synthesize password = _password;
@synthesize tUserIdentifier = _tUserIdentifier;
@synthesize createTime = _createTime;
@synthesize lastLoginTime = _lastLoginTime;
@synthesize status = _status;
@synthesize userName = _userName;


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
            self.password = [self objectOrNilForKey:kSingleUserFeedsTUserPassword fromDictionary:dict];
            self.tUserIdentifier = [[self objectOrNilForKey:kSingleUserFeedsTUserId fromDictionary:dict] doubleValue];
            self.createTime = [[self objectOrNilForKey:kSingleUserFeedsTUserCreateTime fromDictionary:dict] doubleValue];
            self.lastLoginTime = [[self objectOrNilForKey:kSingleUserFeedsTUserLastLoginTime fromDictionary:dict] doubleValue];
            self.status = [[self objectOrNilForKey:kSingleUserFeedsTUserStatus fromDictionary:dict] doubleValue];
            self.userName = [self objectOrNilForKey:kSingleUserFeedsTUserUserName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.password forKey:kSingleUserFeedsTUserPassword];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tUserIdentifier] forKey:kSingleUserFeedsTUserId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createTime] forKey:kSingleUserFeedsTUserCreateTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lastLoginTime] forKey:kSingleUserFeedsTUserLastLoginTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kSingleUserFeedsTUserStatus];
    [mutableDict setValue:self.userName forKey:kSingleUserFeedsTUserUserName];

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

    self.password = [aDecoder decodeObjectForKey:kSingleUserFeedsTUserPassword];
    self.tUserIdentifier = [aDecoder decodeDoubleForKey:kSingleUserFeedsTUserId];
    self.createTime = [aDecoder decodeDoubleForKey:kSingleUserFeedsTUserCreateTime];
    self.lastLoginTime = [aDecoder decodeDoubleForKey:kSingleUserFeedsTUserLastLoginTime];
    self.status = [aDecoder decodeDoubleForKey:kSingleUserFeedsTUserStatus];
    self.userName = [aDecoder decodeObjectForKey:kSingleUserFeedsTUserUserName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_password forKey:kSingleUserFeedsTUserPassword];
    [aCoder encodeDouble:_tUserIdentifier forKey:kSingleUserFeedsTUserId];
    [aCoder encodeDouble:_createTime forKey:kSingleUserFeedsTUserCreateTime];
    [aCoder encodeDouble:_lastLoginTime forKey:kSingleUserFeedsTUserLastLoginTime];
    [aCoder encodeDouble:_status forKey:kSingleUserFeedsTUserStatus];
    [aCoder encodeObject:_userName forKey:kSingleUserFeedsTUserUserName];
}

- (id)copyWithZone:(NSZone *)zone
{
    SingleUserFeedsTUser *copy = [[SingleUserFeedsTUser alloc] init];
    
    if (copy) {

        copy.password = [self.password copyWithZone:zone];
        copy.tUserIdentifier = self.tUserIdentifier;
        copy.createTime = self.createTime;
        copy.lastLoginTime = self.lastLoginTime;
        copy.status = self.status;
        copy.userName = [self.userName copyWithZone:zone];
    }
    
    return copy;
}


@end
