//
//  RootTabBarController.m
//  Hubanghu
//
//  Created by  striveliu on 14-10-9.
//  Copyright (c) 2014年 striveliu. All rights reserved.
//

#import "RootTabBarController.h"
#import "FBKVOController.h"
#import "ViewInteraction.h"
#import "FactoryModel.h"
#import "LSNavigationController.h"
#import "YHBAlbumViewController.h"
#import "EditPhotoViewController.h"
#import "YHBUser.h"
#import "RLViewController.h"

@interface RootTabBarController ()<UITabBarControllerDelegate, UIActionSheetDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    
    NSInteger newSelectIndex;
    NSInteger oldSelectIndex;
    NSMutableArray *navArry;
    FBKVOController *loginObserver;
    FBKVOController *leftViewObserver;
    UIButton *releaseButton;
    YHBAlbumViewController *testvc;
    UINavigationController *testnav;
    BOOL isGoBack;
}
@property(nonatomic, strong) RLViewController *loginVC;
@property(nonatomic, strong) LSNavigationController *loginNav;
@end

@implementation RootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.frame = CGRectMake(0, 0, kMainScreenWidth, kMainScreenHeight);
    self.delegate = self;
    isGoBack = NO;
    [self initTabViewController];
    [self initTabBarItem];
    [self initNotifyRegister];
    
    releaseButton = [[UIButton alloc] initWithFrame:CGRectMake(kMainScreenWidth/2-kMainScreenWidth/10, 0, kMainScreenWidth/5, 49)];
//    [releaseButton setImage:IMAGE(@"takePhoto") forState:UIControlStateNormal];
    //    [button setBackgroundImage:[UIImage imageNamed:@"TabBarItem_nor_2"] forState:UIControlStateNormal];
    //    [button setBackgroundImage:[UIImage imageNamed:@"TabBarItem_sel_2"] forState:UIControlStateHighlighted];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(kMainScreenWidth/2-16, 49/2-16, 32, 32)];
    [imgView setImage:IMAGE(@"takePhoto")];

    [releaseButton addTarget:self action:@selector(releaseRuttonItem:) forControlEvents:UIControlEventTouchUpInside];
    [self.tabBar addSubview:releaseButton];
    [self.tabBar addSubview:imgView];
    
    
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, 49)];
    backView.backgroundColor = KColor;
    [self.tabBar insertSubview:backView atIndex:0];
    self.tabBar.opaque = YES;
}

- (void)initNotifyRegister
{
    [NotifyFactoryObject registerLoginMsgNotify:self action:@selector(showLoginViewController:)];
}

- (void)initTabViewController
{
    NSArray *arry = [[FactoryModel shareFactoryModel] getTabbarArrys];
    navArry = [NSMutableArray arrayWithCapacity:0];
    if(arry && arry.count>0)
    {
        for(UIViewController *vc in arry)
        {
            LSNavigationController *nav = [[LSNavigationController alloc] initWithRootViewController:vc];
            [navArry addObject:nav];
        }
    }

    self.viewControllers = navArry;
}
//发布按钮事件
- (void)releaseRuttonItem:(UIButton*)aBut
{
//    if(!testvc)
//    {
//        testvc = nil;
//    }
//    if(!testnav)
//    {
//        testnav = nil;
//    }
//    testvc = [[YHBAlbumViewController alloc] initWithBlock:nil andPhotoCount:1 isFirst:YES];
//    testnav = [[LSNavigationController alloc] initWithRootViewController:testvc];
//    [self presentViewController:testnav animated:YES completion:^{
//        
//    }];
    [self plusImageClicked];
}

- (void)plusImageClicked
{
    UIActionSheet *sheet;
    
    // 判断是否支持相机
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        sheet  = [[UIActionSheet alloc] initWithTitle:@"选择图像" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"取消" otherButtonTitles:@"拍照", @"从相册选择", nil];
    }
    else {
        sheet = [[UIActionSheet alloc] initWithTitle:@"选择图像" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"取消" otherButtonTitles:@"从相册选择", nil];
    }
    
    sheet.tag = 255;
    
    [sheet showInView:self.view];
}

#pragma mark - action sheet delegte
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (actionSheet.tag == 255) {
        NSUInteger sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        // 判断是否支持相机
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            switch (buttonIndex) {
                case 0:
                    return;
                case 1: //相机
                    sourceType = UIImagePickerControllerSourceTypeCamera;
                    break;
                case 2: //相册
                    sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                    break;
            }
        }
        else {
            if (buttonIndex == 0) {
                return;
            } else {
                sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            }
        }
        if (sourceType==UIImagePickerControllerSourceTypeCamera) {
            // 跳转到相机或相册页面
            UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
//            __weak RootTabBarController *barVC = self;
            imagePickerController.delegate = self;
            imagePickerController.sourceType = sourceType;
            imagePickerController.mediaTypes =[UIImagePickerController availableMediaTypesForSourceType:imagePickerController.sourceType];
            if (sourceType == UIImagePickerControllerSourceTypeCamera)
            {
                imagePickerController.allowsEditing = YES;
            }
            
            [self presentViewController:imagePickerController animated:YES completion:^{}];
        }
        else
        {
            UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
           if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
                imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                //pickerImage.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
                imagePickerController.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:imagePickerController.sourceType];
                
            }
            imagePickerController.delegate = self;
            imagePickerController.allowsEditing = YES;
            [self presentViewController:imagePickerController animated:YES completion:^{}];
        }
    }
}

