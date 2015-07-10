//
//  EditPhotoViewController.m
//  YHB_Prj
//
//  Created by Johnny's on 15/6/27.
//  Copyright (c) 2015年 striveliu. All rights reserved.
//

#import "EditPhotoViewController.h"
#import "SVProgressHUD.h"
#define kImgHeightThis (kMainScreenWidth-60)/2

@interface EditPhotoViewController ()<UITextFieldDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIActionSheetDelegate>
{
    UIScrollView *bgScrollView;
    
    UIImageView *topImgView;
    UITextField *titleTextfield;
    UITextField *detailTextfield;
    UIImage *bgImg;
    NSMutableArray *myPhotoArray;
    UIButton *addBtn;
    
    UIScrollView *btnScrollView;
    CGPoint oldPoint;
}

@end

@implementation EditPhotoViewController

- (instancetype)initWithBgImg:(UIImage *)aBgImg
{
    if (self = [super init]) {
        bgImg = aBgImg;
        myPhotoArray = [NSMutableArray new];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self settitleLabel:@"编辑内容"];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setRightButton:nil title:@"发表" target:self action:@selector(push)];
    
    bgScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, kMainScreenHeight-62)];
    [self.view addSubview:bgScrollView];
    
    topImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, kMainScreenWidth)];
    [bgScrollView addSubview:topImgView];
    
    topImgView.image = bgImg;
    
    UIView *textfieldView = [[UIView alloc] initWithFrame:CGRectMake(20, topImgView.bottom-60, kMainScreenWidth-40, 40)];
    textfieldView.layer.borderWidth = 0.5;
    textfieldView.layer.borderColor = [[UIColor blackColor] CGColor];
    [bgScrollView addSubview:textfieldView];
    
    titleTextfield = [[UITextField alloc] initWithFrame:CGRectMake(10, 0, kMainScreenWidth-60, 40)];
    titleTextfield.font = kFont16;
    [titleTextfield setTextColor:[UIColor whiteColor]];
    titleTextfield.placeholder = @"标题";
    titleTextfield.delegate =self;
    titleTextfield.returnKeyType = UIReturnKeyDone;
    [textfieldView addSubview:titleTextfield];
    
    detailTextfield = [[UITextField alloc] initWithFrame:CGRectMake(20, topImgView.bottom+20, kMainScreenWidth-40, 25)];
    detailTextfield.textColor = [UIColor blackColor];
    detailTextfield.font = kFont12;
    detailTextfield.placeholder = @"说说我的故事";
    detailTextfield.delegate = self;
    detailTextfield.returnKeyType = UIReturnKeyDone;
    [bgScrollView addSubview:detailTextfield];
    
    btnScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, detailTextfield.bottom+28, kMainScreenWidth, kImgHeightThis)];
    btnScrollView.showsHorizontalScrollIndicator = NO;
//    btnScrollView.alwaysBounceHorizontal = NO;
    [bgScrollView addSubview:btnScrollView];
    
    addBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 0, kImgHeightThis, kImgHeightThis)];
    [addBtn addTarget:self action:@selector(addPhoto) forControlEvents:UIControlEventTouchDown];
    addBtn.layer.borderColor = [[UIColor blackColor] CGColor];
    addBtn.layer.borderWidth = 0.5;
    addBtn.backgroundColor = [UIColor blackColor];
    [btnScrollView addSubview:addBtn];
    
    bgScrollView.contentSize = CGSizeMake(kMainScreenWidth, btnScrollView.bottom+40);
}

- (void)addPhoto
{
    [self plusImageClicked];
}

- (void)push
{
    [SVProgressHUD showSuccessWithStatus:@"发布成功" cover:YES offsetY:kMainScreenHeight/2.0];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)reloadScrollView
{
    [btnScrollView removeSubviews];
    int width = 20;
    for (int i=0; i<myPhotoArray.count; i++)
    {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(20+(20+kImgHeightThis)*i, 0, kImgHeightThis, kImgHeightThis)];
        UIImage *img = [myPhotoArray objectAtIndex:i];
        imgView.image = img;
        imgView.userInteractionEnabled = YES;
        [btnScrollView addSubview:imgView];
        
        UIButton *deleteBtn = [[UIButton alloc] initWithFrame:CGRectMake(kImgHeightThis-30, 10, 20, 20)];
        deleteBtn.backgroundColor = [UIColor yellowColor];
        deleteBtn.tag = 200+i;
        [deleteBtn addTarget:self action:@selector(touchDetele:) forControlEvents:UIControlEventTouchDown];
        [imgView addSubview:deleteBtn];
        
        width += 20+kImgHeightThis;
    }

    addBtn = [[UIButton alloc] initWithFrame:CGRectMake(width, 0, kImgHeightThis, kImgHeightThis)];
    [addBtn addTarget:self action:@selector(addPhoto) forControlEvents:UIControlEventTouchDown];
    addBtn.layer.borderColor = [[UIColor blackColor] CGColor];
    addBtn.layer.borderWidth = 0.5;
    addBtn.backgroundColor = [UIColor blackColor];
    [btnScrollView addSubview:addBtn];
    
    if (myPhotoArray.count<4)
    {
        btnScrollView.contentSize = CGSizeMake(width+20+kImgHeightThis, kImgHeightThis);
        addBtn.hidden = NO;
    }
    else
    {
        btnScrollView.contentSize = CGSizeMake(width, kImgHeightThis);
        addBtn.hidden = YES;
    }
}

- (void)touchDetele:(UIButton *)aBtn
{
    int index = (int)aBtn.tag-200;
    [myPhotoArray removeObjectAtIndex:index];
    [self reloadScrollView];
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
    [myPhotoArray addObject:image];
    [self reloadScrollView];
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

#pragma mark 键盘代理
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(keyboardWillShow:)
                                                name:UIKeyboardWillShowNotification
                                              object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(keyboardWillHide:)
                                                name:UIKeyboardWillHideNotification
                                              object:nil];
    return YES;
}

- (void)keyboardWillHide:(NSNotification *)notification
{
    bgScrollView.contentOffset = CGPointMake(0, 20);
}

- (void)keyboardWillShow:(NSNotification *)notification
{
    oldPoint = bgScrollView.contentOffset;
    bgScrollView.contentOffset = CGPointMake(0, detailTextfield.top-30);
}

- (void)viewWillDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [titleTextfield resignFirstResponder];
    [detailTextfield resignFirstResponder];
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
