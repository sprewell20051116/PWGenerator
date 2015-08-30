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

#define USER_NAME_TEXTFIELD_TAG 0
#define SIMPLE_PW_TEXTFIELD_TAG 1
#define PASSWORD_LENGTH_PREFIX_STRING @"Password Length "
#define PASSWORD_DEFAULT_LENGTH 10

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"BackgroundImg.png"]]];
    [self init_UserNameTextField];
    [self init_SimplePWTextField];
    [self init_PasswordLab];
    [self init_PWLengthLab];
    [self init_SettingBtn];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) init_UserNameTextField
{
    [[UITextField appearance] setTintColor:[UIColor whiteColor]];
    _UserNameTextField.tag = USER_NAME_TEXTFIELD_TAG;
    _UserNameTextField.textColor = [UIColor whiteColor];
    _UserNameTextField.returnKeyType = UIReturnKeyDone;
    [self SetLayer_UserNameTextField];
}

-(void) init_SimplePWTextField
{
    [[UITextField appearance] setTintColor:[UIColor whiteColor]];
    _SimplePWTextField.tag = SIMPLE_PW_TEXTFIELD_TAG;
    _SimplePWTextField.textColor = [UIColor whiteColor];
    _SimplePWTextField.returnKeyType = UIReturnKeyDone;
    [self SetLayer_SimplePWTextField];
}


-(void) init_PasswordLab
{
    _PasswordLab.textAlignment = NSTextAlignmentCenter;
    _PasswordLab.textColor = [UIColor whiteColor];
    [self SetLayer_PasswordLab];
}

-(void) init_PWLengthLab
{
    _PWLengthLab.text = [NSString stringWithFormat:@"%@%d", PASSWORD_LENGTH_PREFIX_STRING, PASSWORD_DEFAULT_LENGTH];
}

-(void) init_SettingBtn
{
    [_SettingBtn addTarget:self action:@selector(SettingBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
}

-(void) init_PasswordTextView
{
    
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
    
    if (textField.tag == USER_NAME_TEXTFIELD_TAG) {
        [_UserNameLab setHidden:YES];
    } else {
        [_SimplePWLab setHidden:YES];
    }
    
    
   }

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if ([textField.text length] == 0) {
        if (textField.tag == USER_NAME_TEXTFIELD_TAG) {
            [_UserNameLab setHidden:NO];
        } else {
            [_SimplePWLab setHidden:NO];
        }
    }
    
    if ((_UserNameTextField.text.length == 0) || (_SimplePWTextField.text.length == 0)) {
        
        NSLog(@"Not to generate hash");
        _PasswordTextView.text = @"Password";
        
    } else {

        NSString *HashStr = [NSString stringWithFormat:@"%@%@", _UserNameTextField.text, _SimplePWTextField.text];
        
        if ([HashStr length] > 0) {
            _PasswordTextView.text = [[HashStr sha1] substringWithRange:NSMakeRange(0, PASSWORD_DEFAULT_LENGTH)];
        }
    }

}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if ([textField.text length] == 0) {
        if (textField.tag == USER_NAME_TEXTFIELD_TAG) {
            [_UserNameLab setHidden:NO];
        } else {
            [_SimplePWLab setHidden:NO];
        }
    }
    [textField resignFirstResponder];    
    return YES;
}


- (void) closeKeyboard
{
    [activeTextField resignFirstResponder];
}


- (IBAction) closeKeyboard:(UIGestureRecognizer *)sender {
    [self closeKeyboard];
}


-(IBAction)SettingBtnClicked:(id)sender
{
    
}


@end
