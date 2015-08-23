//
//  ViewController.m
//  PWGenerator
//
//  Created by GIGIGUN on 2015/8/22.
//  Copyright (c) 2015年 GIGIGUN. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Hash.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *TestStr = @"ThisIsTest";
    
    NSLog(@"Hash result = %@", [TestStr sha1]);
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
