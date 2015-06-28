//
//  FirstTUser.m
//
//  Created by  C陈政旭 on 15/6/28
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FirstTUser.h"


NSString *const kFirstTUserPassword = @"password";
NSString *const kFirstTUserId = @"id";
NSString *const kFirstTUserCreateTime = @"createTime";
NSString *const kFirstTUserLastLoginTime = @"lastLoginTime";
NSString *const kFirstTUserStatus = @"status";
NSString *const kFirstTUserUserName = @"userName";


@interface FirstTUser ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation FirstTUser

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
            self.password = [self objectOrNilForKey:kFirstTUserPassword fromDictionary:dict];
            self.tUserIdentifier = [[self objectOrNilForKey:kFirstTUserId fromDictionary:dict] doubleValue];
            self.createTime = [[self objectOrNilForKey:kFirstTUserCreateTime fromDictionary:dict] doubleValue];
            self.lastLoginTime = [[self objectOrNilForKey:kFirstTUserLastLoginTime fromDictionary:dict] doubleValue];
            self.status = [[self objectOrNilForKey:kFirstTUserStatus fromDictionary:dict] doubleValue];
            self.userName = [self objectOrNilForKey:kFirstTUserUserName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.password forKey:kFirstTUserPassword];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tUserIdentifier] forKey:kFirstTUserId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createTime] forKey:kFirstTUserCreateTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lastLoginTime] forKey:kFirstTUserLastLoginTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kFirstTUserStatus];
    [mutableDict setValue:self.userName forKey:kFirstTUserUserName];

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

    self.password = [aDecoder decodeObjectForKey:kFirstTUserPassword];
    self.tUserIdentifier = [aDecoder decodeDoubleForKey:kFirstTUserId];
    self.createTime = [aDecoder decodeDoubleForKey:kFirstTUserCreateTime];
    self.lastLoginTime = [aDecoder decodeDoubleForKey:kFirstTUserLastLoginTime];
    self.status = [aDecoder decodeDoubleForKey:kFirstTUserStatus];
    self.userName = [aDecoder decodeObjectForKey:kFirstTUserUserName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_password forKey:kFirstTUserPassword];
    [aCoder encodeDouble:_tUserIdentifier forKey:kFirstTUserId];
    [aCoder encodeDouble:_createTime forKey:kFirstTUserCreateTime];
    [aCoder encodeDouble:_lastLoginTime forKey:kFirstTUserLastLoginTime];
    [aCoder encodeDouble:_status forKey:kFirstTUserStatus];
    [aCoder encodeObject:_userName forKey:kFirstTUserUserName];
}

- (id)copyWithZone:(NSZone *)zone
{
    FirstTUser *copy = [[FirstTUser alloc] init];
    
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
