//
//  SingleUserFeedsTUserFeedsVO.m
//
//  Created by  C陈政旭 on 15/7/7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "SingleUserFeedsTUserFeedsVO.h"
#import "SingleUserFeedsTCommentAndUserVOList.h"
#import "SingleUserFeedsTPostUserFeedsUserVO.h"
#import "SingleUserFeedsTUserFeeds.h"


NSString *const kSingleUserFeedsTUserFeedsVOTCommentAndUserVOList = @"tCommentAndUserVOList";
NSString *const kSingleUserFeedsTUserFeedsVOTPostUserFeedsUserVO = @"tPostUserFeedsUserVO";
NSString *const kSingleUserFeedsTUserFeedsVOTUserFeeds = @"tUserFeeds";


@interface SingleUserFeedsTUserFeedsVO ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SingleUserFeedsTUserFeedsVO

@synthesize tCommentAndUserVOList = _tCommentAndUserVOList;
@synthesize tPostUserFeedsUserVO = _tPostUserFeedsUserVO;
@synthesize tUserFeeds = _tUserFeeds;


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
    NSObject *receivedSingleUserFeedsTCommentAndUserVOList = [dict objectForKey:kSingleUserFeedsTUserFeedsVOTCommentAndUserVOList];
    NSMutableArray *parsedSingleUserFeedsTCommentAndUserVOList = [NSMutableArray array];
    if ([receivedSingleUserFeedsTCommentAndUserVOList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedSingleUserFeedsTCommentAndUserVOList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedSingleUserFeedsTCommentAndUserVOList addObject:[SingleUserFeedsTCommentAndUserVOList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedSingleUserFeedsTCommentAndUserVOList isKindOfClass:[NSDictionary class]]) {
       [parsedSingleUserFeedsTCommentAndUserVOList addObject:[SingleUserFeedsTCommentAndUserVOList modelObjectWithDictionary:(NSDictionary *)receivedSingleUserFeedsTCommentAndUserVOList]];
    }

    self.tCommentAndUserVOList = [NSArray arrayWithArray:parsedSingleUserFeedsTCommentAndUserVOList];
            self.tPostUserFeedsUserVO = [SingleUserFeedsTPostUserFeedsUserVO modelObjectWithDictionary:[dict objectForKey:kSingleUserFeedsTUserFeedsVOTPostUserFeedsUserVO]];
            self.tUserFeeds = [SingleUserFeedsTUserFeeds modelObjectWithDictionary:[dict objectForKey:kSingleUserFeedsTUserFeedsVOTUserFeeds]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForTCommentAndUserVOList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.tCommentAndUserVOList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForTCommentAndUserVOList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForTCommentAndUserVOList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTCommentAndUserVOList] forKey:kSingleUserFeedsTUserFeedsVOTCommentAndUserVOList];
    [mutableDict setValue:[self.tPostUserFeedsUserVO dictionaryRepresentation] forKey:kSingleUserFeedsTUserFeedsVOTPostUserFeedsUserVO];
    [mutableDict setValue:[self.tUserFeeds dictionaryRepresentation] forKey:kSingleUserFeedsTUserFeedsVOTUserFeeds];

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

    self.tCommentAndUserVOList = [aDecoder decodeObjectForKey:kSingleUserFeedsTUserFeedsVOTCommentAndUserVOList];
    self.tPostUserFeedsUserVO = [aDecoder decodeObjectForKey:kSingleUserFeedsTUserFeedsVOTPostUserFeedsUserVO];
    self.tUserFeeds = [aDecoder decodeObjectForKey:kSingleUserFeedsTUserFeedsVOTUserFeeds];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_tCommentAndUserVOList forKey:kSingleUserFeedsTUserFeedsVOTCommentAndUserVOList];
    [aCoder encodeObject:_tPostUserFeedsUserVO forKey:kSingleUserFeedsTUserFeedsVOTPostUserFeedsUserVO];
    [aCoder encodeObject:_tUserFeeds forKey:kSingleUserFeedsTUserFeedsVOTUserFeeds];
}

- (id)copyWithZone:(NSZone *)zone
{
    SingleUserFeedsTUserFeedsVO *copy = [[SingleUserFeedsTUserFeedsVO alloc] init];
    
    if (copy) {

        copy.tCommentAndUserVOList = [self.tCommentAndUserVOList copyWithZone:zone];
        copy.tPostUserFeedsUserVO = [self.tPostUserFeedsUserVO copyWithZone:zone];
        copy.tUserFeeds = [self.tUserFeeds copyWithZone:zone];
    }
    
    return copy;
}


@end
