//
//  PWSettingViewController.m
//  PWGenerator
//
//  Created by GIGIGUN on 2015/8/25.
//  Copyright (c) 2015年 GIGIGUN. All rights reserved.
//

#import "PWSettingViewController.h"

@interface PWSettingViewController ()

@end

@implementation PWSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)DoneBtnClicked:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
