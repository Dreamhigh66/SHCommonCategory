//
//  NSString+Emoji.m
//
//  Created by Dreamhigh66 on 2018/3/30.
//  Copyright © 2018年 cn.com.dreamhigh. All rights reserved.
//

#import "NSString+Emoji.h"

@implementation NSString (Emoji)

//利用下面这个方法stringContainsEmoji可以限制系统键盘自带的表情

- (BOOL)stringContainsEmoji{
    
    __block BOOL returnValue = NO;
    
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:
     ^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
//         NSLog(@"substring =========%@lenth ===%d",substring,substring.length);
         const unichar hs = [substring characterAtIndex:0];
//         NSLog(@"unichar hs ======%d",hs);
         // surrogate pair
         if (0xd800 <= hs && hs <= 0xdbff) {
             if (substring.length > 1) {
                 const unichar ls = [substring characterAtIndex:1];
                 const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                 if (0x1d000 <= uc && uc <= 0x1f77f) {
                     returnValue = YES;
                 }
             }
         } else if (substring.length > 1) {
             const unichar ls = [substring characterAtIndex:1];
//             NSLog(@"ls ========%d",ls);
             if (ls == 0x20e3 || ls == 0xfe0f) {
//                 NSLog(@"0x260e ========%d",ls);
                 returnValue = YES;
             }
         } else {
             // non surrogate
             if (0x2100 <= hs && hs <= 0x27ff) {
                 returnValue = YES;
             } else if (0x2B05 <= hs && hs <= 0x2b07) {
                 returnValue = YES;
             } else if (0x2934 <= hs && hs <= 0x2935) {
                 returnValue = YES;
             } else if (0x3297 <= hs && hs <= 0x3299) {
                 returnValue = YES;
             } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                 returnValue = YES;
             }
         }
     }];
//    NSLog(@"returnValue ======%@,%d",self,returnValue);
    return returnValue;
}

//利用下面这个方法hasEmoji可以限制第三方键盘（常用的是搜狗键盘）的表情

- (BOOL)hasEmoji
{
    NSString *pattern = @"[^\\u0020-\\u007E\\u00A0-\\u00BE\\u2E80-\\uA4CF\\uF900-\\uFAFF\\uFE30-\\uFE4F\\uFF00-\\uFFEF\\u0080-\\u009F\\u2000-\\u201f\r\n]";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:self];
    
//    NSLog(@" isMath ======%@%d",self,isMatch);
    return isMatch;
}
//上面这2个方法就可以完全限制住键盘输入所有的表情。但是今天突然发现系统自带的键盘九宫格输入汉字不能使用了
/**
 判断是不是九宫格
 @return YES(是九宫格拼音键盘)
 */
- (BOOL)isNineKeyBoard
{
    NSString *other = @"➋➌➍➎➏➐➑➒";
    int len = (int)self.length;
    for(int i=0;i<len;i++){
        if(!([other rangeOfString:self].location != NSNotFound))
            return NO;
    }
    return YES;
}

@end
