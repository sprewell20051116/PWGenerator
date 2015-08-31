//
//  TutorPageViewController.m
//  PWGenerator
//
//  Created by GIGIGUN on 2015/8/31.
//  Copyright (c) 2015年 GIGIGUN. All rights reserved.
//

#import "TutorPageViewController.h"
#import "TutorPage1ViewController.h"
#import "TutorPage2ViewController.h"
#import "TutorPage3ViewController.h"

@interface TutorPageViewController () <UIPageViewControllerDataSource, UIPageViewControllerDelegate> {
    NSArray *_TutorViewArray;
    NSInteger CurrentIndex;
}

@end

@implementation TutorPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [self.view setBackgroundColor:[UIColor clearColor]];
    self.dataSource = self;
    self.delegate = self;
    CurrentIndex = 0;
    
    TutorPage1ViewController *Page1 = [self.storyboard instantiateViewControllerWithIdentifier:@"TutorPage1ViewController"];
    TutorPage2ViewController *Page2 = [self.storyboard instantiateViewControllerWithIdentifier:@"TutorPage2ViewController"];
    TutorPage3ViewController *Page3 = [self.storyboard instantiateViewControllerWithIdentifier:@"TutorPage3ViewController"];
    
    _TutorViewArray = @[Page1, Page2, Page3];
    NSLog(@"%@, %@", Page1, Page2);
    [self setViewControllers:@[Page1] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Page View Controller Data Source
-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController
     viewControllerBeforeViewController:(UIViewController *)viewController
{
    if ([viewController isKindOfClass:[TutorPage2ViewController class]]) {
        return _TutorViewArray[0];
    } else if ([viewController isKindOfClass:[TutorPage3ViewController class]]) {
        return _TutorViewArray[1];
    }
    else
        return nil;
}


-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    
    if ([viewController isKindOfClass:[TutorPage1ViewController class]]) {
        return _TutorViewArray[1];
    } else if ([viewController isKindOfClass:[TutorPage2ViewController class]]) {
        return _TutorViewArray[2];
    }
    else return nil;
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [_TutorViewArray count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

-(IBAction)Dissmiss:(id)sender
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
