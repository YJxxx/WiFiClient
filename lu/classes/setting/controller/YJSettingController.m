//
//  YJSettingController.m
//  lu
//
//  Created by Eric on 2017/1/7.
//  Copyright © 2017年 Eric. All rights reserved.
//

#import "YJSettingController.h"
@interface YJSettingController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIView *textFieldView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *viewTopC;
@property (weak, nonatomic) IBOutlet UITextField *textField1;
@property (weak, nonatomic) IBOutlet UITextField *textField2;
@property (weak, nonatomic) IBOutlet UITextField *textField3;
@property (weak, nonatomic) IBOutlet UITextField *textField4;
@property (weak, nonatomic) IBOutlet UITextField *textField5;
@property (weak, nonatomic) IBOutlet UITextField *textField6;
@property (assign, nonatomic) CGFloat keyboardH;
@property (assign, nonatomic) CGFloat animationDurationShow;
@property (assign, nonatomic) CGFloat animationDurationHide;
@end

@implementation YJSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textField1.delegate = self;
    self.textField2.delegate = self;
    self.textField3.delegate = self;
    self.textField4.delegate = self;
    self.textField5.delegate = self;
    self.textField6.delegate = self;


}



#pragma mark  - 返回登陆界面
- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - UITextFieldDelegate
-(void)textFieldDidEndEditing:(UITextField *)textField {
    [textField resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

  

@end
