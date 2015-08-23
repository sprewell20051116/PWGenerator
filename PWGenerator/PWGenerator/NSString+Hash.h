//
//  NSString+Hash.h
//  SmartLock
//
//  Created by Chauyan Wang on 8/8/15.
//  Copyright (c) 2015 WCY. All rights reserved.
//

#import <Foundation/Foundation.h>

NSString *NSStringNotNull (NSString *string);

@interface NSString (Hashes)


- (NSString *)md5;
- (NSString *)sha1;
- (NSString *)sha256;
- (NSString *)sha512;
@end
