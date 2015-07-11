//
//  DetailVCTUserProfileList.m
//
//  Created by  C陈政旭 on 15/7/11
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "DetailVCTUserProfileList.h"


NSString *const kDetailVCTUserProfileListIntroduce = @"introduce";
NSString *const kDetailVCTUserProfileListModifyTime = @"modifyTime";
NSString *const kDetailVCTUserProfileListPosition = @"position";
NSString *const kDetailVCTUserProfileListId = @"id";
NSString *const kDetailVCTUserProfileListJobStartTime = @"jobStartTime";
NSString *const kDetailVCTUserProfileListCompany = @"company";
NSString *const kDetailVCTUserProfileListStatus = @"status";
NSString *const kDetailVCTUserProfileListUserId = @"userId";
NSString *const kDetailVCTUserProfileListCreateTime = @"createTime";
NSString *const kDetailVCTUserProfileListJobEndTime = @"jobEndTime";


@interface DetailVCTUserProfileList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DetailVCTUserProfileList

@synthesize introduce = _introduce;
@synthesize modifyTime = _modifyTime;
@synthesize position = _position;
@synthesize tUserProfileListIdentifier = _tUserProfileListIdentifier;
@synthesize jobStartTime = _jobStartTime;
@synthesize company = _company;
@synthesize status = _status;
@synthesize userId = _userId;
@synthesize createTime = _createTime;
@synthesize jobEndTime = _jobEndTime;


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
            self.introduce = [self objectOrNilForKey:kDetailVCTUserProfileListIntroduce fromDictionary:dict];
            self.modifyTime = [[self objectOrNilForKey:kDetailVCTUserProfileListModifyTime fromDictionary:dict] doubleValue];
            self.position = [self objectOrNilForKey:kDetailVCTUserProfileListPosition fromDictionary:dict];
            self.tUserProfileListIdentifier = [[self objectOrNilForKey:kDetailVCTUserProfileListId fromDictionary:dict] doubleValue];
            self.jobStartTime = [[self objectOrNilForKey:kDetailVCTUserProfileListJobStartTime fromDictionary:dict] doubleValue];
            self.company = [self objectOrNilForKey:kDetailVCTUserProfileListCompany fromDictionary:dict];
            self.status = [[self objectOrNilForKey:kDetailVCTUserProfileListStatus fromDictionary:dict] doubleValue];
            self.userId = [[self objectOrNilForKey:kDetailVCTUserProfileListUserId fromDictionary:dict] doubleValue];
            self.createTime = [[self objectOrNilForKey:kDetailVCTUserProfileListCreateTime fromDictionary:dict] doubleValue];
            self.jobEndTime = [[self objectOrNilForKey:kDetailVCTUserProfileListJobEndTime fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.introduce forKey:kDetailVCTUserProfileListIntroduce];
    [mutableDict setValue:[NSNumber numberWithDouble:self.modifyTime] forKey:kDetailVCTUserProfileListModifyTime];
    [mutableDict setValue:self.position forKey:kDetailVCTUserProfileListPosition];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tUserProfileListIdentifier] forKey:kDetailVCTUserProfileListId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.jobStartTime] forKey:kDetailVCTUserProfileListJobStartTime];
    [mutableDict setValue:self.company forKey:kDetailVCTUserProfileListCompany];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kDetailVCTUserProfileListStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userId] forKey:kDetailVCTUserProfileListUserId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createTime] forKey:kDetailVCTUserProfileListCreateTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.jobEndTime] forKey:kDetailVCTUserProfileListJobEndTime];

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

    self.introduce = [aDecoder decodeObjectForKey:kDetailVCTUserProfileListIntroduce];
    self.modifyTime = [aDecoder decodeDoubleForKey:kDetailVCTUserProfileListModifyTime];
    self.position = [aDecoder decodeObjectForKey:kDetailVCTUserProfileListPosition];
    self.tUserProfileListIdentifier = [aDecoder decodeDoubleForKey:kDetailVCTUserProfileListId];
    self.jobStartTime = [aDecoder decodeDoubleForKey:kDetailVCTUserProfileListJobStartTime];
    self.company = [aDecoder decodeObjectForKey:kDetailVCTUserProfileListCompany];
    self.status = [aDecoder decodeDoubleForKey:kDetailVCTUserProfileListStatus];
    self.userId = [aDecoder decodeDoubleForKey:kDetailVCTUserProfileListUserId];
    self.createTime = [aDecoder decodeDoubleForKey:kDetailVCTUserProfileListCreateTime];
    self.jobEndTime = [aDecoder decodeDoubleForKey:kDetailVCTUserProfileListJobEndTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_introduce forKey:kDetailVCTUserProfileListIntroduce];
    [aCoder encodeDouble:_modifyTime forKey:kDetailVCTUserProfileListModifyTime];
    [aCoder encodeObject:_position forKey:kDetailVCTUserProfileListPosition];
    [aCoder encodeDouble:_tUserProfileListIdentifier forKey:kDetailVCTUserProfileListId];
    [aCoder encodeDouble:_jobStartTime forKey:kDetailVCTUserProfileListJobStartTime];
    [aCoder encodeObject:_company forKey:kDetailVCTUserProfileListCompany];
    [aCoder encodeDouble:_status forKey:kDetailVCTUserProfileListStatus];
    [aCoder encodeDouble:_userId forKey:kDetailVCTUserProfileListUserId];
    [aCoder encodeDouble:_createTime forKey:kDetailVCTUserProfileListCreateTime];
    [aCoder encodeDouble:_jobEndTime forKey:kDetailVCTUserProfileListJobEndTime];
}

- (id)copyWithZone:(NSZone *)zone
{
    DetailVCTUserProfileList *copy = [[DetailVCTUserProfileList alloc] init];
    
    if (copy) {

        copy.introduce = [self.introduce copyWithZone:zone];
        copy.modifyTime = self.modifyTime;
        copy.position = [self.position copyWithZone:zone];
        copy.tUserProfileListIdentifier = self.tUserProfileListIdentifier;
        copy.jobStartTime = self.jobStartTime;
        copy.company = [self.company copyWithZone:zone];
        copy.status = self.status;
        copy.userId = self.userId;
        copy.createTime = self.createTime;
        copy.jobEndTime = self.jobEndTime;
    }
    
    return copy;
}


@end
