//
//  FirstTUserInfo.m
//
//  Created by  C陈政旭 on 15/6/28
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FirstTUserInfo.h"


NSString *const kFirstTUserInfoDescription = @"description";
NSString *const kFirstTUserInfoIndustry = @"industry";
NSString *const kFirstTUserInfoSex = @"sex";
NSString *const kFirstTUserInfoMobile = @"mobile";
NSString *const kFirstTUserInfoArea = @"area";
NSString *const kFirstTUserInfoTitle = @"title";
NSString *const kFirstTUserInfoUserId = @"userId";
NSString *const kFirstTUserInfoCreateTime = @"createTime";
NSString *const kFirstTUserInfoBackground = @"background";
NSString *const kFirstTUserInfoNickName = @"nickName";
NSString *const kFirstTUserInfoPraise = @"praise";
NSString *const kFirstTUserInfoFriends = @"friends";
NSString *const kFirstTUserInfoModifyTime = @"modifyTime";
NSString *const kFirstTUserInfoEmail = @"email";
NSString *const kFirstTUserInfoFaceImg = @"faceImg";


@interface FirstTUserInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation FirstTUserInfo

@synthesize tUserInfoDescription = _tUserInfoDescription;
@synthesize industry = _industry;
@synthesize sex = _sex;
@synthesize mobile = _mobile;
@synthesize area = _area;
@synthesize title = _title;
@synthesize userId = _userId;
@synthesize createTime = _createTime;
@synthesize background = _background;
@synthesize nickName = _nickName;
@synthesize praise = _praise;
@synthesize friends = _friends;
@synthesize modifyTime = _modifyTime;
@synthesize email = _email;
@synthesize faceImg = _faceImg;


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
            self.tUserInfoDescription = [self objectOrNilForKey:kFirstTUserInfoDescription fromDictionary:dict];
            self.industry = [[self objectOrNilForKey:kFirstTUserInfoIndustry fromDictionary:dict] doubleValue];
            self.sex = [[self objectOrNilForKey:kFirstTUserInfoSex fromDictionary:dict] boolValue];
            self.mobile = [self objectOrNilForKey:kFirstTUserInfoMobile fromDictionary:dict];
            self.area = [[self objectOrNilForKey:kFirstTUserInfoArea fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kFirstTUserInfoTitle fromDictionary:dict];
            self.userId = [[self objectOrNilForKey:kFirstTUserInfoUserId fromDictionary:dict] doubleValue];
            self.createTime = [[self objectOrNilForKey:kFirstTUserInfoCreateTime fromDictionary:dict] doubleValue];
            self.background = [self objectOrNilForKey:kFirstTUserInfoBackground fromDictionary:dict];
            self.nickName = [self objectOrNilForKey:kFirstTUserInfoNickName fromDictionary:dict];
            self.praise = [[self objectOrNilForKey:kFirstTUserInfoPraise fromDictionary:dict] doubleValue];
            self.friends = [[self objectOrNilForKey:kFirstTUserInfoFriends fromDictionary:dict] doubleValue];
            self.modifyTime = [[self objectOrNilForKey:kFirstTUserInfoModifyTime fromDictionary:dict] doubleValue];
            self.email = [self objectOrNilForKey:kFirstTUserInfoEmail fromDictionary:dict];
            self.faceImg = [self objectOrNilForKey:kFirstTUserInfoFaceImg fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.tUserInfoDescription forKey:kFirstTUserInfoDescription];
    [mutableDict setValue:[NSNumber numberWithDouble:self.industry] forKey:kFirstTUserInfoIndustry];
    [mutableDict setValue:[NSNumber numberWithBool:self.sex] forKey:kFirstTUserInfoSex];
    [mutableDict setValue:self.mobile forKey:kFirstTUserInfoMobile];
    [mutableDict setValue:[NSNumber numberWithDouble:self.area] forKey:kFirstTUserInfoArea];
    [mutableDict setValue:self.title forKey:kFirstTUserInfoTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userId] forKey:kFirstTUserInfoUserId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createTime] forKey:kFirstTUserInfoCreateTime];
    [mutableDict setValue:self.background forKey:kFirstTUserInfoBackground];
    [mutableDict setValue:self.nickName forKey:kFirstTUserInfoNickName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.praise] forKey:kFirstTUserInfoPraise];
    [mutableDict setValue:[NSNumber numberWithDouble:self.friends] forKey:kFirstTUserInfoFriends];
    [mutableDict setValue:[NSNumber numberWithDouble:self.modifyTime] forKey:kFirstTUserInfoModifyTime];
    [mutableDict setValue:self.email forKey:kFirstTUserInfoEmail];
    [mutableDict setValue:self.faceImg forKey:kFirstTUserInfoFaceImg];

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

    self.tUserInfoDescription = [aDecoder decodeObjectForKey:kFirstTUserInfoDescription];
    self.industry = [aDecoder decodeDoubleForKey:kFirstTUserInfoIndustry];
    self.sex = [aDecoder decodeBoolForKey:kFirstTUserInfoSex];
    self.mobile = [aDecoder decodeObjectForKey:kFirstTUserInfoMobile];
    self.area = [aDecoder decodeDoubleForKey:kFirstTUserInfoArea];
    self.title = [aDecoder decodeObjectForKey:kFirstTUserInfoTitle];
    self.userId = [aDecoder decodeDoubleForKey:kFirstTUserInfoUserId];
    self.createTime = [aDecoder decodeDoubleForKey:kFirstTUserInfoCreateTime];
    self.background = [aDecoder decodeObjectForKey:kFirstTUserInfoBackground];
    self.nickName = [aDecoder decodeObjectForKey:kFirstTUserInfoNickName];
    self.praise = [aDecoder decodeDoubleForKey:kFirstTUserInfoPraise];
    self.friends = [aDecoder decodeDoubleForKey:kFirstTUserInfoFriends];
    self.modifyTime = [aDecoder decodeDoubleForKey:kFirstTUserInfoModifyTime];
    self.email = [aDecoder decodeObjectForKey:kFirstTUserInfoEmail];
    self.faceImg = [aDecoder decodeObjectForKey:kFirstTUserInfoFaceImg];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_tUserInfoDescription forKey:kFirstTUserInfoDescription];
    [aCoder encodeDouble:_industry forKey:kFirstTUserInfoIndustry];
    [aCoder encodeBool:_sex forKey:kFirstTUserInfoSex];
    [aCoder encodeObject:_mobile forKey:kFirstTUserInfoMobile];
    [aCoder encodeDouble:_area forKey:kFirstTUserInfoArea];
    [aCoder encodeObject:_title forKey:kFirstTUserInfoTitle];
    [aCoder encodeDouble:_userId forKey:kFirstTUserInfoUserId];
    [aCoder encodeDouble:_createTime forKey:kFirstTUserInfoCreateTime];
    [aCoder encodeObject:_background forKey:kFirstTUserInfoBackground];
    [aCoder encodeObject:_nickName forKey:kFirstTUserInfoNickName];
    [aCoder encodeDouble:_praise forKey:kFirstTUserInfoPraise];
    [aCoder encodeDouble:_friends forKey:kFirstTUserInfoFriends];
    [aCoder encodeDouble:_modifyTime forKey:kFirstTUserInfoModifyTime];
    [aCoder encodeObject:_email forKey:kFirstTUserInfoEmail];
    [aCoder encodeObject:_faceImg forKey:kFirstTUserInfoFaceImg];
}

- (id)copyWithZone:(NSZone *)zone
{
    FirstTUserInfo *copy = [[FirstTUserInfo alloc] init];
    
    if (copy) {

        copy.tUserInfoDescription = [self.tUserInfoDescription copyWithZone:zone];
        copy.industry = self.industry;
        copy.sex = self.sex;
        copy.mobile = [self.mobile copyWithZone:zone];
        copy.area = self.area;
        copy.title = [self.title copyWithZone:zone];
        copy.userId = self.userId;
        copy.createTime = self.createTime;
        copy.background = [self.background copyWithZone:zone];
        copy.nickName = [self.nickName copyWithZone:zone];
        copy.praise = self.praise;
        copy.friends = self.friends;
        copy.modifyTime = self.modifyTime;
        copy.email = [self.email copyWithZone:zone];
        copy.faceImg = [self.faceImg copyWithZone:zone];
    }
    
    return copy;
}


@end
