//
//  SingleUserFeedsTComment.m
//
//  Created by  C陈政旭 on 15/7/7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "SingleUserFeedsTComment.h"


NSString *const kSingleUserFeedsTCommentStatus = @"status";
NSString *const kSingleUserFeedsTCommentContent = @"content";
NSString *const kSingleUserFeedsTCommentParentId = @"parentId";
NSString *const kSingleUserFeedsTCommentId = @"id";
NSString *const kSingleUserFeedsTCommentModifyTime = @"modifyTime";
NSString *const kSingleUserFeedsTCommentAuthorId = @"authorId";
NSString *const kSingleUserFeedsTCommentUserId = @"userId";
NSString *const kSingleUserFeedsTCommentType = @"type";
NSString *const kSingleUserFeedsTCommentCreateTime = @"createTime";


@interface SingleUserFeedsTComment ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SingleUserFeedsTComment

@synthesize status = _status;
@synthesize content = _content;
@synthesize parentId = _parentId;
@synthesize tCommentIdentifier = _tCommentIdentifier;
@synthesize modifyTime = _modifyTime;
@synthesize authorId = _authorId;
@synthesize userId = _userId;
@synthesize type = _type;
@synthesize createTime = _createTime;


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
            self.status = [[self objectOrNilForKey:kSingleUserFeedsTCommentStatus fromDictionary:dict] doubleValue];
            self.content = [self objectOrNilForKey:kSingleUserFeedsTCommentContent fromDictionary:dict];
            self.parentId = [[self objectOrNilForKey:kSingleUserFeedsTCommentParentId fromDictionary:dict] doubleValue];
            self.tCommentIdentifier = [[self objectOrNilForKey:kSingleUserFeedsTCommentId fromDictionary:dict] doubleValue];
            self.modifyTime = [[self objectOrNilForKey:kSingleUserFeedsTCommentModifyTime fromDictionary:dict] doubleValue];
            self.authorId = [[self objectOrNilForKey:kSingleUserFeedsTCommentAuthorId fromDictionary:dict] doubleValue];
            self.userId = [[self objectOrNilForKey:kSingleUserFeedsTCommentUserId fromDictionary:dict] doubleValue];
            self.type = [[self objectOrNilForKey:kSingleUserFeedsTCommentType fromDictionary:dict] doubleValue];
            self.createTime = [[self objectOrNilForKey:kSingleUserFeedsTCommentCreateTime fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kSingleUserFeedsTCommentStatus];
    [mutableDict setValue:self.content forKey:kSingleUserFeedsTCommentContent];
    [mutableDict setValue:[NSNumber numberWithDouble:self.parentId] forKey:kSingleUserFeedsTCommentParentId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tCommentIdentifier] forKey:kSingleUserFeedsTCommentId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.modifyTime] forKey:kSingleUserFeedsTCommentModifyTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.authorId] forKey:kSingleUserFeedsTCommentAuthorId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userId] forKey:kSingleUserFeedsTCommentUserId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kSingleUserFeedsTCommentType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createTime] forKey:kSingleUserFeedsTCommentCreateTime];

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

    self.status = [aDecoder decodeDoubleForKey:kSingleUserFeedsTCommentStatus];
    self.content = [aDecoder decodeObjectForKey:kSingleUserFeedsTCommentContent];
    self.parentId = [aDecoder decodeDoubleForKey:kSingleUserFeedsTCommentParentId];
    self.tCommentIdentifier = [aDecoder decodeDoubleForKey:kSingleUserFeedsTCommentId];
    self.modifyTime = [aDecoder decodeDoubleForKey:kSingleUserFeedsTCommentModifyTime];
    self.authorId = [aDecoder decodeDoubleForKey:kSingleUserFeedsTCommentAuthorId];
    self.userId = [aDecoder decodeDoubleForKey:kSingleUserFeedsTCommentUserId];
    self.type = [aDecoder decodeDoubleForKey:kSingleUserFeedsTCommentType];
    self.createTime = [aDecoder decodeDoubleForKey:kSingleUserFeedsTCommentCreateTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_status forKey:kSingleUserFeedsTCommentStatus];
    [aCoder encodeObject:_content forKey:kSingleUserFeedsTCommentContent];
    [aCoder encodeDouble:_parentId forKey:kSingleUserFeedsTCommentParentId];
    [aCoder encodeDouble:_tCommentIdentifier forKey:kSingleUserFeedsTCommentId];
    [aCoder encodeDouble:_modifyTime forKey:kSingleUserFeedsTCommentModifyTime];
    [aCoder encodeDouble:_authorId forKey:kSingleUserFeedsTCommentAuthorId];
    [aCoder encodeDouble:_userId forKey:kSingleUserFeedsTCommentUserId];
    [aCoder encodeDouble:_type forKey:kSingleUserFeedsTCommentType];
    [aCoder encodeDouble:_createTime forKey:kSingleUserFeedsTCommentCreateTime];
}

- (id)copyWithZone:(NSZone *)zone
{
    SingleUserFeedsTComment *copy = [[SingleUserFeedsTComment alloc] init];
    
    if (copy) {

        copy.status = self.status;
        copy.content = [self.content copyWithZone:zone];
        copy.parentId = self.parentId;
        copy.tCommentIdentifier = self.tCommentIdentifier;
        copy.modifyTime = self.modifyTime;
        copy.authorId = self.authorId;
        copy.userId = self.userId;
        copy.type = self.type;
        copy.createTime = self.createTime;
    }
    
    return copy;
}


@end
