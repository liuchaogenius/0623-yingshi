//
//  FactoryModel.m
//  YHB_Prj
//
//  Created by  striveliu on 14/12/3.
//  Copyright (c) 2014年 striveliu. All rights reserved.
//

#import "FactoryModel.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "ReleaseViewController.h"

@interface FactoryModel()
{
    FirstViewController *firstVC;
    SecondViewController *secondVC;
    ThirdViewController *thirdVC;
    FourthViewController *fourthVC;
    UIViewController *releaseVC;
}
@end
@implementation FactoryModel
+ (FactoryModel *)shareFactoryModel
{
    static FactoryModel *factoryModel = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if(factoryModel == nil)
        {
            factoryModel = [[FactoryModel alloc] init];
        }
    });
    return factoryModel;
}

- (NSArray *)getTabbarArrys
{
    UIViewController *vc1 = [self getFirstViewController];
    UIViewController *vc2 = [self getSecondViewController];
    UIViewController *vc3 = [self getReleaseViewController];
    UIViewController *vc4 = [self getThirdViewController];
    UIViewController *vc5 = [self getFourthViewController];
    NSArray *arry = @[vc1,vc2,vc3,vc4,vc5];
    return arry;
}

- (UIViewController *)getReleaseViewController
{
    if(!releaseVC)
    {
        releaseVC = [[ReleaseViewController alloc] init];
    }
    return releaseVC;
}
- (UIViewController *)getFirstViewController
{
    if(!firstVC)
    {
        firstVC = [[FirstViewController alloc] init];
    }
    return firstVC;
}

- (UIViewController *)getSecondViewController
{
    if(!secondVC)
    {
        secondVC = [[SecondViewController alloc] init];
    }
    return secondVC;
}
- (UIViewController *)getThirdViewController
{
    if(!thirdVC)
    {
        thirdVC = [[ThirdViewController alloc] init];
    }
    return thirdVC;
}

- (UIViewController *)getFourthViewController
{
    if(!fourthVC)
    {
        fourthVC = [[FourthViewController alloc] init];
    }
    return fourthVC;
}

- (UIViewController *)getloginViewController
{
    return nil;
}
@end
