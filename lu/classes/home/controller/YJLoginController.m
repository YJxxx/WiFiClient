//
//  YJLoginController.m
//  lu
//
//  Created by Eric on 2017/1/7.
//  Copyright © 2017年 Eric. All rights reserved.
//

#import "YJLoginController.h"
#import "YJHomeController.h"
#import "YJSettingController.h"
@interface YJLoginController ()

@end

@implementation YJLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)homeBtn:(id)sender {
    UIStoryboard *homeStoryboard = [UIStoryboard storyboardWithName:@"YJHomeController" bundle:nil];
      YJHomeController *homeC = [homeStoryboard instantiateViewControllerWithIdentifier:@"homeStoryboard"];
    [self presentViewController:homeC animated:YES completion:nil];
}
- (IBAction)settingBtn:(id)sender {
    UIStoryboard *settingStoryboard = [UIStoryboard storyboardWithName:@"YJSettingController" bundle:nil];
    YJSettingController *settingC = [settingStoryboard instantiateViewControllerWithIdentifier:@"SettingController"];
    [self presentViewController:settingC animated:YES completion:nil];
}

@end
