//
//  SingleUserFeedsTUserInfo.h
//
//  Created by  C陈政旭 on 15/7/7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SingleUserFeedsTUserInfo : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *tUserInfoDescription;
@property (nonatomic, assign) double industry;
@property (nonatomic, assign) double sex;
@property (nonatomic, strong) NSString *mobile;
@property (nonatomic, assign) double area;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double userId;
@property (nonatomic, assign) double createTime;
@property (nonatomic, strong) NSString *background;
@property (nonatomic, strong) NSString *nickName;
@property (nonatomic, assign) double praise;
@property (nonatomic, assign) double friends;
@property (nonatomic, assign) double modifyTime;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *faceImg;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
