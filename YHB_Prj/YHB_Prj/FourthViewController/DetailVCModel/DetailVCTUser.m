//
//  DetailVCTUser.m
//
//  Created by  C陈政旭 on 15/7/11
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "DetailVCTUser.h"


NSString *const kDetailVCTUserStatus = @"status";
NSString *const kDetailVCTUserPassword = @"password";
NSString *const kDetailVCTUserLastLoginTime = @"lastLoginTime";
NSString *const kDetailVCTUserId = @"id";
NSString *const kDetailVCTUserUserName = @"userName";
NSString *const kDetailVCTUserCreateTime = @"createTime";
NSString *const kDetailVCTUserInviteCode = @"inviteCode";


@interface DetailVCTUser ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DetailVCTUser

@synthesize status = _status;
@synthesize password = _password;
@synthesize lastLoginTime = _lastLoginTime;
@synthesize tUserIdentifier = _tUserIdentifier;
@synthesize userName = _userName;
@synthesize createTime = _createTime;
@synthesize inviteCode = _inviteCode;


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
            self.status = [[self objectOrNilForKey:kDetailVCTUserStatus fromDictionary:dict] doubleValue];
            self.password = [self objectOrNilForKey:kDetailVCTUserPassword fromDictionary:dict];
            self.lastLoginTime = [[self objectOrNilForKey:kDetailVCTUserLastLoginTime fromDictionary:dict] doubleValue];
            self.tUserIdentifier = [[self objectOrNilForKey:kDetailVCTUserId fromDictionary:dict] doubleValue];
            self.userName = [self objectOrNilForKey:kDetailVCTUserUserName fromDictionary:dict];
            self.createTime = [[self objectOrNilForKey:kDetailVCTUserCreateTime fromDictionary:dict] doubleValue];
            self.inviteCode = [self objectOrNilForKey:kDetailVCTUserInviteCode fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kDetailVCTUserStatus];
    [mutableDict setValue:self.password forKey:kDetailVCTUserPassword];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lastLoginTime] forKey:kDetailVCTUserLastLoginTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tUserIdentifier] forKey:kDetailVCTUserId];
    [mutableDict setValue:self.userName forKey:kDetailVCTUserUserName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createTime] forKey:kDetailVCTUserCreateTime];
    [mutableDict setValue:self.inviteCode forKey:kDetailVCTUserInviteCode];

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

    self.status = [aDecoder decodeDoubleForKey:kDetailVCTUserStatus];
    self.password = [aDecoder decodeObjectForKey:kDetailVCTUserPassword];
    self.lastLoginTime = [aDecoder decodeDoubleForKey:kDetailVCTUserLastLoginTime];
    self.tUserIdentifier = [aDecoder decodeDoubleForKey:kDetailVCTUserId];
    self.userName = [aDecoder decodeObjectForKey:kDetailVCTUserUserName];
    self.createTime = [aDecoder decodeDoubleForKey:kDetailVCTUserCreateTime];
    self.inviteCode = [aDecoder decodeObjectForKey:kDetailVCTUserInviteCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_status forKey:kDetailVCTUserStatus];
    [aCoder encodeObject:_password forKey:kDetailVCTUserPassword];
    [aCoder encodeDouble:_lastLoginTime forKey:kDetailVCTUserLastLoginTime];
    [aCoder encodeDouble:_tUserIdentifier forKey:kDetailVCTUserId];
    [aCoder encodeObject:_userName forKey:kDetailVCTUserUserName];
    [aCoder encodeDouble:_createTime forKey:kDetailVCTUserCreateTime];
    [aCoder encodeObject:_inviteCode forKey:kDetailVCTUserInviteCode];
}

- (id)copyWithZone:(NSZone *)zone
{
    DetailVCTUser *copy = [[DetailVCTUser alloc] init];
    
    if (copy) {

        copy.status = self.status;
        copy.password = [self.password copyWithZone:zone];
        copy.lastLoginTime = self.lastLoginTime;
        copy.tUserIdentifier = self.tUserIdentifier;
        copy.userName = [self.userName copyWithZone:zone];
        copy.createTime = self.createTime;
        copy.inviteCode = [self.inviteCode copyWithZone:zone];
    }
    
    return copy;
}


@end
