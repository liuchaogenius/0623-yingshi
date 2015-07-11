//
//  YYTUser.m
//
//  Created by  C陈政旭 on 15/7/11
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "YYTUser.h"


NSString *const kYYTUserStatus = @"status";
NSString *const kYYTUserPassword = @"password";
NSString *const kYYTUserLastLoginTime = @"lastLoginTime";
NSString *const kYYTUserId = @"id";
NSString *const kYYTUserUserName = @"userName";
NSString *const kYYTUserToken = @"token";
NSString *const kYYTUserCreateTime = @"createTime";


@interface YYTUser ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation YYTUser

@synthesize status = _status;
@synthesize password = _password;
@synthesize lastLoginTime = _lastLoginTime;
@synthesize tUserIdentifier = _tUserIdentifier;
@synthesize userName = _userName;
@synthesize token = _token;
@synthesize createTime = _createTime;


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
            self.status = [[self objectOrNilForKey:kYYTUserStatus fromDictionary:dict] doubleValue];
            self.password = [self objectOrNilForKey:kYYTUserPassword fromDictionary:dict];
            self.lastLoginTime = [[self objectOrNilForKey:kYYTUserLastLoginTime fromDictionary:dict] doubleValue];
            self.tUserIdentifier = [[self objectOrNilForKey:kYYTUserId fromDictionary:dict] doubleValue];
            self.userName = [self objectOrNilForKey:kYYTUserUserName fromDictionary:dict];
            self.token = [self objectOrNilForKey:kYYTUserToken fromDictionary:dict];
            self.createTime = [[self objectOrNilForKey:kYYTUserCreateTime fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kYYTUserStatus];
    [mutableDict setValue:self.password forKey:kYYTUserPassword];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lastLoginTime] forKey:kYYTUserLastLoginTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tUserIdentifier] forKey:kYYTUserId];
    [mutableDict setValue:self.userName forKey:kYYTUserUserName];
    [mutableDict setValue:self.token forKey:kYYTUserToken];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createTime] forKey:kYYTUserCreateTime];

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

    self.status = [aDecoder decodeDoubleForKey:kYYTUserStatus];
    self.password = [aDecoder decodeObjectForKey:kYYTUserPassword];
    self.lastLoginTime = [aDecoder decodeDoubleForKey:kYYTUserLastLoginTime];
    self.tUserIdentifier = [aDecoder decodeDoubleForKey:kYYTUserId];
    self.userName = [aDecoder decodeObjectForKey:kYYTUserUserName];
    self.token = [aDecoder decodeObjectForKey:kYYTUserToken];
    self.createTime = [aDecoder decodeDoubleForKey:kYYTUserCreateTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_status forKey:kYYTUserStatus];
    [aCoder encodeObject:_password forKey:kYYTUserPassword];
    [aCoder encodeDouble:_lastLoginTime forKey:kYYTUserLastLoginTime];
    [aCoder encodeDouble:_tUserIdentifier forKey:kYYTUserId];
    [aCoder encodeObject:_userName forKey:kYYTUserUserName];
    [aCoder encodeObject:_token forKey:kYYTUserToken];
    [aCoder encodeDouble:_createTime forKey:kYYTUserCreateTime];
}

- (id)copyWithZone:(NSZone *)zone
{
    YYTUser *copy = [[YYTUser alloc] init];
    
    if (copy) {

        copy.status = self.status;
        copy.password = [self.password copyWithZone:zone];
        copy.lastLoginTime = self.lastLoginTime;
        copy.tUserIdentifier = self.tUserIdentifier;
        copy.userName = [self.userName copyWithZone:zone];
        copy.token = [self.token copyWithZone:zone];
        copy.createTime = self.createTime;
    }
    
    return copy;
}


@end
