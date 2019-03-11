//
//  NSString+SHAESEncryption.h
//   
//
//  Created by Dreamhigh66 on 15/12/10.
//  Copyright © 2015年 cn.com.dreamhigh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SHAESEncryption)

- (NSString *)aesEncryptWithIDFV;

- (NSString *)aesDecryptWithIDFV;

- (NSString *)aesEncryptWithKey:(NSString *)key;

- (NSString *)aesDecryptWithKey:(NSString *)key;

@end
