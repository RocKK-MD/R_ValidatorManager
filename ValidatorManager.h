//
//  ValidatorManager.h

//
//  Created by iMac on 7/30/16.
//  Copyright © 2016 iMac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ValidatorManager : NSObject

+ (BOOL)verifyEmail:(NSString *)email;
+ (BOOL)verifyPassword:(NSString *)password;
+ (BOOL)verifyFullName:(NSString *)fullname;

+ (BOOL)verifyName:(NSString *)name;
+ (BOOL)verifyAge:(NSDate *)birthDate;

@end
