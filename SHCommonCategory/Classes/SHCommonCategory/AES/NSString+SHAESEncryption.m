//
//  NSString+SHAESEncryption.m
//   
//
//  Created by Dreamhigh66 on 15/12/10.
//  Copyright © 2015年 cn.com.dreamhigh. All rights reserved.
//

#import "NSString+SHAESEncryption.h"
#import "NSData+SHAESEncryption.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

#define kSHIDFV [[[UIDevice currentDevice] identifierForVendor] UUIDString]
@implementation NSString (SHAESEncryption)

- (NSString *)aesEncryptWithIDFV
{
    return [self aesEncryptWithKey:kSHIDFV];
}

- (NSString *)aesDecryptWithIDFV
{
    return [self aesDecryptWithKey:kSHIDFV];
}


- (NSString *)aesEncryptWithKey:(NSString *)key;
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
//    const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
//    NSData *data2 = [NSData dataWithBytes:cstr length:self.length];
//    NSString *temp = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//   NSString *temp2 = [[NSString alloc] initWithData:data2 encoding:NSUTF8StringEncoding];
    //对数据进行加密
    NSData *result = [data aesEncrypt:key];
    
    //转换为2进制字符串
    if (result && result.length > 0) {
        
        Byte *datas = (Byte*)[result bytes];
        NSMutableString *output = [NSMutableString stringWithCapacity:result.length * 2];
        for(int i = 0; i < result.length; i++){
            [output appendFormat:@"%02x", datas[i]];
        }
        return output;
    }
    return nil;
}

- (NSString *)aesDecryptWithKey:(NSString *)key;
{
    //转换为2进制Data
    NSMutableData *data = [NSMutableData dataWithCapacity:self.length / 2];
    unsigned char whole_byte;
    char byte_chars[3] = {'\0','\0','\0'};
    int i;
    for (i=0; i < [self length] / 2; i++) {
        byte_chars[0] = [self characterAtIndex:i*2];
        byte_chars[1] = [self characterAtIndex:i*2+1];
        whole_byte = strtol(byte_chars, NULL, 16);
        [data appendBytes:&whole_byte length:1];
    }
    
    //对数据进行解密
    NSData* result = [data aesDecrypt:key];
    if (result && result.length > 0) {
        return [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
    }
    return nil;
}

@end
