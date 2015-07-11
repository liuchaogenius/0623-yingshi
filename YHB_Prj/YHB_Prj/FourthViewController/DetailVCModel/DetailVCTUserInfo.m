//
//  DetailVCTUserInfo.m
//
//  Created by  C陈政旭 on 15/7/11
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "DetailVCTUserInfo.h"


NSString *const kDetailVCTUserInfoIndustry = @"industry";
NSString *const kDetailVCTUserInfoSex = @"sex";
NSString *const kDetailVCTUserInfoMobile = @"mobile";
NSString *const kDetailVCTUserInfoArea = @"area";
NSString *const kDetailVCTUserInfoUserId = @"userId";
NSString *const kDetailVCTUserInfoCreateTime = @"createTime";
NSString *const kDetailVCTUserInfoBackground = @"background";
NSString *const kDetailVCTUserInfoNickName = @"nickName";
NSString *const kDetailVCTUserInfoPraise = @"praise";
NSString *const kDetailVCTUserInfoModifyTime = @"modifyTime";
NSString *const kDetailVCTUserInfoFriends = @"friends";
NSString *const kDetailVCTUserInfoEmail = @"email";
NSString *const kDetailVCTUserInfoFaceImg = @"faceImg";
NSString *const kDetailVCTUserInfoIntroduce = @"introduce";


@interface DetailVCTUserInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DetailVCTUserInfo

