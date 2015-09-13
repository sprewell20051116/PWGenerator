//
//  TutorPage3ViewController.m
//  PWGenerator
//
//  Created by GIGIGUN on 2015/8/31.
//  Copyright (c) 2015年 GIGIGUN. All rights reserved.
//

#import "TutorPage3ViewController.h"
#import "AppDelegate.h"
@interface TutorPage3ViewController () {
    UITextField *_ActiveTextField;
}
@property (strong, nonatomic) IBOutlet UILabel *TitleLab;
@property (strong, nonatomic) IBOutlet UITextField *PWlengthTextField;

@end

@implementation TutorPage3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self SetLayerUnderlineWithTextField:_PWlengthTextField];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) SetLayerUnderlineWithTextField : (UITextField *) textField
{
    
    CALayer *bottomBorder = [CALayer layer];
    textField.backgroundColor = [UIColor clearColor];
    bottomBorder.frame = CGRectMake(0.0f, textField.frame.size.height - 1, textField.frame.size.width, 1.0f);
    bottomBorder.backgroundColor = [UIColor whiteColor].CGColor;
    [textField.layer addSublayer:bottomBorder];
}


#pragma mark -
#pragma mark UITextField Delegate
- (void) textFieldDidBeginEditing:(UITextField *)textField {
    _ActiveTextField = textField;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    //NSLog(@" textFieldDidEndEditing %d", [_AuthTypePicker selectedRowInComponent:0]);
    //    if (textField.tag == UserAuth_AuthType_Tag) {
    //
    //        NSInteger PickerSelected = [_AuthTypePicker selectedRowInComponent:0];
    //        textField.text = _UserAuthTypeArray[PickerSelected];
    //        [self SLUserAuth_SetUserAuthType:(USER_AUTH_TYPE) PickerSelected];
    //    }
    
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    [appDelegate Plist_SetPWLength:[textField.text integerValue]];
}



- (void) closeKeyboard {
    if (_ActiveTextField) {
        [_ActiveTextField resignFirstResponder];
    }
}


- (IBAction) closeKeyboard:(UIGestureRecognizer *)sender {
    /*
     for(UIView *child in self.view.subviews) {
     if ([child isKindOfClass:UITextField.class]) {
     [child resignFirstResponder];
     }
     }
     */
    [self closeKeyboard];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self closeKeyboard];
    return YES;
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
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    [appDelegate Plist_SetPWLength:[_PWlengthTextField.text integerValue]];

    NSDictionary *UserInfoDic = [[NSDictionary alloc] initWithObjectsAndKeys:
                                 [appDelegate Plist_GetUserName], PLIST_SETTING_USER_NAME_KEY,
                                 [NSNumber numberWithInteger:[_PWlengthTextField.text integerValue]], PLIST_SETTING_PW_LENGTH_KEY,
                                 nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:TUTORIAL_NOTIFICATION_KEY object:self userInfo:UserInfoDic];
    
}
@end
