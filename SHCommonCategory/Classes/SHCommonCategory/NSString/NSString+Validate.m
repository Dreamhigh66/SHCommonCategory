//
//  NSString+Validate.m
//   
//
//  Created by Dreamhigh66 on 15/10/15.
//  Copyright © 2015年 cn.com.dreamhigh. All rights reserved.
//

#import "NSString+Validate.h"

@implementation NSString (Validate)

+ (BOOL)isEmpty:(NSString *)string
{
    if (!string || [string isEqualToString:@""]) {
        return YES;
    } else {
        return NO;
    }
}

+ (BOOL)isEmptySpace:(NSString *)str {
    if (!str) {
        return YES;
    } else {
        NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        NSString *trimedString = [str stringByTrimmingCharactersInSet:set];
        if ([trimedString length] == 0) {
            return YES;
        } else {
            return NO;
        }
    }
}

+ (NSString *)transformInvalidateString:(NSString *)string
{
    if (!string) {
        return @"";
    }
    if (![string isKindOfClass:[NSString class]]) {
        return [NSString stringWithFormat:@"%@", string];
    }
    return string;
}

+ (BOOL)isUrl:(NSString *)url
{
    NSString *      regex = @"http(s)?:\\/\\/([\\w-]+\\.)+[\\w-]+(\\/[\\w- .\\/?%&=]*)?";
    NSPredicate *   pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:url];
}

@end
