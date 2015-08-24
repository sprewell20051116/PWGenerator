//
//  ViewController.m
//  PWGenerator
//
//  Created by GIGIGUN on 2015/8/22.
//  Copyright (c) 2015年 GIGIGUN. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Hash.h"
@interface ViewController () {
    UITextField *activeTextField;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"BackgroundImg.png"]]];
    [self SetLayer_UserNameTextField];
    [self SetLayer_SimplePWTextField];
    [self SetLayer_PasswordLab];
    
    NSString *TestStr = @"ThisIsTest";
    
    NSLog(@"Hash result = %@", [TestStr sha1]);
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) SetLayer_UserNameTextField
{
    
    CALayer *bottomBorder = [CALayer layer];
    bottomBorder.frame = CGRectMake(0.0f, _UserNameTextField.frame.size.height - 1, _UserNameTextField.frame.size.width, 1.0f);
    bottomBorder.backgroundColor = [UIColor whiteColor].CGColor;
    [_UserNameTextField.layer addSublayer:bottomBorder];
}

-(void) SetLayer_SimplePWTextField
{
    
    CALayer *bottomBorder = [CALayer layer];
    bottomBorder.frame = CGRectMake(0.0f, _SimplePWTextField.frame.size.height - 1, _SimplePWTextField.frame.size.width, 1.0f);
    bottomBorder.backgroundColor = [UIColor whiteColor].CGColor;
    [_SimplePWTextField.layer addSublayer:bottomBorder];
}

-(void) SetLayer_PasswordLab
{
    _PasswordLab.layer.masksToBounds = YES;
    _PasswordLab.layer.borderColor = [[UIColor whiteColor] CGColor];
    _PasswordLab.layer.cornerRadius = 3.0f;
}

#pragma mark -
#pragma mark UITextField Delegate

- (void) textFieldDidBeginEditing:(UITextField *)textField
{
    activeTextField = textField;
    NSLog(@"%s", __PRETTY_FUNCTION__);
}


- (void) closeKeyboard
{
    [activeTextField resignFirstResponder];
    NSLog(@"%s !! %@", __PRETTY_FUNCTION__, activeTextField);

}


- (IBAction) closeKeyboard:(UIGestureRecognizer *)sender {
    [self closeKeyboard];
}



@end
