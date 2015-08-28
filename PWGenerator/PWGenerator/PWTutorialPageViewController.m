//
//  PWTutorialPageViewController.m
//  PWGenerator
//
//  Created by GIGIGUN on 2015/8/28.
//  Copyright (c) 2015年 GIGIGUN. All rights reserved.
//

#import "PWTutorialPageViewController.h"
#import "PWPage1ViewController.h"
#import "PWPage2ViewController.h"
@interface PWTutorialPageViewController ()

@end

@implementation PWTutorialPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%s", __PRETTY_FUNCTION__);
    PWPage1ViewController *Page1= [self.storyboard instantiateViewControllerWithIdentifier:@"PWPage1ViewController"];
    PWPage2ViewController *Page2= [self.storyboard instantiateViewControllerWithIdentifier:@"PWPage2ViewController"];
    

    [self setViewControllers:[NSArray arrayWithObjects:Page1, Page2, nil]
                   direction:UIPageViewControllerNavigationDirectionForward
                    animated:YES completion:^(BOOL finished) {
    
    }];

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
