//
//  NSString+PhoneNum.m
//   
//
//  Created by Dreamhigh66 on 16/3/24.
//  Copyright © 2016年 cn.com.dreamhigh. All rights reserved.
//

#import "NSString+PhoneNum.h"

typedef NS_OPTIONS(NSUInteger, IphonePreType)
{
    preTypeFir = 1,                         //+86开头
    preTypeSec,                             //86开头
    preTypeThir,
};


@implementation NSString(PhoneNum)

- (BOOL)isMobileNumber
{
    if (self.length != 11)
    {
        return NO;
    }
    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|70)\\d{8}$";
    NSString *CM = @"(^1(3[4-9]|4[7]|5[0-27-9]|7[8]|8[2-478])\\d{8}$)|(^1705\\d{7}$)";
    NSString *CU = @"(^1(3[0-2]|4[5]|5[56]|7[6]|8[56])\\d{8}$)|(^1709\\d{7}$)";
    NSString *CT = @"(^1(33|53|77|8[019])\\d{8}$)|(^1700\\d{7}$)";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:self] == YES)
        || ([regextestcm evaluateWithObject:self] == YES)
        || ([regextestct evaluateWithObject:self] == YES)
        || ([regextestcu evaluateWithObject:self] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

- (IphonePreType)iphonePreTypeIphoneString:(NSString *)iphoneString
{
    if ([iphoneString hasPrefix:@"+86"]) {
        return preTypeFir;
    } else if ([iphoneString hasPrefix:@"86"]) {
        return preTypeSec;
    }
    return preTypeThir;
}

- (NSString *)filterSpaceFromIphoneString
{
    NSString *tmpString = [NSString stringWithString:self];
    tmpString = [tmpString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSMutableString *mutableTmpString = [tmpString mutableCopy];
    switch ([self iphonePreTypeIphoneString:tmpString]) {
        case preTypeFir:
            [mutableTmpString deleteCharactersInRange:NSMakeRange(0, 3)];
            break;
        case preTypeSec:
            [mutableTmpString deleteCharactersInRange:NSMakeRange(0, 2)];
            break;
        default:
            break;
    }
    NSCharacterSet *setToRemove = [[ NSCharacterSet characterSetWithCharactersInString:@"0123456789"]
                                   invertedSet];
    NSString *strPhone = [[mutableTmpString componentsSeparatedByCharactersInSet:setToRemove] componentsJoinedByString:@""];
    return strPhone;
}

- (NSString *)spaceMobile
{
    NSString *str1 = [self substringWithRange:NSMakeRange(0, 3)];
    NSString *str2 = [self substringWithRange:NSMakeRange(3, 4)];
    NSString *str3 = [self substringWithRange:NSMakeRange(7, 4)];
    return [NSString stringWithFormat:@"%@ %@ %@",str1,str2,str3];
}


@end