@synthesize industry = _industry;
@synthesize sex = _sex;
@synthesize mobile = _mobile;
@synthesize area = _area;
@synthesize userId = _userId;
@synthesize createTime = _createTime;
@synthesize background = _background;
@synthesize nickName = _nickName;
@synthesize praise = _praise;
@synthesize modifyTime = _modifyTime;
@synthesize friends = _friends;
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
            self.industry = [[self objectOrNilForKey:kDetailVCTUserInfoIndustry fromDictionary:dict] doubleValue];
            self.sex = [[self objectOrNilForKey:kDetailVCTUserInfoSex fromDictionary:dict] doubleValue];
            self.mobile = [self objectOrNilForKey:kDetailVCTUserInfoMobile fromDictionary:dict];
            self.area = [[self objectOrNilForKey:kDetailVCTUserInfoArea fromDictionary:dict] doubleValue];
            self.userId = [[self objectOrNilForKey:kDetailVCTUserInfoUserId fromDictionary:dict] doubleValue];
            self.createTime = [[self objectOrNilForKey:kDetailVCTUserInfoCreateTime fromDictionary:dict] doubleValue];
            self.background = [self objectOrNilForKey:kDetailVCTUserInfoBackground fromDictionary:dict];
            self.nickName = [self objectOrNilForKey:kDetailVCTUserInfoNickName fromDictionary:dict];
            self.praise = [[self objectOrNilForKey:kDetailVCTUserInfoPraise fromDictionary:dict] doubleValue];
            self.modifyTime = [[self objectOrNilForKey:kDetailVCTUserInfoModifyTime fromDictionary:dict] doubleValue];
            self.friends = [[self objectOrNilForKey:kDetailVCTUserInfoFriends fromDictionary:dict] doubleValue];
            self.email = [self objectOrNilForKey:kDetailVCTUserInfoEmail fromDictionary:dict];
            self.faceImg = [self objectOrNilForKey:kDetailVCTUserInfoFaceImg fromDictionary:dict];
            self.introduce = [self objectOrNilForKey:kDetailVCTUserInfoIntroduce fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.industry] forKey:kDetailVCTUserInfoIndustry];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sex] forKey:kDetailVCTUserInfoSex];
    [mutableDict setValue:self.mobile forKey:kDetailVCTUserInfoMobile];
    [mutableDict setValue:[NSNumber numberWithDouble:self.area] forKey:kDetailVCTUserInfoArea];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userId] forKey:kDetailVCTUserInfoUserId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createTime] forKey:kDetailVCTUserInfoCreateTime];
    [mutableDict setValue:self.background forKey:kDetailVCTUserInfoBackground];
    [mutableDict setValue:self.nickName forKey:kDetailVCTUserInfoNickName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.praise] forKey:kDetailVCTUserInfoPraise];
    [mutableDict setValue:[NSNumber numberWithDouble:self.modifyTime] forKey:kDetailVCTUserInfoModifyTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.friends] forKey:kDetailVCTUserInfoFriends];
    [mutableDict setValue:self.email forKey:kDetailVCTUserInfoEmail];
    [mutableDict setValue:self.faceImg forKey:kDetailVCTUserInfoFaceImg];
    [mutableDict setValue:self.introduce forKey:kDetailVCTUserInfoIntroduce];

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

    self.industry = [aDecoder decodeDoubleForKey:kDetailVCTUserInfoIndustry];
    self.sex = [aDecoder decodeDoubleForKey:kDetailVCTUserInfoSex];
    self.mobile = [aDecoder decodeObjectForKey:kDetailVCTUserInfoMobile];
    self.area = [aDecoder decodeDoubleForKey:kDetailVCTUserInfoArea];
    self.userId = [aDecoder decodeDoubleForKey:kDetailVCTUserInfoUserId];
    self.createTime = [aDecoder decodeDoubleForKey:kDetailVCTUserInfoCreateTime];
    self.background = [aDecoder decodeObjectForKey:kDetailVCTUserInfoBackground];
    self.nickName = [aDecoder decodeObjectForKey:kDetailVCTUserInfoNickName];
    self.praise = [aDecoder decodeDoubleForKey:kDetailVCTUserInfoPraise];
    self.modifyTime = [aDecoder decodeDoubleForKey:kDetailVCTUserInfoModifyTime];
    self.friends = [aDecoder decodeDoubleForKey:kDetailVCTUserInfoFriends];
    self.email = [aDecoder decodeObjectForKey:kDetailVCTUserInfoEmail];
    self.faceImg = [aDecoder decodeObjectForKey:kDetailVCTUserInfoFaceImg];
    self.introduce = [aDecoder decodeObjectForKey:kDetailVCTUserInfoIntroduce];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_industry forKey:kDetailVCTUserInfoIndustry];
    [aCoder encodeDouble:_sex forKey:kDetailVCTUserInfoSex];
    [aCoder encodeObject:_mobile forKey:kDetailVCTUserInfoMobile];
    [aCoder encodeDouble:_area forKey:kDetailVCTUserInfoArea];
    [aCoder encodeDouble:_userId forKey:kDetailVCTUserInfoUserId];
    [aCoder encodeDouble:_createTime forKey:kDetailVCTUserInfoCreateTime];
    [aCoder encodeObject:_background forKey:kDetailVCTUserInfoBackground];
    [aCoder encodeObject:_nickName forKey:kDetailVCTUserInfoNickName];
    [aCoder encodeDouble:_praise forKey:kDetailVCTUserInfoPraise];
    [aCoder encodeDouble:_modifyTime forKey:kDetailVCTUserInfoModifyTime];
    [aCoder encodeDouble:_friends forKey:kDetailVCTUserInfoFriends];
    [aCoder encodeObject:_email forKey:kDetailVCTUserInfoEmail];
    [aCoder encodeObject:_faceImg forKey:kDetailVCTUserInfoFaceImg];
    [aCoder encodeObject:_introduce forKey:kDetailVCTUserInfoIntroduce];
}

- (id)copyWithZone:(NSZone *)zone
{
    DetailVCTUserInfo *copy = [[DetailVCTUserInfo alloc] init];
    
    if (copy) {

        copy.industry = self.industry;
        copy.sex = self.sex;
        copy.mobile = [self.mobile copyWithZone:zone];
        copy.area = self.area;
        copy.userId = self.userId;
        copy.createTime = self.createTime;
        copy.background = [self.background copyWithZone:zone];
        copy.nickName = [self.nickName copyWithZone:zone];
        copy.praise = self.praise;
        copy.modifyTime = self.modifyTime;
        copy.friends = self.friends;
        copy.email = [self.email copyWithZone:zone];
        copy.faceImg = [self.faceImg copyWithZone:zone];
        copy.introduce = [self.introduce copyWithZone:zone];
    }
    
    return copy;
}


@end
