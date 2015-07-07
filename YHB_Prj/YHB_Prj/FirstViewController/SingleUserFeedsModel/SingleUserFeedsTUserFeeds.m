//
//  SingleUserFeedsTUserFeeds.m
//
//  Created by  C陈政旭 on 15/7/7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "SingleUserFeedsTUserFeeds.h"


NSString *const kSingleUserFeedsTUserFeedsModifyTime = @"modifyTime";
NSString *const kSingleUserFeedsTUserFeedsContent = @"content";
NSString *const kSingleUserFeedsTUserFeedsUserId = @"userId";
NSString *const kSingleUserFeedsTUserFeedsId = @"id";
NSString *const kSingleUserFeedsTUserFeedsPraise = @"praise";
NSString *const kSingleUserFeedsTUserFeedsPageCount = @"pageCount";
NSString *const kSingleUserFeedsTUserFeedsAttributes = @"attributes";
NSString *const kSingleUserFeedsTUserFeedsCreateTime = @"createTime";
NSString *const kSingleUserFeedsTUserFeedsCommentCount = @"commentCount";


@interface SingleUserFeedsTUserFeeds ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SingleUserFeedsTUserFeeds

@synthesize modifyTime = _modifyTime;
@synthesize content = _content;
@synthesize userId = _userId;
@synthesize tUserFeedsIdentifier = _tUserFeedsIdentifier;
@synthesize praise = _praise;
@synthesize pageCount = _pageCount;
@synthesize attributes = _attributes;
@synthesize createTime = _createTime;
@synthesize commentCount = _commentCount;


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
            self.modifyTime = [[self objectOrNilForKey:kSingleUserFeedsTUserFeedsModifyTime fromDictionary:dict] doubleValue];
            self.content = [self objectOrNilForKey:kSingleUserFeedsTUserFeedsContent fromDictionary:dict];
            self.userId = [[self objectOrNilForKey:kSingleUserFeedsTUserFeedsUserId fromDictionary:dict] doubleValue];
            self.tUserFeedsIdentifier = [[self objectOrNilForKey:kSingleUserFeedsTUserFeedsId fromDictionary:dict] doubleValue];
            self.praise = [[self objectOrNilForKey:kSingleUserFeedsTUserFeedsPraise fromDictionary:dict] doubleValue];
            self.pageCount = [[self objectOrNilForKey:kSingleUserFeedsTUserFeedsPageCount fromDictionary:dict] doubleValue];
            self.attributes = [self objectOrNilForKey:kSingleUserFeedsTUserFeedsAttributes fromDictionary:dict];
            self.createTime = [[self objectOrNilForKey:kSingleUserFeedsTUserFeedsCreateTime fromDictionary:dict] doubleValue];
            self.commentCount = [[self objectOrNilForKey:kSingleUserFeedsTUserFeedsCommentCount fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.modifyTime] forKey:kSingleUserFeedsTUserFeedsModifyTime];
    [mutableDict setValue:self.content forKey:kSingleUserFeedsTUserFeedsContent];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userId] forKey:kSingleUserFeedsTUserFeedsUserId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tUserFeedsIdentifier] forKey:kSingleUserFeedsTUserFeedsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.praise] forKey:kSingleUserFeedsTUserFeedsPraise];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageCount] forKey:kSingleUserFeedsTUserFeedsPageCount];
    [mutableDict setValue:self.attributes forKey:kSingleUserFeedsTUserFeedsAttributes];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createTime] forKey:kSingleUserFeedsTUserFeedsCreateTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentCount] forKey:kSingleUserFeedsTUserFeedsCommentCount];

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

    self.modifyTime = [aDecoder decodeDoubleForKey:kSingleUserFeedsTUserFeedsModifyTime];
    self.content = [aDecoder decodeObjectForKey:kSingleUserFeedsTUserFeedsContent];
    self.userId = [aDecoder decodeDoubleForKey:kSingleUserFeedsTUserFeedsUserId];
    self.tUserFeedsIdentifier = [aDecoder decodeDoubleForKey:kSingleUserFeedsTUserFeedsId];
    self.praise = [aDecoder decodeDoubleForKey:kSingleUserFeedsTUserFeedsPraise];
    self.pageCount = [aDecoder decodeDoubleForKey:kSingleUserFeedsTUserFeedsPageCount];
    self.attributes = [aDecoder decodeObjectForKey:kSingleUserFeedsTUserFeedsAttributes];
    self.createTime = [aDecoder decodeDoubleForKey:kSingleUserFeedsTUserFeedsCreateTime];
    self.commentCount = [aDecoder decodeDoubleForKey:kSingleUserFeedsTUserFeedsCommentCount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_modifyTime forKey:kSingleUserFeedsTUserFeedsModifyTime];
    [aCoder encodeObject:_content forKey:kSingleUserFeedsTUserFeedsContent];
    [aCoder encodeDouble:_userId forKey:kSingleUserFeedsTUserFeedsUserId];
    [aCoder encodeDouble:_tUserFeedsIdentifier forKey:kSingleUserFeedsTUserFeedsId];
    [aCoder encodeDouble:_praise forKey:kSingleUserFeedsTUserFeedsPraise];
    [aCoder encodeDouble:_pageCount forKey:kSingleUserFeedsTUserFeedsPageCount];
    [aCoder encodeObject:_attributes forKey:kSingleUserFeedsTUserFeedsAttributes];
    [aCoder encodeDouble:_createTime forKey:kSingleUserFeedsTUserFeedsCreateTime];
    [aCoder encodeDouble:_commentCount forKey:kSingleUserFeedsTUserFeedsCommentCount];
}

- (id)copyWithZone:(NSZone *)zone
{
    SingleUserFeedsTUserFeeds *copy = [[SingleUserFeedsTUserFeeds alloc] init];
    
    if (copy) {

        copy.modifyTime = self.modifyTime;
        copy.content = [self.content copyWithZone:zone];
        copy.userId = self.userId;
        copy.tUserFeedsIdentifier = self.tUserFeedsIdentifier;
        copy.praise = self.praise;
        copy.pageCount = self.pageCount;
        copy.attributes = [self.attributes copyWithZone:zone];
        copy.createTime = self.createTime;
        copy.commentCount = self.commentCount;
    }
    
    return copy;
}


@end
