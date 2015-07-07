//
//  SingleUserFeedsTUserInfo.m
//
//  Created by  C陈政旭 on 15/7/7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "SingleUserFeedsTUserInfo.h"


NSString *const kSingleUserFeedsTUserInfoDescription = @"description";
NSString *const kSingleUserFeedsTUserInfoIndustry = @"industry";
NSString *const kSingleUserFeedsTUserInfoSex = @"sex";
NSString *const kSingleUserFeedsTUserInfoMobile = @"mobile";
NSString *const kSingleUserFeedsTUserInfoArea = @"area";
NSString *const kSingleUserFeedsTUserInfoTitle = @"title";
NSString *const kSingleUserFeedsTUserInfoUserId = @"userId";
NSString *const kSingleUserFeedsTUserInfoCreateTime = @"createTime";
NSString *const kSingleUserFeedsTUserInfoBackground = @"background";
NSString *const kSingleUserFeedsTUserInfoNickName = @"nickName";
NSString *const kSingleUserFeedsTUserInfoPraise = @"praise";
NSString *const kSingleUserFeedsTUserInfoFriends = @"friends";
NSString *const kSingleUserFeedsTUserInfoModifyTime = @"modifyTime";
NSString *const kSingleUserFeedsTUserInfoEmail = @"email";
NSString *const kSingleUserFeedsTUserInfoFaceImg = @"faceImg";


@interface SingleUserFeedsTUserInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SingleUserFeedsTUserInfo

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
            self.tUserInfoDescription = [self objectOrNilForKey:kSingleUserFeedsTUserInfoDescription fromDictionary:dict];
            self.industry = [[self objectOrNilForKey:kSingleUserFeedsTUserInfoIndustry fromDictionary:dict] doubleValue];
            self.sex = [[self objectOrNilForKey:kSingleUserFeedsTUserInfoSex fromDictionary:dict] doubleValue];
            self.mobile = [self objectOrNilForKey:kSingleUserFeedsTUserInfoMobile fromDictionary:dict];
            self.area = [[self objectOrNilForKey:kSingleUserFeedsTUserInfoArea fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kSingleUserFeedsTUserInfoTitle fromDictionary:dict];
            self.userId = [[self objectOrNilForKey:kSingleUserFeedsTUserInfoUserId fromDictionary:dict] doubleValue];
            self.createTime = [[self objectOrNilForKey:kSingleUserFeedsTUserInfoCreateTime fromDictionary:dict] doubleValue];
            self.background = [self objectOrNilForKey:kSingleUserFeedsTUserInfoBackground fromDictionary:dict];
            self.nickName = [self objectOrNilForKey:kSingleUserFeedsTUserInfoNickName fromDictionary:dict];
            self.praise = [[self objectOrNilForKey:kSingleUserFeedsTUserInfoPraise fromDictionary:dict] doubleValue];
            self.friends = [[self objectOrNilForKey:kSingleUserFeedsTUserInfoFriends fromDictionary:dict] doubleValue];
            self.modifyTime = [[self objectOrNilForKey:kSingleUserFeedsTUserInfoModifyTime fromDictionary:dict] doubleValue];
            self.email = [self objectOrNilForKey:kSingleUserFeedsTUserInfoEmail fromDictionary:dict];
            self.faceImg = [self objectOrNilForKey:kSingleUserFeedsTUserInfoFaceImg fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.tUserInfoDescription forKey:kSingleUserFeedsTUserInfoDescription];
    [mutableDict setValue:[NSNumber numberWithDouble:self.industry] forKey:kSingleUserFeedsTUserInfoIndustry];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sex] forKey:kSingleUserFeedsTUserInfoSex];
    [mutableDict setValue:self.mobile forKey:kSingleUserFeedsTUserInfoMobile];
    [mutableDict setValue:[NSNumber numberWithDouble:self.area] forKey:kSingleUserFeedsTUserInfoArea];
    [mutableDict setValue:self.title forKey:kSingleUserFeedsTUserInfoTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userId] forKey:kSingleUserFeedsTUserInfoUserId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createTime] forKey:kSingleUserFeedsTUserInfoCreateTime];
    [mutableDict setValue:self.background forKey:kSingleUserFeedsTUserInfoBackground];
    [mutableDict setValue:self.nickName forKey:kSingleUserFeedsTUserInfoNickName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.praise] forKey:kSingleUserFeedsTUserInfoPraise];
    [mutableDict setValue:[NSNumber numberWithDouble:self.friends] forKey:kSingleUserFeedsTUserInfoFriends];
    [mutableDict setValue:[NSNumber numberWithDouble:self.modifyTime] forKey:kSingleUserFeedsTUserInfoModifyTime];
    [mutableDict setValue:self.email forKey:kSingleUserFeedsTUserInfoEmail];
    [mutableDict setValue:self.faceImg forKey:kSingleUserFeedsTUserInfoFaceImg];

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

    self.tUserInfoDescription = [aDecoder decodeObjectForKey:kSingleUserFeedsTUserInfoDescription];
    self.industry = [aDecoder decodeDoubleForKey:kSingleUserFeedsTUserInfoIndustry];
    self.sex = [aDecoder decodeDoubleForKey:kSingleUserFeedsTUserInfoSex];
    self.mobile = [aDecoder decodeObjectForKey:kSingleUserFeedsTUserInfoMobile];
    self.area = [aDecoder decodeDoubleForKey:kSingleUserFeedsTUserInfoArea];
    self.title = [aDecoder decodeObjectForKey:kSingleUserFeedsTUserInfoTitle];
    self.userId = [aDecoder decodeDoubleForKey:kSingleUserFeedsTUserInfoUserId];
    self.createTime = [aDecoder decodeDoubleForKey:kSingleUserFeedsTUserInfoCreateTime];
    self.background = [aDecoder decodeObjectForKey:kSingleUserFeedsTUserInfoBackground];
    self.nickName = [aDecoder decodeObjectForKey:kSingleUserFeedsTUserInfoNickName];
    self.praise = [aDecoder decodeDoubleForKey:kSingleUserFeedsTUserInfoPraise];
    self.friends = [aDecoder decodeDoubleForKey:kSingleUserFeedsTUserInfoFriends];
    self.modifyTime = [aDecoder decodeDoubleForKey:kSingleUserFeedsTUserInfoModifyTime];
    self.email = [aDecoder decodeObjectForKey:kSingleUserFeedsTUserInfoEmail];
    self.faceImg = [aDecoder decodeObjectForKey:kSingleUserFeedsTUserInfoFaceImg];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_tUserInfoDescription forKey:kSingleUserFeedsTUserInfoDescription];
    [aCoder encodeDouble:_industry forKey:kSingleUserFeedsTUserInfoIndustry];
    [aCoder encodeDouble:_sex forKey:kSingleUserFeedsTUserInfoSex];
    [aCoder encodeObject:_mobile forKey:kSingleUserFeedsTUserInfoMobile];
    [aCoder encodeDouble:_area forKey:kSingleUserFeedsTUserInfoArea];
    [aCoder encodeObject:_title forKey:kSingleUserFeedsTUserInfoTitle];
    [aCoder encodeDouble:_userId forKey:kSingleUserFeedsTUserInfoUserId];
    [aCoder encodeDouble:_createTime forKey:kSingleUserFeedsTUserInfoCreateTime];
    [aCoder encodeObject:_background forKey:kSingleUserFeedsTUserInfoBackground];
    [aCoder encodeObject:_nickName forKey:kSingleUserFeedsTUserInfoNickName];
    [aCoder encodeDouble:_praise forKey:kSingleUserFeedsTUserInfoPraise];
    [aCoder encodeDouble:_friends forKey:kSingleUserFeedsTUserInfoFriends];
    [aCoder encodeDouble:_modifyTime forKey:kSingleUserFeedsTUserInfoModifyTime];
    [aCoder encodeObject:_email forKey:kSingleUserFeedsTUserInfoEmail];
    [aCoder encodeObject:_faceImg forKey:kSingleUserFeedsTUserInfoFaceImg];
}

- (id)copyWithZone:(NSZone *)zone
{
    SingleUserFeedsTUserInfo *copy = [[SingleUserFeedsTUserInfo alloc] init];
    
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
