//
//  AppDelegate.m
//  PWGenerator
//
//  Created by GIGIGUN on 2015/8/22.
//  Copyright (c) 2015年 GIGIGUN. All rights reserved.
//

#import "AppDelegate.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [self init_pList];
    
//    if (nil == [[self Read_SettingList] objectForKey:PLIST_SETTING_TUTORIAL_KEY]) {
//        // TODO: set init page to Tutorial page
//        PWTutorialPageViewController *TutorPageVC = [[PWTutorialPageViewController alloc] init];
//        self.window.rootViewController = TutorPageVC;
//
//    }
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark -
#pragma mark Private Methods

-(void) init_pList
{
    NSString *destPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    destPath = [destPath stringByAppendingPathComponent:@"PWSetting.plist"]; // If the file doesn't exist in the Documents Folder, copy it.
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath:destPath]) {
        NSString *sourcePath = [[NSBundle mainBundle] pathForResource:@"PWSetting" ofType:@"plist"];
        [fileManager copyItemAtPath:sourcePath toPath:destPath error:nil];
    }
    
    NSMutableDictionary *plistDict;
    if ([fileManager fileExistsAtPath:destPath]) //檢查檔案是否存在
    {
        plistDict = [[NSMutableDictionary alloc] initWithContentsOfFile:destPath];
    }else{
        plistDict = [[NSMutableDictionary alloc] init];
    }
    
    //NSLog(@"[cc] test %@", plistDict);
}

-(NSMutableDictionary*) Read_SettingList
{
    NSString *destPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    destPath = [destPath stringByAppendingPathComponent:@"PWSetting.plist"]; // If the file doesn't exist in the Documents Folder, copy it.
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSMutableDictionary *plistDict;
    
    if ([fileManager fileExistsAtPath:destPath]) //檢查檔案是否存在
    {
        plistDict = [[NSMutableDictionary alloc] initWithContentsOfFile:destPath];
    }
    
    return plistDict;
}


-(BOOL) Write_SettingListWithDictionary : (NSDictionary*) plistDic
{
    
    NSString *destPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    destPath = [destPath stringByAppendingPathComponent:@"PWSetting.plist"]; // If the file doesn't exist in the Documents Folder, copy it.
    NSFileManager *fileManager = [NSFileManager defaultManager];

    if ([fileManager fileExistsAtPath:destPath]) {
        
        if ([plistDic writeToFile:destPath atomically: YES]) {
            
            return YES;
            
        } else {
            
            return NO;
        }

    } else {
        NSLog(@"File not exist");
        return NO;
    }
    
}


-(void) Plist_SettingTutorialSeen
{
    NSMutableDictionary *Dic = [self Read_SettingList];
    [Dic setObject:[NSNumber numberWithBool:YES] forKey:PLIST_SETTING_TUTORIAL_KEY];
    [self Write_SettingListWithDictionary:Dic];
}

-(BOOL) Plist_GetTutorialSeen
{
    if (nil == [[self Read_SettingList] objectForKey:PLIST_SETTING_TUTORIAL_KEY]) {
        return NO;
    } else {
        return [[[self Read_SettingList] objectForKey:PLIST_SETTING_TUTORIAL_KEY] boolValue];
    }
}

-(void) Plist_SetUserName : (NSString *) UserNameStr
{
    NSMutableDictionary *Dic = [self Read_SettingList];
    [Dic setObject:UserNameStr forKey:PLIST_SETTING_USER_NAME_KEY];
    [self Write_SettingListWithDictionary:Dic];
}


-(NSString*) Plist_GetUserName
{
    if (nil == [[self Read_SettingList] objectForKey:PLIST_SETTING_USER_NAME_KEY]) {
        return nil;
    } else {
        return [[self Read_SettingList] objectForKey:PLIST_SETTING_USER_NAME_KEY];
    }
}


-(void) Plist_SetPWLength : (NSInteger) Length
{
    NSMutableDictionary *Dic = [self Read_SettingList];
    [Dic setObject:[NSNumber numberWithInteger:Length] forKey:PLIST_SETTING_PW_LENGTH_KEY];
    [self Write_SettingListWithDictionary:Dic];
}


-(NSNumber*) Plist_GetPWLength
{
    if (nil == [[self Read_SettingList] objectForKey:PLIST_SETTING_PW_LENGTH_KEY]) {
        return nil;
    } else {
        return [[self Read_SettingList] objectForKey:PLIST_SETTING_PW_LENGTH_KEY];
    }
}




@end
