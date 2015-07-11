//
//  DetailVCListHasPicFeeds.m
//
//  Created by  C陈政旭 on 15/7/11
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "DetailVCListHasPicFeeds.h"


NSString *const kDetailVCListHasPicFeedsModifyTime = @"modifyTime";
NSString *const kDetailVCListHasPicFeedsContent = @"content";
NSString *const kDetailVCListHasPicFeedsUserId = @"userId";
NSString *const kDetailVCListHasPicFeedsId = @"id";
NSString *const kDetailVCListHasPicFeedsPraise = @"praise";
NSString *const kDetailVCListHasPicFeedsPageCount = @"pageCount";
NSString *const kDetailVCListHasPicFeedsTitle = @"title";
NSString *const kDetailVCListHasPicFeedsAttributes = @"attributes";
NSString *const kDetailVCListHasPicFeedsCreateTime = @"createTime";
NSString *const kDetailVCListHasPicFeedsCommentCount = @"commentCount";


@interface DetailVCListHasPicFeeds ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DetailVCListHasPicFeeds

@synthesize modifyTime = _modifyTime;
@synthesize content = _content;
@synthesize userId = _userId;
@synthesize listHasPicFeedsIdentifier = _listHasPicFeedsIdentifier;
@synthesize praise = _praise;
@synthesize pageCount = _pageCount;
@synthesize title = _title;
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
            self.modifyTime = [[self objectOrNilForKey:kDetailVCListHasPicFeedsModifyTime fromDictionary:dict] doubleValue];
            self.content = [self objectOrNilForKey:kDetailVCListHasPicFeedsContent fromDictionary:dict];
            self.userId = [[self objectOrNilForKey:kDetailVCListHasPicFeedsUserId fromDictionary:dict] doubleValue];
            self.listHasPicFeedsIdentifier = [[self objectOrNilForKey:kDetailVCListHasPicFeedsId fromDictionary:dict] doubleValue];
            self.praise = [[self objectOrNilForKey:kDetailVCListHasPicFeedsPraise fromDictionary:dict] doubleValue];
            self.pageCount = [[self objectOrNilForKey:kDetailVCListHasPicFeedsPageCount fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kDetailVCListHasPicFeedsTitle fromDictionary:dict];
            self.attributes = [self objectOrNilForKey:kDetailVCListHasPicFeedsAttributes fromDictionary:dict];
            self.createTime = [[self objectOrNilForKey:kDetailVCListHasPicFeedsCreateTime fromDictionary:dict] doubleValue];
            self.commentCount = [[self objectOrNilForKey:kDetailVCListHasPicFeedsCommentCount fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.modifyTime] forKey:kDetailVCListHasPicFeedsModifyTime];
    [mutableDict setValue:self.content forKey:kDetailVCListHasPicFeedsContent];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userId] forKey:kDetailVCListHasPicFeedsUserId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.listHasPicFeedsIdentifier] forKey:kDetailVCListHasPicFeedsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.praise] forKey:kDetailVCListHasPicFeedsPraise];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageCount] forKey:kDetailVCListHasPicFeedsPageCount];
    [mutableDict setValue:self.title forKey:kDetailVCListHasPicFeedsTitle];
    [mutableDict setValue:self.attributes forKey:kDetailVCListHasPicFeedsAttributes];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createTime] forKey:kDetailVCListHasPicFeedsCreateTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentCount] forKey:kDetailVCListHasPicFeedsCommentCount];

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

    self.modifyTime = [aDecoder decodeDoubleForKey:kDetailVCListHasPicFeedsModifyTime];
    self.content = [aDecoder decodeObjectForKey:kDetailVCListHasPicFeedsContent];
    self.userId = [aDecoder decodeDoubleForKey:kDetailVCListHasPicFeedsUserId];
    self.listHasPicFeedsIdentifier = [aDecoder decodeDoubleForKey:kDetailVCListHasPicFeedsId];
    self.praise = [aDecoder decodeDoubleForKey:kDetailVCListHasPicFeedsPraise];
    self.pageCount = [aDecoder decodeDoubleForKey:kDetailVCListHasPicFeedsPageCount];
    self.title = [aDecoder decodeObjectForKey:kDetailVCListHasPicFeedsTitle];
    self.attributes = [aDecoder decodeObjectForKey:kDetailVCListHasPicFeedsAttributes];
    self.createTime = [aDecoder decodeDoubleForKey:kDetailVCListHasPicFeedsCreateTime];
    self.commentCount = [aDecoder decodeDoubleForKey:kDetailVCListHasPicFeedsCommentCount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_modifyTime forKey:kDetailVCListHasPicFeedsModifyTime];
    [aCoder encodeObject:_content forKey:kDetailVCListHasPicFeedsContent];
    [aCoder encodeDouble:_userId forKey:kDetailVCListHasPicFeedsUserId];
    [aCoder encodeDouble:_listHasPicFeedsIdentifier forKey:kDetailVCListHasPicFeedsId];
    [aCoder encodeDouble:_praise forKey:kDetailVCListHasPicFeedsPraise];
    [aCoder encodeDouble:_pageCount forKey:kDetailVCListHasPicFeedsPageCount];
    [aCoder encodeObject:_title forKey:kDetailVCListHasPicFeedsTitle];
    [aCoder encodeObject:_attributes forKey:kDetailVCListHasPicFeedsAttributes];
    [aCoder encodeDouble:_createTime forKey:kDetailVCListHasPicFeedsCreateTime];
    [aCoder encodeDouble:_commentCount forKey:kDetailVCListHasPicFeedsCommentCount];
}

- (id)copyWithZone:(NSZone *)zone
{
    DetailVCListHasPicFeeds *copy = [[DetailVCListHasPicFeeds alloc] init];
    
    if (copy) {

        copy.modifyTime = self.modifyTime;
        copy.content = [self.content copyWithZone:zone];
        copy.userId = self.userId;
        copy.listHasPicFeedsIdentifier = self.listHasPicFeedsIdentifier;
        copy.praise = self.praise;
        copy.pageCount = self.pageCount;
        copy.title = [self.title copyWithZone:zone];
        copy.attributes = [self.attributes copyWithZone:zone];
        copy.createTime = self.createTime;
        copy.commentCount = self.commentCount;
    }
    
    return copy;
}


@end
