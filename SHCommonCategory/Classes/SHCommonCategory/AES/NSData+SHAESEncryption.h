//
//  NSData+SHAESEncryption.h
//
//  Created by Dreamhigh66 on 15/12/10.
//  Copyright © 2015年 cn.com.dreamhigh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

@interface NSData (SHAESEncryption)

- (NSData *)aesEncrypt:(NSString *)key;

- (NSData *)aesDecrypt:(NSString *)key;

@end
