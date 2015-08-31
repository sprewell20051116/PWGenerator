//
//  PWSettingViewController.m
//  PWGenerator
//
//  Created by GIGIGUN on 2015/8/25.
//  Copyright (c) 2015年 GIGIGUN. All rights reserved.
//

#import "AppDelegate.h"
#import "PWSettingViewController.h"
#import "TutorPageViewController.h"

@interface PWSettingViewController ()
@property (strong, nonatomic) TutorPageViewController *TutorPageVC;
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

- (IBAction)OpenTutorialClicked:(id)sender {
    _TutorPageVC = [self.storyboard instantiateViewControllerWithIdentifier:@"TutorPageViewController"];
    [self RegisterNotification_TutorialDone];
    [self presentViewController:_TutorPageVC animated:YES completion:nil];
    
}

- (void) RegisterNotification_TutorialDone
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification1) name:TUTORIAL_NOTIFICATION_KEY object:nil];
}

-(void) receiveNotification1
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [_TutorPageVC Dissmiss:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:TUTORIAL_NOTIFICATION_KEY object:nil];
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
