//
//  NSString+Validate.h
//   
//
//  Created by Dreamhigh66 on 15/10/15.
//  Copyright © 2015年 cn.com.dreamhigh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Validate)

+ (BOOL)isEmpty:(NSString *)string;
+ (NSString *)transformInvalidateString:(NSString *)string;
+ (BOOL)isUrl:(NSString *)url;
+ (BOOL)isEmptySpace:(NSString *)str;

@end
