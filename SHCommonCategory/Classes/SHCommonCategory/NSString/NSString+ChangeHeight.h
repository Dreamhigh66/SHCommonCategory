//
//  NSMutableAttributedString+ChangeHeight.h
//
//  Created by Dreamhigh66 on 15/2/26.
//  Copyright (c) 2015年 Mr.Dreamhigh66. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ChangeHeight)

- (CGFloat)sizeWithMaxWidth:(CGFloat)width font:(UIFont *)font;
- (CGFloat)sizeWithMaxHeight:(CGFloat)height font:(UIFont *)font;

- (NSAttributedString *)servicePreText:(NSString *)preText;
- (NSAttributedString *)doPricePointPre:(UIFont *)prefont pointTail:(UIFont *)tailfont;



- (CGFloat)heightWithMaxWidth:(CGFloat)width andFontSize:(NSUInteger)FontSize;
- (CGFloat)widthWithMaxHeight:(CGFloat)height andFontSize:(NSUInteger)FontSize;

@end
