//
//  SingleUserFeedsTCommentAndUserVOList.m
//
//  Created by  C陈政旭 on 15/7/7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "SingleUserFeedsTCommentAndUserVOList.h"
#import "SingleUserFeedsTComment.h"
#import "SingleUserFeedsTCommentPostUserVO.h"
#import "SingleUserFeedsTReviceUserVO.h"


NSString *const kSingleUserFeedsTCommentAndUserVOListTComment = @"tComment";
NSString *const kSingleUserFeedsTCommentAndUserVOListTCommentPostUserVO = @"tCommentPostUserVO";
NSString *const kSingleUserFeedsTCommentAndUserVOListTReviceUserVO = @"tReviceUserVO";


@interface SingleUserFeedsTCommentAndUserVOList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SingleUserFeedsTCommentAndUserVOList

@synthesize tComment = _tComment;
@synthesize tCommentPostUserVO = _tCommentPostUserVO;
@synthesize tReviceUserVO = _tReviceUserVO;


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
            self.tComment = [SingleUserFeedsTComment modelObjectWithDictionary:[dict objectForKey:kSingleUserFeedsTCommentAndUserVOListTComment]];
            self.tCommentPostUserVO = [SingleUserFeedsTCommentPostUserVO modelObjectWithDictionary:[dict objectForKey:kSingleUserFeedsTCommentAndUserVOListTCommentPostUserVO]];
            self.tReviceUserVO = [SingleUserFeedsTReviceUserVO modelObjectWithDictionary:[dict objectForKey:kSingleUserFeedsTCommentAndUserVOListTReviceUserVO]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.tComment dictionaryRepresentation] forKey:kSingleUserFeedsTCommentAndUserVOListTComment];
    [mutableDict setValue:[self.tCommentPostUserVO dictionaryRepresentation] forKey:kSingleUserFeedsTCommentAndUserVOListTCommentPostUserVO];
    [mutableDict setValue:[self.tReviceUserVO dictionaryRepresentation] forKey:kSingleUserFeedsTCommentAndUserVOListTReviceUserVO];

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

    self.tComment = [aDecoder decodeObjectForKey:kSingleUserFeedsTCommentAndUserVOListTComment];
    self.tCommentPostUserVO = [aDecoder decodeObjectForKey:kSingleUserFeedsTCommentAndUserVOListTCommentPostUserVO];
    self.tReviceUserVO = [aDecoder decodeObjectForKey:kSingleUserFeedsTCommentAndUserVOListTReviceUserVO];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_tComment forKey:kSingleUserFeedsTCommentAndUserVOListTComment];
    [aCoder encodeObject:_tCommentPostUserVO forKey:kSingleUserFeedsTCommentAndUserVOListTCommentPostUserVO];
    [aCoder encodeObject:_tReviceUserVO forKey:kSingleUserFeedsTCommentAndUserVOListTReviceUserVO];
}

- (id)copyWithZone:(NSZone *)zone
{
    SingleUserFeedsTCommentAndUserVOList *copy = [[SingleUserFeedsTCommentAndUserVOList alloc] init];
    
    if (copy) {

        copy.tComment = [self.tComment copyWithZone:zone];
        copy.tCommentPostUserVO = [self.tCommentPostUserVO copyWithZone:zone];
        copy.tReviceUserVO = [self.tReviceUserVO copyWithZone:zone];
    }
    
    return copy;
}


@end
