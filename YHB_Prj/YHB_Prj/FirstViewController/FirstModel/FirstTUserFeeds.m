//
//  FirstTUserFeeds.m
//
//  Created by  C陈政旭 on 15/6/28
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "FirstTUserFeeds.h"


NSString *const kFirstTUserFeedsModifyTime = @"modifyTime";
NSString *const kFirstTUserFeedsContent = @"content";
NSString *const kFirstTUserFeedsUserId = @"userId";
NSString *const kFirstTUserFeedsId = @"id";
NSString *const kFirstTUserFeedsPraise = @"praise";
NSString *const kFirstTUserFeedsPageCount = @"pageCount";
NSString *const kFirstTUserFeedsAttributes = @"attributes";
NSString *const kFirstTUserFeedsCreateTime = @"createTime";
NSString *const kFirstTUserFeedsCommentCount = @"commentCount";


@interface FirstTUserFeeds ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation FirstTUserFeeds

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
            self.modifyTime = [[self objectOrNilForKey:kFirstTUserFeedsModifyTime fromDictionary:dict] doubleValue];
            self.content = [self objectOrNilForKey:kFirstTUserFeedsContent fromDictionary:dict];
            self.userId = [[self objectOrNilForKey:kFirstTUserFeedsUserId fromDictionary:dict] doubleValue];
            self.tUserFeedsIdentifier = [[self objectOrNilForKey:kFirstTUserFeedsId fromDictionary:dict] doubleValue];
            self.praise = [[self objectOrNilForKey:kFirstTUserFeedsPraise fromDictionary:dict] doubleValue];
            self.pageCount = [[self objectOrNilForKey:kFirstTUserFeedsPageCount fromDictionary:dict] doubleValue];
            self.attributes = [self objectOrNilForKey:kFirstTUserFeedsAttributes fromDictionary:dict];
            self.createTime = [[self objectOrNilForKey:kFirstTUserFeedsCreateTime fromDictionary:dict] doubleValue];
            self.commentCount = [[self objectOrNilForKey:kFirstTUserFeedsCommentCount fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.modifyTime] forKey:kFirstTUserFeedsModifyTime];
    [mutableDict setValue:self.content forKey:kFirstTUserFeedsContent];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userId] forKey:kFirstTUserFeedsUserId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tUserFeedsIdentifier] forKey:kFirstTUserFeedsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.praise] forKey:kFirstTUserFeedsPraise];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageCount] forKey:kFirstTUserFeedsPageCount];
    [mutableDict setValue:self.attributes forKey:kFirstTUserFeedsAttributes];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createTime] forKey:kFirstTUserFeedsCreateTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentCount] forKey:kFirstTUserFeedsCommentCount];

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

    self.modifyTime = [aDecoder decodeDoubleForKey:kFirstTUserFeedsModifyTime];
    self.content = [aDecoder decodeObjectForKey:kFirstTUserFeedsContent];
    self.userId = [aDecoder decodeDoubleForKey:kFirstTUserFeedsUserId];
    self.tUserFeedsIdentifier = [aDecoder decodeDoubleForKey:kFirstTUserFeedsId];
    self.praise = [aDecoder decodeDoubleForKey:kFirstTUserFeedsPraise];
    self.pageCount = [aDecoder decodeDoubleForKey:kFirstTUserFeedsPageCount];
    self.attributes = [aDecoder decodeObjectForKey:kFirstTUserFeedsAttributes];
    self.createTime = [aDecoder decodeDoubleForKey:kFirstTUserFeedsCreateTime];
    self.commentCount = [aDecoder decodeDoubleForKey:kFirstTUserFeedsCommentCount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_modifyTime forKey:kFirstTUserFeedsModifyTime];
    [aCoder encodeObject:_content forKey:kFirstTUserFeedsContent];
    [aCoder encodeDouble:_userId forKey:kFirstTUserFeedsUserId];
    [aCoder encodeDouble:_tUserFeedsIdentifier forKey:kFirstTUserFeedsId];
    [aCoder encodeDouble:_praise forKey:kFirstTUserFeedsPraise];
    [aCoder encodeDouble:_pageCount forKey:kFirstTUserFeedsPageCount];
    [aCoder encodeObject:_attributes forKey:kFirstTUserFeedsAttributes];
    [aCoder encodeDouble:_createTime forKey:kFirstTUserFeedsCreateTime];
    [aCoder encodeDouble:_commentCount forKey:kFirstTUserFeedsCommentCount];
}

- (id)copyWithZone:(NSZone *)zone
{
    FirstTUserFeeds *copy = [[FirstTUserFeeds alloc] init];
    
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
