//
//  NSString+Contact.h
//
//  Created by yongTao on 16/7/8.
//  Copyright © 2016年 dreamhigh. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, SHContactOptions) {
    
    SHContactOptionsHandleNormalPrefix,           //  默认的处理 以*前面长度为准
    SHContactOptionsHandleNormalSuffix,           //  默认的处理 以*后面的长度为准
    SHContactOptionsAsLittleAsPossible,           //  尽可能少的处理
    SHContactOptionsHandleAsMuchAsPossible,       //  尽可能多的处理
    
};

@interface NSString (Contact)

/**
 *  手机号安全处理
 *  @return 如果可以处理 处理过后的手机号码 如果不可以处理 原手机号码
 */
- (NSString *)phoneNumberReplaceCharacters;

/**
 *  @param length *前面和后面要显示的数字长度
 */
- (NSString *)phoneNumberReplaceCharactersWithLength:(NSUInteger)length;

/**
 *  @param prefixLength *前长度
 *  @param suffixLength *后长度
 */
- (NSString *)phoneNumberReplaceCharactersWithprefixLength:(NSUInteger)prefixLength suffixLength:(NSUInteger)suffixLength;

/**
 *  邮箱账号安全处理
 *
 *  @param length 前后要显示的字符的长度
 *  @param string 用来代替隐藏部分的字符
 *
 *  @return 如果可以处理 处理过后的邮箱账号 如果不可以处理 原邮箱账号
 */
- (NSString *)eMailReplaceCharactersWithLength:(NSUInteger)length string:(NSString *)string;

/**
 *  邮箱账号安全处理
 *
 *  @param length  前后要显示的字符的长度
 *  @param string  用来代替隐藏部分的字符
 *  @param options 处理选项
 *
 *  @return 如果可以处理 处理过后的邮箱账号 如果不可以处理 原邮箱账号
 */
- (NSString *)eMailReplaceCharactersWithLength:(NSUInteger)length string:(NSString *)string options:(SHContactOptions)options;

/**
 *  邮箱账号安全处理
 *
 *  @param prefixLength 邮箱账号开头部分要显示的字符长度
 *  @param suffixLength 邮箱账号@前面要显示的字符长度
 *  @param string       用来代替隐藏部分的字符
 *  @param options      处理选项
 *
 *  @return 如果可以处理 处理过后的邮箱账号 如果不可以处理 原邮箱账号
 */
- (NSString *)eMailReplaceCharactersWithprefixLength:(NSUInteger)prefixLength suffixLength:(NSUInteger)suffixLength string:(NSString *)string options:(SHContactOptions)options;


@end
