//
//  NSString+FormartJSONString.h
//   
//
//  Created by HG on 15/12/15.
//  Copyright © 2015年 cn.com.dreamhigh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (FormartJSONString)

/**
 * 清除json中多余的转义字符 \
 */
+ (NSString *)clearJSONFormart:(NSString *)str;

/**
 * 重新给json 字符串添加 格式
 */
+ (NSString *)formatJSON:(NSString *)str;

/**
 * 将json字典直接转化为格式好的json字符串
 */
+ (NSString *)JSONStringForDictionary:(NSDictionary *)dictionary;

+ (NSString *)JSONStringNoFormartForDictionary:(NSDictionary *)dictionary;
@end
