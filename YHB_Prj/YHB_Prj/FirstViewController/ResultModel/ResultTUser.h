//
//  ResultTUser.h
//
//  Created by  C陈政旭 on 15/7/6
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ResultTUser : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *password;
@property (nonatomic, assign) double tUserIdentifier;
@property (nonatomic, assign) double createTime;
@property (nonatomic, assign) double lastLoginTime;
@property (nonatomic, assign) double status;
@property (nonatomic, strong) NSString *userName;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
