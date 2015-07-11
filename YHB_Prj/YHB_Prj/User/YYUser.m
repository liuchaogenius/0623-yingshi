//
//  YYUser.m
//  YHB_Prj
//
//  Created by Johnny's on 15/7/10.
//  Copyright (c) 2015年 striveliu. All rights reserved.
//

#import "YYUser.h"
#import "YYUserManage.h"
#import "YYDataService.h"
#import "SynthesizeSingleton.h"

@interface YYUser()
@property(nonatomic, strong) YYUserManage *userManage;
@end

@implementation YYUser
SYNTHESIZE_SINGLETON_FOR_CLASS(YYUser);

- (instancetype)init
{
    _isLogin = NO;
    [self getLocalUserInfo];
    return self;
}

//加载本地数据
- (void)getLocalUserInfo
{
    YYTUser *TUser = [[YYDataService sharedYYDataSevice] getTUser];
    YYTUserInfo *TUserInfo = [[YYDataService sharedYYDataSevice] getTUserInfo];
    if (TUser && TUserInfo)
    {
        self.user = TUser;
        self.userInfo = TUserInfo;
//        self.localBgUrl = [[YYDataService sharedYYDataSevice] getBgImg];
        self.localHeadUrl = [[YYDataService sharedYYDataSevice] getFaceImg];
        _isLogin = YES;
    }
}

- (void)saveUserInfoWithYYTUser:(YYTUser *)aYYTUser andYYTUserInfo:(YYTUserInfo *)aYYTUserInfo
{
    _isLogin = YES;
    self.user = aYYTUser;
    self.userInfo = aYYTUserInfo;
    [[YYDataService sharedYYDataSevice] saveTUser:aYYTUser];
    [[YYDataService sharedYYDataSevice] saveTUserInfo:aYYTUserInfo];
    [self saveUserFaceImgAndBGImg];
}

- (void)saveUserFaceImgAndBGImg
{
    NSString *faceImgUrl;
    NSString *BGImgUrl;
//    kYyImgUrl(self.userInfo.faceImg, faceImgUrl);
    kYyImgUrl(@"/userphoto/1d6b5ccba2f94f80900d32ce6136ab0b.jpg", faceImgUrl);
//    kYyImgUrl(self.userInfo.background, BGImgUrl);
    kYyImgUrl(@"/userphoto/1d6b5ccba2f94f80900d32ce6136ab0b.jpg", BGImgUrl);
    UIImage *faceImg = [self getImageFromURL:faceImgUrl];
//    UIImage *bgImg = [self getImageFromURL:BGImgUrl];
    self.localHeadUrl = faceImg;
//    self.localBgUrl = bgImg;
    [[YYDataService sharedYYDataSevice] saveUserFaceImg:faceImg];
}

- (void)logoutUser
{
    _isLogin = NO;
    [[YYDataService sharedYYDataSevice] clearUserInfo];
}

-(UIImage *)getImageFromURL:(NSString *)fileURL
{
    
    UIImage * result;
    
    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileURL]];
    
    result = [UIImage imageWithData:data];
    
    return result;
    
}

@end