#pragma mark - image picker delegte
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{}];
    
    UIImage *image = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    
    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
        UIImage * oriImage = [info objectForKey:UIImagePickerControllerOriginalImage];
        // 保存图片到相册中
        SEL selectorToCall = @selector(imageWasSavedSuccessfully:didFinishSavingWithError:contextInfo:);
        UIImageWriteToSavedPhotosAlbum(oriImage, self,selectorToCall, NULL);
    }
    
    EditPhotoViewController *vc = [[EditPhotoViewController alloc] initWithBgImg:image];
    vc.hidesBottomBarWhenPushed = YES;
    [[self getCurrentSelectVC].navigationController pushViewController:vc animated:YES];
}

- (void) imageWasSavedSuccessfully:(UIImage *)paramImage didFinishSavingWithError:(NSError *)paramError contextInfo:(void *)paramContextInfo{
    if (paramError == nil){
        NSLog(@"Image was saved successfully.");
        paramImage = nil;
    } else {
        NSLog(@"An error happened while saving the image.");
        NSLog(@"Error = %@", paramError);
    }
}

- (void)initTabBarItem
{
    //[[UITabBar appearance] setSelectionIndicatorImage:[UIImage imageNamed:[NSString stringWithFormat:@"TabBarItem_sel"]]];
    //if(kSystemVersion<7.0)
    {
        UIImage *img = [[UIImage imageNamed:@"tabbarBG"] resizableImageWithCapInsets:UIEdgeInsetsMake(5, 5, 5, 5)];
        [[UITabBar appearance] setBackgroundImage:img];
    }
    for(int i=0; i<navArry.count;i++)
    {
        int imgIndex = i;
        if(i == 2)
        {
            continue;
        }
        if(i>2)
        {
            imgIndex--;
        }
        UITabBarItem *tabBarItem = self.tabBar.items[i];
        UIImage *norimg = [UIImage imageNamed:[NSString stringWithFormat:@"TabBarItem_nor_%d",imgIndex+1]];
        UIImage *selimg = [UIImage imageNamed:[NSString stringWithFormat:@"TabBarItem_sel_%d",imgIndex+1]];

        tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
        tabBarItem.title = @" ";
        if(kSystemVersion>=7.0)
        {
            norimg = [norimg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            selimg = [selimg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            tabBarItem.image = norimg;
            tabBarItem.selectedImage = selimg;
            
        }
        else
        {
            [tabBarItem setFinishedSelectedImage:selimg withFinishedUnselectedImage:norimg];
        }
        tabBarItem.tag = imgIndex;
    }
    
    MLOG(@"tabbarHeight=%f",self.tabBar.frame.size.height);

}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    MLOG(@"shouldtabsel = %lu", (unsigned long)self.selectedIndex);
    if([viewController isKindOfClass:[[[FactoryModel shareFactoryModel] getReleaseViewController] class]])
    {
        return NO;
    }
    oldSelectIndex = self.selectedIndex;
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    MLOG(@"tabsel = %ld", (unsigned long)tabBarController.selectedIndex);
    newSelectIndex = self.selectedIndex;
}


- (UIViewController *)getCurrentSelectVC
{
    if(newSelectIndex == 0)
    {
        return [[FactoryModel shareFactoryModel] getFirstViewController];
    }
    if(newSelectIndex == 1)
    {
        return [[FactoryModel shareFactoryModel] getSecondViewController];
    }
    if(newSelectIndex == 3)
    {
        return [[FactoryModel shareFactoryModel] getThirdViewController];
    }
    if(newSelectIndex == 4)
    {
        return [[FactoryModel shareFactoryModel] getFourthViewController];
    }
    return nil;
}

#pragma mark show login
- (void)showLoginViewController:(NSNotification *)aNotification
{
    
    if(aNotification.object)
    {
        isGoBack = [[aNotification object] boolValue]; ///yes为goback  其他的不处理
    }
    __weak RootTabBarController *weakself = self;
    if (![YHBUser sharedYHBUser].isLogin)
    {
        if(!self.loginVC)
        {
            self.loginVC = [[RLViewController alloc] init];
        }
        if(!self.loginNav)
        {
            self.loginNav = [[LSNavigationController alloc] initWithRootViewController:self.loginVC];
            
        }

        [self presentViewController:self.loginNav animated:YES completion:^{
            
        }];
        if(!loginObserver)
        {
            loginObserver = [[FBKVOController alloc] initWithObserver:self];
        }
        [loginObserver observe:self.loginVC keyPath:@"type" options:NSKeyValueObservingOptionNew block:^(id observer, id object, NSDictionary *change) {
            int type = [[change objectForKey:@"new"] intValue];
            if(type == eLoginSucc)
            {

            }
            else if(type == eLoginBack)
            {
                if(isGoBack)
                {
                    weakself.selectedIndex = oldSelectIndex;
                    isGoBack = NO;
                }
            }
            [weakself.loginNav dismissViewControllerAnimated:YES completion:^{
                
            }];
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
