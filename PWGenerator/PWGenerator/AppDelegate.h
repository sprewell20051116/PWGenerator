//
//  AppDelegate.h
//  PWGenerator
//
//  Created by GIGIGUN on 2015/8/22.
//  Copyright (c) 2015年 GIGIGUN. All rights reserved.
//

#import <UIKit/UIKit.h>

#define PLIST_SETTING_VERSION_KEY   @"Version"
#define PLIST_SETTING_USER_NAME_KEY @"UserName"
#define PLIST_SETTING_TUTORIAL_KEY  @"SeenTutor"
#define PLIST_SETTING_PW_LENGTH_KEY @"PWLength"

#define TUTORIAL_NOTIFICATION_KEY @"TUTORIAL_NOTIFICATION_KEY"


@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;

-(NSMutableDictionary*) Read_SettingList;
-(BOOL) Write_SettingListWithDictionary : (NSDictionary*) plistDic;


#pragma mark -
#pragma mark Plist Methods
-(void) Plist_SettingTutorialSeen;
-(BOOL) Plist_GetTutorialSeen;
-(void) Plist_SetUserName : (NSString *) UserNameStr;
-(NSString*) Plist_GetUserName;
-(void) Plist_SetPWLength : (NSInteger) Length;
-(NSNumber*) Plist_GetPWLength;

@end



