//
//  AddBGViewController.m
//  YHB_Prj
//
//  Created by Johnny's on 15/7/4.
//  Copyright (c) 2015年 striveliu. All rights reserved.
//

#import "AddBGViewController.h"
#define kThisGrayColor

@interface AddBGViewController ()<UITextFieldDelegate>
{
    UITextField *comTF;
    UITextField *jobTF;
    UITextField *feelTF;
    UILabel *timeLabel;
    UITextField *startTF;
    UITextField *endTF;
    UITextField *nowTimeTF;
    UITextField *oldTimeTF;
    UIButton *sureBtn;
}
@property(nonatomic, strong) UIDatePicker *datePicker;
@end

@implementation AddBGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"添加背景";
    [self createView];
}

- (void)createView
{
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, 198+0.25)];
    bgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgView];
    
    kCreateTextField(comTF, CGRectMake(20, 0, kMainScreenWidth-20, 44), @"请输入公司/学校名称", 16);
    comTF.delegate = self;
    comTF.returnKeyType = UIReturnKeyDone;
    [bgView addSubview:comTF];
    
    UIView *line1 = [self createLineView:CGRectMake(12, comTF.bottom, kMainScreenWidth-12, 0.25) lineColor:[UIColor lightGrayColor]];
    [bgView addSubview:line1];
    
    kCreateLabel(timeLabel, CGRectMake(comTF.left, comTF.bottom+11, kMainScreenWidth-comTF.left, 19), 15, RGBCOLOR(204, 204, 204), @"请选择在职/在校时间:");
    [bgView addSubview:timeLabel];
    
    kCreateTextField(startTF, CGRectMake(timeLabel.left, timeLabel.bottom+5, 85, 20), @"02/06/2013", 16);
    startTF.tag=1001;
    startTF.delegate = self;
    [bgView addSubview:startTF];
    
    UIView * widthLine = [[UIView alloc] initWithFrame:CGRectMake(startTF.right+1, startTF.top+10, 10, 1)];
    widthLine.backgroundColor = [UIColor blackColor];
    [bgView addSubview:widthLine];
    
    kCreateTextField(endTF, CGRectMake(widthLine.right+1, startTF.top, startTF.width, startTF.height), @"08/05/2015", 16);
    endTF.tag=1002;
    endTF.delegate = self;
    [bgView addSubview:endTF];
    
    UIView *line2 = [self createLineView:CGRectMake(12, startTF.bottom+11, line1.width, line1.height) lineColor:[UIColor lightGrayColor]];
    [bgView addSubview:line2];
    
    kCreateTextField(jobTF, CGRectMake(comTF.left, line2.bottom-line2.height, comTF.width, comTF.height), @"请输入您的岗位/专业信息", 16);
    jobTF.delegate = self;
    [bgView addSubview:jobTF];
    
    UIView *line3 = [self createLineView:CGRectMake(12, jobTF.bottom, line1.width, line1.height) lineColor:[UIColor lightGrayColor]];
    [bgView addSubview:line3];
    
    kCreateTextField(feelTF, CGRectMake(jobTF.left, jobTF.bottom, comTF.width, comTF.height), @"说说你在这里的职责和感受吧", 16);
    feelTF.delegate = self;
    [bgView addSubview:feelTF];
    
    UIView *line4 = [self createLineView:CGRectMake(0, feelTF.bottom, kMainScreenWidth, line1.height) lineColor:[UIColor lightGrayColor]];
    [bgView addSubview:line4];
    
    self.datePicker = [[UIDatePicker alloc] init];
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    self.datePicker.minuteInterval = 30;
    self.datePicker.backgroundColor = [UIColor whiteColor];
    [self.datePicker addTarget:self action:@selector(chooseDate:) forControlEvents:UIControlEventValueChanged];
    
    kCreateButton(sureBtn, CGRectMake(12, bgView.bottom+25, kMainScreenWidth-24, 40), @"确定", nil, nil, 14, [UIColor whiteColor]);
    sureBtn.backgroundColor = kBlueColor;
    sureBtn.layer.cornerRadius = 2.5;
    [self.view addSubview:sureBtn];
}

- (void)chooseDate:(UIDatePicker *)sender {
    NSDate *selectedDate = sender.date;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"MM/dd/yyyy";
    NSString *dateString = [formatter stringFromDate:selectedDate];
    nowTimeTF.text = dateString;
}

- (UIView *)createLineView:(CGRect)aFrame lineColor:(UIColor *)aColor
{
    UIView *lineView = [[UIView alloc] initWithFrame:aFrame];
    lineView.backgroundColor = aColor;
    
    return lineView;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    //如果当前要显示的键盘，那么把UIDatePicker（如果在视图中）隐藏
    if (textField.tag != 1001 && textField.tag !=1002)
    {
        if (self.datePicker.superview) {
            [self.datePicker removeFromSuperview];
        }
        return YES;
    }
//    oldTimeTF = nowTimeTF;
//    if (textField.tag == 1001)
//    {
//        nowTimeTF = startTF;
//    }
//    if (textField.tag == 1002)
//    {
//        nowTimeTF = endTF;
//    }
    
    //UIDatePicker以及在当前视图上就不用再显示了
    if (self.datePicker.superview == nil) {
        //close all keyboard or data picker visible currently
        [comTF resignFirstResponder];
//        [self.testLocationField resignFirstResponder];
//        [self.testOtherField resignFirstResponder];
        
        //此处将Y坐标设在最底下，为了一会动画的展示
        self.datePicker.frame = CGRectMake(0, kMainScreenHeight, kMainScreenWidth, 216);
        [self.view addSubview:self.datePicker];
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.3f];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        self.datePicker.bottom -= self.datePicker.height;
        [UIView commitAnimations];
    }
    
    return NO;
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
