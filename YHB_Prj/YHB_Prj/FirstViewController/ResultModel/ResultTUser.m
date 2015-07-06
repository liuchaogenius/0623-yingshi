//
//  ResultTUser.m
//
//  Created by  C陈政旭 on 15/7/6
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ResultTUser.h"


NSString *const kResultTUserPassword = @"password";
NSString *const kResultTUserId = @"id";
NSString *const kResultTUserCreateTime = @"createTime";
NSString *const kResultTUserLastLoginTime = @"lastLoginTime";
NSString *const kResultTUserStatus = @"status";
NSString *const kResultTUserUserName = @"userName";


@interface ResultTUser ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ResultTUser

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
            self.password = [self objectOrNilForKey:kResultTUserPassword fromDictionary:dict];
            self.tUserIdentifier = [[self objectOrNilForKey:kResultTUserId fromDictionary:dict] doubleValue];
            self.createTime = [[self objectOrNilForKey:kResultTUserCreateTime fromDictionary:dict] doubleValue];
            self.lastLoginTime = [[self objectOrNilForKey:kResultTUserLastLoginTime fromDictionary:dict] doubleValue];
            self.status = [[self objectOrNilForKey:kResultTUserStatus fromDictionary:dict] doubleValue];
            self.userName = [self objectOrNilForKey:kResultTUserUserName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.password forKey:kResultTUserPassword];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tUserIdentifier] forKey:kResultTUserId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createTime] forKey:kResultTUserCreateTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lastLoginTime] forKey:kResultTUserLastLoginTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kResultTUserStatus];
    [mutableDict setValue:self.userName forKey:kResultTUserUserName];

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

    self.password = [aDecoder decodeObjectForKey:kResultTUserPassword];
    self.tUserIdentifier = [aDecoder decodeDoubleForKey:kResultTUserId];
    self.createTime = [aDecoder decodeDoubleForKey:kResultTUserCreateTime];
    self.lastLoginTime = [aDecoder decodeDoubleForKey:kResultTUserLastLoginTime];
    self.status = [aDecoder decodeDoubleForKey:kResultTUserStatus];
    self.userName = [aDecoder decodeObjectForKey:kResultTUserUserName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_password forKey:kResultTUserPassword];
    [aCoder encodeDouble:_tUserIdentifier forKey:kResultTUserId];
    [aCoder encodeDouble:_createTime forKey:kResultTUserCreateTime];
    [aCoder encodeDouble:_lastLoginTime forKey:kResultTUserLastLoginTime];
    [aCoder encodeDouble:_status forKey:kResultTUserStatus];
    [aCoder encodeObject:_userName forKey:kResultTUserUserName];
}

- (id)copyWithZone:(NSZone *)zone
{
    ResultTUser *copy = [[ResultTUser alloc] init];
    
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
