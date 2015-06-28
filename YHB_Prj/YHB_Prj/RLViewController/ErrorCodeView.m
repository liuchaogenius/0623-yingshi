//
//  ErrorCodeView.m
//  YHB_Prj
//
//  Created by Johnny's on 15/6/27.
//  Copyright (c) 2015年 striveliu. All rights reserved.
//

#import "ErrorCodeView.h"
#import "AppDelegate.h"

@interface ErrorCodeView()
{
    UIWindow *errorWindow;
    UILabel *errorLabel;
}
@end

@implementation ErrorCodeView

- (void)showErrorLabel:(UIView*)aParentView errorCode:(int)aCode
{
    errorWindow = [[UIWindow alloc] init];
    errorWindow.windowLevel = UIWindowLevelAlert;
    errorLabel = [[UILabel alloc] init];
    errorLabel.font = [UIFont systemFontOfSize:14];
    errorLabel.backgroundColor = [UIColor blackColor];
    errorLabel.textColor = [UIColor whiteColor];
    CGRect labelRect = {0};
    CGRect pRect = aParentView.bounds;

    labelRect.size.width = 200;
    labelRect.size.height = 200;
    errorLabel.textAlignment = NSTextAlignmentCenter;
    errorLabel.frame = CGRectMake(0, 0, labelRect.size.width, labelRect.size.height);
    errorWindow.frame = labelRect;
    errorLabel.layer.cornerRadius = 10.0f;
    errorLabel.layer.masksToBounds = YES;
    [errorWindow addSubview:errorLabel];
    [errorWindow makeKeyAndVisible];
    
    [self performSelector:@selector(removeErrorLabel) withObject:nil afterDelay:0.6];
}

- (void)removeErrorLabel
{
    [UIView animateWithDuration:0.4 animations:^{
        errorWindow.alpha = 0;
    } completion:^(BOOL finished) {
        errorWindow = nil;
        errorLabel = nil;
        AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        [delegate.window makeKeyAndVisible];
    }];
}

@end
