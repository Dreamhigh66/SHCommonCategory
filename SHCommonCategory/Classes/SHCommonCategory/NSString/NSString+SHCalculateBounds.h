//
//  NSString+SHCalculateBounds.h
//   
//
//  Created by Dreamhigh66 on 12/17/14.
//  Copyright (c) 2014 cn.com.dreamhigh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SHCalculateBounds)

- (NSAttributedString *)priceAttributedString;
- (NSAttributedString *)sh_attributedString;

- (NSString *)secureStringWithPrefixLength:(NSInteger)preLength suffixLength:(NSInteger)sufLength;
- (NSString *)secureCellPhoneNumber;
- (BOOL)hasSecureString;
- (NSUInteger) compareTo: (NSString*) comp;
- (NSUInteger) compareToIgnoreCase: (NSString*) comp;
- (bool) contains: (NSString*) substring;
- (bool) endsWith: (NSString*) substring;
- (bool) startsWith: (NSString*) substring;
- (NSUInteger) indexOf: (NSString*) substring;
- (NSUInteger) indexOf:(NSString *)substring startingFrom: (NSUInteger) index;
- (NSUInteger) lastIndexOf: (NSString*) substring;
- (NSUInteger) lastIndexOf:(NSString *)substring startingFrom: (NSUInteger) index;
- (NSString*) substringFromIndex:(NSUInteger)from toIndex: (NSUInteger) to;
- (NSString*) trim;
- (NSArray*) split: (NSString*) token;
- (NSString*) replace: (NSString*) target withString: (NSString*) replacement;
- (NSArray*) split: (NSString*) token limit: (NSUInteger) maxResults;

- (CGSize)sizeWithConstrainedToWidth:(float)width fromFont:(UIFont *)font1 lineSpace:(float)lineSpace;
- (CGSize)sizeWithConstrainedToSize:(CGSize)size fromFont:(UIFont *)font1 lineSpace:(float)lineSpace;
- (void)drawInContext:(CGContextRef)context withPosition:(CGPoint)p andFont:(UIFont *)font andTextColor:(UIColor *)color andHeight:(float)height andWidth:(float)width;
- (void)drawInContext:(CGContextRef)context withPosition:(CGPoint)p andFont:(UIFont *)font andTextColor:(UIColor *)color andHeight:(float)height;

- (CGFloat)widthWithHeight:(CGFloat)height fontSize:(CGFloat)fontSize;
- (CGFloat)heightWithWidth:(CGFloat)width fontSize:(CGFloat)fontSize;


@end
