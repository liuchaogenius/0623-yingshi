//
//  ResultTUserInfo.m
//
//  Created by  C陈政旭 on 15/7/6
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ResultTUserInfo.h"


NSString *const kResultTUserInfoDescription = @"description";
NSString *const kResultTUserInfoIndustry = @"industry";
NSString *const kResultTUserInfoSex = @"sex";
NSString *const kResultTUserInfoMobile = @"mobile";
NSString *const kResultTUserInfoArea = @"area";
NSString *const kResultTUserInfoTitle = @"title";
NSString *const kResultTUserInfoUserId = @"userId";
NSString *const kResultTUserInfoCreateTime = @"createTime";
NSString *const kResultTUserInfoBackground = @"background";
NSString *const kResultTUserInfoNickName = @"nickName";
NSString *const kResultTUserInfoPraise = @"praise";
NSString *const kResultTUserInfoFriends = @"friends";
NSString *const kResultTUserInfoModifyTime = @"modifyTime";
NSString *const kResultTUserInfoEmail = @"email";
NSString *const kResultTUserInfoFaceImg = @"faceImg";


@interface ResultTUserInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ResultTUserInfo

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
            self.tUserInfoDescription = [self objectOrNilForKey:kResultTUserInfoDescription fromDictionary:dict];
            self.industry = [[self objectOrNilForKey:kResultTUserInfoIndustry fromDictionary:dict] doubleValue];
            self.sex = [[self objectOrNilForKey:kResultTUserInfoSex fromDictionary:dict] doubleValue];
            self.mobile = [self objectOrNilForKey:kResultTUserInfoMobile fromDictionary:dict];
            self.area = [[self objectOrNilForKey:kResultTUserInfoArea fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kResultTUserInfoTitle fromDictionary:dict];
            self.userId = [[self objectOrNilForKey:kResultTUserInfoUserId fromDictionary:dict] doubleValue];
            self.createTime = [[self objectOrNilForKey:kResultTUserInfoCreateTime fromDictionary:dict] doubleValue];
            self.background = [self objectOrNilForKey:kResultTUserInfoBackground fromDictionary:dict];
            self.nickName = [self objectOrNilForKey:kResultTUserInfoNickName fromDictionary:dict];
            self.praise = [[self objectOrNilForKey:kResultTUserInfoPraise fromDictionary:dict] doubleValue];
            self.friends = [[self objectOrNilForKey:kResultTUserInfoFriends fromDictionary:dict] doubleValue];
            self.modifyTime = [[self objectOrNilForKey:kResultTUserInfoModifyTime fromDictionary:dict] doubleValue];
            self.email = [self objectOrNilForKey:kResultTUserInfoEmail fromDictionary:dict];
            self.faceImg = [self objectOrNilForKey:kResultTUserInfoFaceImg fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.tUserInfoDescription forKey:kResultTUserInfoDescription];
    [mutableDict setValue:[NSNumber numberWithDouble:self.industry] forKey:kResultTUserInfoIndustry];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sex] forKey:kResultTUserInfoSex];
    [mutableDict setValue:self.mobile forKey:kResultTUserInfoMobile];
    [mutableDict setValue:[NSNumber numberWithDouble:self.area] forKey:kResultTUserInfoArea];
    [mutableDict setValue:self.title forKey:kResultTUserInfoTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userId] forKey:kResultTUserInfoUserId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createTime] forKey:kResultTUserInfoCreateTime];
    [mutableDict setValue:self.background forKey:kResultTUserInfoBackground];
    [mutableDict setValue:self.nickName forKey:kResultTUserInfoNickName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.praise] forKey:kResultTUserInfoPraise];
    [mutableDict setValue:[NSNumber numberWithDouble:self.friends] forKey:kResultTUserInfoFriends];
    [mutableDict setValue:[NSNumber numberWithDouble:self.modifyTime] forKey:kResultTUserInfoModifyTime];
    [mutableDict setValue:self.email forKey:kResultTUserInfoEmail];
    [mutableDict setValue:self.faceImg forKey:kResultTUserInfoFaceImg];

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

    self.tUserInfoDescription = [aDecoder decodeObjectForKey:kResultTUserInfoDescription];
    self.industry = [aDecoder decodeDoubleForKey:kResultTUserInfoIndustry];
    self.sex = [aDecoder decodeDoubleForKey:kResultTUserInfoSex];
    self.mobile = [aDecoder decodeObjectForKey:kResultTUserInfoMobile];
    self.area = [aDecoder decodeDoubleForKey:kResultTUserInfoArea];
    self.title = [aDecoder decodeObjectForKey:kResultTUserInfoTitle];
    self.userId = [aDecoder decodeDoubleForKey:kResultTUserInfoUserId];
    self.createTime = [aDecoder decodeDoubleForKey:kResultTUserInfoCreateTime];
    self.background = [aDecoder decodeObjectForKey:kResultTUserInfoBackground];
    self.nickName = [aDecoder decodeObjectForKey:kResultTUserInfoNickName];
    self.praise = [aDecoder decodeDoubleForKey:kResultTUserInfoPraise];
    self.friends = [aDecoder decodeDoubleForKey:kResultTUserInfoFriends];
    self.modifyTime = [aDecoder decodeDoubleForKey:kResultTUserInfoModifyTime];
    self.email = [aDecoder decodeObjectForKey:kResultTUserInfoEmail];
    self.faceImg = [aDecoder decodeObjectForKey:kResultTUserInfoFaceImg];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_tUserInfoDescription forKey:kResultTUserInfoDescription];
    [aCoder encodeDouble:_industry forKey:kResultTUserInfoIndustry];
    [aCoder encodeDouble:_sex forKey:kResultTUserInfoSex];
    [aCoder encodeObject:_mobile forKey:kResultTUserInfoMobile];
    [aCoder encodeDouble:_area forKey:kResultTUserInfoArea];
    [aCoder encodeObject:_title forKey:kResultTUserInfoTitle];
    [aCoder encodeDouble:_userId forKey:kResultTUserInfoUserId];
    [aCoder encodeDouble:_createTime forKey:kResultTUserInfoCreateTime];
    [aCoder encodeObject:_background forKey:kResultTUserInfoBackground];
    [aCoder encodeObject:_nickName forKey:kResultTUserInfoNickName];
    [aCoder encodeDouble:_praise forKey:kResultTUserInfoPraise];
    [aCoder encodeDouble:_friends forKey:kResultTUserInfoFriends];
    [aCoder encodeDouble:_modifyTime forKey:kResultTUserInfoModifyTime];
    [aCoder encodeObject:_email forKey:kResultTUserInfoEmail];
    [aCoder encodeObject:_faceImg forKey:kResultTUserInfoFaceImg];
}

- (id)copyWithZone:(NSZone *)zone
{
    ResultTUserInfo *copy = [[ResultTUserInfo alloc] init];
    
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
