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
    UIViewController *vc3 = [self getThirdViewController];
    UIViewController *vc4 = [self getFourthViewController];
    NSArray *arry = @[vc1,vc2,vc3,vc4];
    return arry;
}

- (UIViewController *)getFirstViewController
{
    FirstViewController *firstVC = [[FirstViewController alloc] init];
    return firstVC;
}

- (UIViewController *)getSecondViewController
{
    UIViewController *secondVC = [[SecondViewController alloc] init];
    return secondVC;
}
- (UIViewController *)getThirdViewController
{
    ThirdViewController *thirdVC = [[ThirdViewController alloc] init];
    return thirdVC;
}

- (UIViewController *)getFourthViewController
{
    FourthViewController *fourthVC = [[FourthViewController alloc] init];
    return fourthVC;
}

- (UIViewController *)getloginViewController
{
    return nil;
}
@end
