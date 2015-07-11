//
//  YYTUserInfo.m
//
//  Created by  C陈政旭 on 15/7/10
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "YYTUserInfo.h"


NSString *const kYYTUserInfoDescription = @"description";
NSString *const kYYTUserInfoIndustry = @"industry";
NSString *const kYYTUserInfoSex = @"sex";
NSString *const kYYTUserInfoMobile = @"mobile";
NSString *const kYYTUserInfoArea = @"area";
NSString *const kYYTUserInfoTitle = @"title";
NSString *const kYYTUserInfoUserId = @"userId";
NSString *const kYYTUserInfoCreateTime = @"createTime";
NSString *const kYYTUserInfoBackground = @"background";
NSString *const kYYTUserInfoNickName = @"nickName";
NSString *const kYYTUserInfoPraise = @"praise";
NSString *const kYYTUserInfoFriends = @"friends";
NSString *const kYYTUserInfoModifyTime = @"modifyTime";
NSString *const kYYTUserInfoEmail = @"email";
NSString *const kYYTUserInfoFaceImg = @"faceImg";
NSString *const kYYTUserInfoIntroduce = @"introduce";


@interface YYTUserInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation YYTUserInfo

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
@synthesize introduce = _introduce;


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
            self.tUserInfoDescription = [self objectOrNilForKey:kYYTUserInfoDescription fromDictionary:dict];
            self.industry = [[self objectOrNilForKey:kYYTUserInfoIndustry fromDictionary:dict] doubleValue];
            self.sex = [[self objectOrNilForKey:kYYTUserInfoSex fromDictionary:dict] doubleValue];
            self.mobile = [self objectOrNilForKey:kYYTUserInfoMobile fromDictionary:dict];
            self.area = [[self objectOrNilForKey:kYYTUserInfoArea fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kYYTUserInfoTitle fromDictionary:dict];
            self.userId = [[self objectOrNilForKey:kYYTUserInfoUserId fromDictionary:dict] doubleValue];
            self.createTime = [[self objectOrNilForKey:kYYTUserInfoCreateTime fromDictionary:dict] doubleValue];
            self.background = [self objectOrNilForKey:kYYTUserInfoBackground fromDictionary:dict];
            self.nickName = [self objectOrNilForKey:kYYTUserInfoNickName fromDictionary:dict];
            self.praise = [[self objectOrNilForKey:kYYTUserInfoPraise fromDictionary:dict] doubleValue];
            self.friends = [[self objectOrNilForKey:kYYTUserInfoFriends fromDictionary:dict] doubleValue];
            self.modifyTime = [[self objectOrNilForKey:kYYTUserInfoModifyTime fromDictionary:dict] doubleValue];
            self.email = [self objectOrNilForKey:kYYTUserInfoEmail fromDictionary:dict];
            self.faceImg = [self objectOrNilForKey:kYYTUserInfoFaceImg fromDictionary:dict];
            self.introduce = [self objectOrNilForKey:kYYTUserInfoIntroduce fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.tUserInfoDescription forKey:kYYTUserInfoDescription];
    [mutableDict setValue:[NSNumber numberWithDouble:self.industry] forKey:kYYTUserInfoIndustry];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sex] forKey:kYYTUserInfoSex];
    [mutableDict setValue:self.mobile forKey:kYYTUserInfoMobile];
    [mutableDict setValue:[NSNumber numberWithDouble:self.area] forKey:kYYTUserInfoArea];
    [mutableDict setValue:self.title forKey:kYYTUserInfoTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userId] forKey:kYYTUserInfoUserId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createTime] forKey:kYYTUserInfoCreateTime];
    [mutableDict setValue:self.background forKey:kYYTUserInfoBackground];
    [mutableDict setValue:self.nickName forKey:kYYTUserInfoNickName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.praise] forKey:kYYTUserInfoPraise];
    [mutableDict setValue:[NSNumber numberWithDouble:self.friends] forKey:kYYTUserInfoFriends];
    [mutableDict setValue:[NSNumber numberWithDouble:self.modifyTime] forKey:kYYTUserInfoModifyTime];
    [mutableDict setValue:self.email forKey:kYYTUserInfoEmail];
    [mutableDict setValue:self.faceImg forKey:kYYTUserInfoFaceImg];
    [mutableDict setValue:self.introduce forKey:kYYTUserInfoIntroduce];

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

    self.tUserInfoDescription = [aDecoder decodeObjectForKey:kYYTUserInfoDescription];
    self.industry = [aDecoder decodeDoubleForKey:kYYTUserInfoIndustry];
    self.sex = [aDecoder decodeDoubleForKey:kYYTUserInfoSex];
    self.mobile = [aDecoder decodeObjectForKey:kYYTUserInfoMobile];
    self.area = [aDecoder decodeDoubleForKey:kYYTUserInfoArea];
    self.title = [aDecoder decodeObjectForKey:kYYTUserInfoTitle];
    self.userId = [aDecoder decodeDoubleForKey:kYYTUserInfoUserId];
    self.createTime = [aDecoder decodeDoubleForKey:kYYTUserInfoCreateTime];
    self.background = [aDecoder decodeObjectForKey:kYYTUserInfoBackground];
    self.nickName = [aDecoder decodeObjectForKey:kYYTUserInfoNickName];
    self.praise = [aDecoder decodeDoubleForKey:kYYTUserInfoPraise];
    self.friends = [aDecoder decodeDoubleForKey:kYYTUserInfoFriends];
    self.modifyTime = [aDecoder decodeDoubleForKey:kYYTUserInfoModifyTime];
    self.email = [aDecoder decodeObjectForKey:kYYTUserInfoEmail];
    self.faceImg = [aDecoder decodeObjectForKey:kYYTUserInfoFaceImg];
    self.introduce = [aDecoder decodeObjectForKey:kYYTUserInfoIntroduce];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_tUserInfoDescription forKey:kYYTUserInfoDescription];
    [aCoder encodeDouble:_industry forKey:kYYTUserInfoIndustry];
    [aCoder encodeDouble:_sex forKey:kYYTUserInfoSex];
    [aCoder encodeObject:_mobile forKey:kYYTUserInfoMobile];
    [aCoder encodeDouble:_area forKey:kYYTUserInfoArea];
    [aCoder encodeObject:_title forKey:kYYTUserInfoTitle];
    [aCoder encodeDouble:_userId forKey:kYYTUserInfoUserId];
    [aCoder encodeDouble:_createTime forKey:kYYTUserInfoCreateTime];
    [aCoder encodeObject:_background forKey:kYYTUserInfoBackground];
    [aCoder encodeObject:_nickName forKey:kYYTUserInfoNickName];
    [aCoder encodeDouble:_praise forKey:kYYTUserInfoPraise];
    [aCoder encodeDouble:_friends forKey:kYYTUserInfoFriends];
    [aCoder encodeDouble:_modifyTime forKey:kYYTUserInfoModifyTime];
    [aCoder encodeObject:_email forKey:kYYTUserInfoEmail];
    [aCoder encodeObject:_faceImg forKey:kYYTUserInfoFaceImg];
    [aCoder encodeObject:_introduce forKey:kYYTUserInfoIntroduce];
}

- (id)copyWithZone:(NSZone *)zone
{
    YYTUserInfo *copy = [[YYTUserInfo alloc] init];
    
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
        copy.introduce = [self.introduce copyWithZone:zone];
    }
    
    return copy;
}


@end
