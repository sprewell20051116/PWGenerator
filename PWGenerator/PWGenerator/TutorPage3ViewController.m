//
//  TutorPage3ViewController.m
//  PWGenerator
//
//  Created by GIGIGUN on 2015/8/31.
//  Copyright (c) 2015年 GIGIGUN. All rights reserved.
//

#import "TutorPage3ViewController.h"
#import "AppDelegate.h"
@interface TutorPage3ViewController ()

@end

@implementation TutorPage3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)TutorBtnClicked:(UIButton *)sender {
    // TODO: dismiss page view Controller
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [[NSNotificationCenter defaultCenter] postNotificationName:TUTORIAL_NOTIFICATION_KEY object:self userInfo:nil];
    
}
@end
