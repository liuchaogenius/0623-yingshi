//
//  DetailVCTUserProfileList.h
//
//  Created by  C陈政旭 on 15/7/11
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface DetailVCTUserProfileList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *introduce;
@property (nonatomic, assign) double modifyTime;
@property (nonatomic, strong) NSString *position;
@property (nonatomic, assign) double tUserProfileListIdentifier;
@property (nonatomic, assign) double jobStartTime;
@property (nonatomic, strong) NSString *company;
@property (nonatomic, assign) double status;
@property (nonatomic, assign) double userId;
@property (nonatomic, assign) double createTime;
@property (nonatomic, assign) double jobEndTime;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
