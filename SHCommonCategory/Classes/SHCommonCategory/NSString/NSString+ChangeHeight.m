//
//  NSMutableAttributedString+ChangeHeight.m
//
//  Created by Dreamhigh66 on 15/2/26.
//  Copyright (c) 2015年 Mr.Dreamhigh66. All rights reserved.
//

#import "NSString+ChangeHeight.h"
#import "BFKit.h"

@implementation NSString (ChangeHeight)

- (CGSize)sizeWithConstrainedSize:(CGSize)size font:(UIFont *)font {
    CGSize expectedSize = CGSizeZero;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping | NSLineBreakByWordWrapping ;
        NSDictionary *attributes = @{NSFontAttributeName:font,NSParagraphStyleAttributeName:paragraphStyle.copy};
        expectedSize = [self boundingRectWithSize:size options: NSStringDrawingUsesLineFragmentOrigin  attributes:attributes context:nil].size;
    }
    return expectedSize;
}

- (CGFloat)sizeWithMaxWidth:(CGFloat)width font:(UIFont *)font {
    return ceilf([self sizeWithConstrainedSize:CGSizeMake(width, CGFLOAT_MAX) font:font].height) + 2.;
}

- (CGFloat)sizeWithMaxHeight:(CGFloat)height font:(UIFont *)font
{
    return [self sizeWithConstrainedSize:CGSizeMake(MAXFLOAT, height) font:font].width;
}

- (NSAttributedString *)servicePreText:(NSString *)preText
{
    NSString *serviceString = [NSString stringWithFormat:@"%@%@",preText,self];
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:serviceString];
    NSRange serviceRange = [serviceString rangeOfString:preText];
    [string addAttribute:NSForegroundColorAttributeName value:[UIColor hexString:@"#d7063b"] range:serviceRange];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping | NSLineBreakByWordWrapping ;
    [string addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, string.length)];
    return string;
}

- (NSAttributedString *)doPricePointPre:(UIFont *)prefont pointTail:(UIFont *)tailfont
{
    if ([self rangeOfString:@"."].location == NSNotFound)
    {
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:self];
        [str addAttribute:NSFontAttributeName value:prefont range:NSMakeRange(0, self.length)];
        return str;
    } else {
        NSArray *array = [self componentsSeparatedByString:@"."];
        NSString *str1 = array[0];
        NSString *str2 = array[1];
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:self];
        [str addAttribute:NSFontAttributeName value:prefont range:NSMakeRange(0, str1.length)];
        [str addAttribute:NSFontAttributeName value:tailfont range:NSMakeRange(self.length - str2.length, str2.length)];
        return str;
    }
    return nil;
}

- (CGFloat)widthWithMaxHeight:(CGFloat)height andFontSize:(NSUInteger)FontSize
{
    return [self maxValue:height fontSize:FontSize isHeight:NO];
}
- (CGFloat)heightWithMaxWidth:(CGFloat)width andFontSize:(NSUInteger)FontSize
{
    return [self maxValue:width fontSize:FontSize isHeight:YES];
}

- (CGFloat)maxValue:(CGFloat)value fontSize:(NSUInteger)fontSize isHeight:(BOOL)isHeight
{
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:fontSize],NSFontAttributeName, nil];
    CGSize size = CGSizeMake(isHeight?value:MAXFLOAT, isHeight?MAXFLOAT:value);
    CGSize tempSize = [self boundingRectWithSize:size options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
    if (isHeight) {
        return tempSize.height;
    }else{
        return tempSize.width;
    }
}
@end
