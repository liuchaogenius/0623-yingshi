//
//  DetailVCTUserVO.m
//
//  Created by  C陈政旭 on 15/7/11
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "DetailVCTUserVO.h"
#import "DetailVCTUser.h"
#import "DetailVCTUserInfo.h"
#import "DetailVCTUserProfileList.h"


NSString *const kDetailVCTUserVOTUser = @"tUser";
NSString *const kDetailVCTUserVOTUserInfo = @"tUserInfo";
NSString *const kDetailVCTUserVOTUserProfileList = @"tUserProfileList";


@interface DetailVCTUserVO ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DetailVCTUserVO

@synthesize tUser = _tUser;
@synthesize tUserInfo = _tUserInfo;
@synthesize tUserProfileList = _tUserProfileList;


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
            self.tUser = [DetailVCTUser modelObjectWithDictionary:[dict objectForKey:kDetailVCTUserVOTUser]];
            self.tUserInfo = [DetailVCTUserInfo modelObjectWithDictionary:[dict objectForKey:kDetailVCTUserVOTUserInfo]];
    NSObject *receivedDetailVCTUserProfileList = [dict objectForKey:kDetailVCTUserVOTUserProfileList];
    NSMutableArray *parsedDetailVCTUserProfileList = [NSMutableArray array];
    if ([receivedDetailVCTUserProfileList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedDetailVCTUserProfileList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedDetailVCTUserProfileList addObject:[DetailVCTUserProfileList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedDetailVCTUserProfileList isKindOfClass:[NSDictionary class]]) {
       [parsedDetailVCTUserProfileList addObject:[DetailVCTUserProfileList modelObjectWithDictionary:(NSDictionary *)receivedDetailVCTUserProfileList]];
    }

    self.tUserProfileList = [NSArray arrayWithArray:parsedDetailVCTUserProfileList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.tUser dictionaryRepresentation] forKey:kDetailVCTUserVOTUser];
    [mutableDict setValue:[self.tUserInfo dictionaryRepresentation] forKey:kDetailVCTUserVOTUserInfo];
    NSMutableArray *tempArrayForTUserProfileList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.tUserProfileList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForTUserProfileList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForTUserProfileList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTUserProfileList] forKey:kDetailVCTUserVOTUserProfileList];

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

    self.tUser = [aDecoder decodeObjectForKey:kDetailVCTUserVOTUser];
    self.tUserInfo = [aDecoder decodeObjectForKey:kDetailVCTUserVOTUserInfo];
    self.tUserProfileList = [aDecoder decodeObjectForKey:kDetailVCTUserVOTUserProfileList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_tUser forKey:kDetailVCTUserVOTUser];
    [aCoder encodeObject:_tUserInfo forKey:kDetailVCTUserVOTUserInfo];
    [aCoder encodeObject:_tUserProfileList forKey:kDetailVCTUserVOTUserProfileList];
}

- (id)copyWithZone:(NSZone *)zone
{
    DetailVCTUserVO *copy = [[DetailVCTUserVO alloc] init];
    
    if (copy) {

        copy.tUser = [self.tUser copyWithZone:zone];
        copy.tUserInfo = [self.tUserInfo copyWithZone:zone];
        copy.tUserProfileList = [self.tUserProfileList copyWithZone:zone];
    }
    
    return copy;
}


@end
