//
//  SingleUserFeedsTPostUserFeedsUserVO.m
//
//  Created by  C陈政旭 on 15/7/7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "SingleUserFeedsTPostUserFeedsUserVO.h"
#import "SingleUserFeedsTUser.h"
#import "SingleUserFeedsTUserInfo.h"


NSString *const kSingleUserFeedsTPostUserFeedsUserVOTUser = @"tUser";
NSString *const kSingleUserFeedsTPostUserFeedsUserVOTUserInfo = @"tUserInfo";


@interface SingleUserFeedsTPostUserFeedsUserVO ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SingleUserFeedsTPostUserFeedsUserVO

@synthesize tUser = _tUser;
@synthesize tUserInfo = _tUserInfo;


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
            self.tUser = [SingleUserFeedsTUser modelObjectWithDictionary:[dict objectForKey:kSingleUserFeedsTPostUserFeedsUserVOTUser]];
            self.tUserInfo = [SingleUserFeedsTUserInfo modelObjectWithDictionary:[dict objectForKey:kSingleUserFeedsTPostUserFeedsUserVOTUserInfo]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.tUser dictionaryRepresentation] forKey:kSingleUserFeedsTPostUserFeedsUserVOTUser];
    [mutableDict setValue:[self.tUserInfo dictionaryRepresentation] forKey:kSingleUserFeedsTPostUserFeedsUserVOTUserInfo];

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

    self.tUser = [aDecoder decodeObjectForKey:kSingleUserFeedsTPostUserFeedsUserVOTUser];
    self.tUserInfo = [aDecoder decodeObjectForKey:kSingleUserFeedsTPostUserFeedsUserVOTUserInfo];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_tUser forKey:kSingleUserFeedsTPostUserFeedsUserVOTUser];
    [aCoder encodeObject:_tUserInfo forKey:kSingleUserFeedsTPostUserFeedsUserVOTUserInfo];
}

- (id)copyWithZone:(NSZone *)zone
{
    SingleUserFeedsTPostUserFeedsUserVO *copy = [[SingleUserFeedsTPostUserFeedsUserVO alloc] init];
    
    if (copy) {

        copy.tUser = [self.tUser copyWithZone:zone];
        copy.tUserInfo = [self.tUserInfo copyWithZone:zone];
    }
    
    return copy;
}


@end
