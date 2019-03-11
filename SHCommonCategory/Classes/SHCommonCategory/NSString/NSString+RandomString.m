//
//  NSString+RandomString.m
//   
//
//  Created by Dreamhigh66 on 15/10/9.
//  Copyright © 2015年 cn.com.dreamhigh. All rights reserved.
//

#import "NSString+RandomString.h"
#import "NSString+MD5Addition.h"


@implementation NSString (RandomString)

+ (NSString *)defautToken
{
    NSString *UUID = [[NSUUID UUID] UUIDString];
    NSString *MD5 = [UUID stringFromMD5];
    NSString *result = [NSString stringWithFormat:@"%@iosdefault", [MD5 substringWithRange:NSMakeRange(0, 22)]];
    return result;
}

@end
