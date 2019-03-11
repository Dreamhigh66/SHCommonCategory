//
//  NSString+PhoneNum.h
//   
//
//  Created by Dreamhigh66 on 16/3/24.
//  Copyright © 2016年 cn.com.dreamhigh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString(PhoneNum)

- (BOOL)isMobileNumber;
- (NSString *)filterSpaceFromIphoneString;
- (NSString *)spaceMobile;

@end
