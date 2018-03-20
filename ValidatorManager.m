//
//  ValidatorManager.m

//
//  Created by iMac on 7/30/16.
//  Copyright © 2016 iMac. All rights reserved.
//

#import "ValidatorManager.h"

static NSString * const PATTERN_EMAIL = @"[A-Z0-9a-zА-Яа-я._%+-]+@[A-Za-z0-9А-Яа-я.-]+\\.[A-Za-zА-Яа-я]{2,4}";
static NSString * const PATTERN_NAME = @"[A-Za-zА-Яа-я. ]*";

@implementation ValidatorManager

+ (BOOL)verifyEmail:(NSString *)email{
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PATTERN_EMAIL];
    return email && [emailTest evaluateWithObject:email];
}

+ (BOOL)verifyPassword:(NSString *)password{
    return password && password.length >= 6;
}

+ (BOOL)verifyFullName:(NSString *)fullname{
    NSArray *names = [fullname componentsSeparatedByString:@" "];
    return (names.count == 2) && [self verifyName:names[0]] && [self verifyName:names[1]];
}

+ (BOOL)verifyName:(NSString *)name{
    NSPredicate *namePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PATTERN_NAME];
    BOOL isEvaluated = [namePredicate evaluateWithObject:name];
    return (name.length >= 2) && isEvaluated ? YES : NO;
}

+ (BOOL)verifyAge:(NSDate *)birthDate{
    NSDateComponents *comp = [[NSCalendar currentCalendar] components:NSCalendarUnitYear fromDate:birthDate toDate:[NSDate date] options:0];
    NSInteger years = [comp year];
    return years >= 16;
}

@end
