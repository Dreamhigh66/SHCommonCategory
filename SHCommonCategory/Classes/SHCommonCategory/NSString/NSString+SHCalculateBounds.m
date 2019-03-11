//
//  NSString+SHCalculateBounds.m
//   
//
//  Created by Dreamhigh66 on 12/17/14.
//  Copyright (c) 2014 cn.com.dreamhigh. All rights reserved.
//

#import "NSString+SHCalculateBounds.h"
#import <CoreText/CoreText.h>

@implementation NSString (SHCalculateBounds)

- (NSAttributedString *)priceAttributedString
{
    NSString *tempStr = [NSString stringWithFormat:@"¥ %.2f", self.doubleValue];
    NSMutableAttributedString *temp = [[NSMutableAttributedString alloc] initWithString:tempStr];
    [temp addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(temp.length - 2, 2)];
    return temp;
}

- (NSAttributedString *)sh_attributedString
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 5;
    return [[NSAttributedString alloc] initWithString:self attributes:@{ NSParagraphStyleAttributeName : paragraphStyle }];
}

- (NSString *)secureCellPhoneNumber
{
    return [self secureStringWithPrefixLength:3 suffixLength:4];
}

- (NSString *)secureStringWithPrefixLength:(NSInteger)preLength suffixLength:(NSInteger)sufLength
{
    NSInteger length = self.length;
    if (length > preLength + sufLength)
    {
        NSString *prefix = [self substringToIndex:preLength];
        NSString *suffix = [self substringFromIndex:length - sufLength];
        NSMutableString *str = [NSMutableString stringWithString:prefix];
        for (int i = 0; i < length - preLength - sufLength; ++i)
        {
            [str appendString:@"*"];
        }
        [str appendString:suffix];
        return str;
    }
    else
    {
        return self;
    }
}

- (BOOL)hasSecureString
{
    return [self contains:@"*"];
}

- (CGFloat)widthWithHeight:(CGFloat)height fontSize:(CGFloat)fontSize
{
    return [self boundingRectWithSize:CGSizeMake(MAXFLOAT, height) options: (NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:fontSize]} context:nil].size.width;
}

- (CGFloat)heightWithWidth:(CGFloat)width fontSize:(CGFloat)fontSize
{
    return [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options: (NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:fontSize]} context:nil].size.height;
}

- (NSUInteger) compareTo: (NSString*) comp {
    NSComparisonResult result = [self compare:comp];
    if (result == NSOrderedSame) {
        return 0;
    }
    return result == NSOrderedAscending ? -1 : 1;
}

- (NSUInteger) compareToIgnoreCase: (NSString*) comp {
    return [[self lowercaseString] compareTo:[comp lowercaseString]];
}

- (bool) contains: (NSString*) substring {
    NSRange range = [self rangeOfString:substring];
    return range.location != NSNotFound;
}

- (bool) endsWith: (NSString*) substring {
    NSRange range = [self rangeOfString:substring];
    return range.location == [self length] - [substring length];
}

- (bool) startsWith: (NSString*) substring {
    NSRange range = [self rangeOfString:substring];
    return range.location == 0;
}

- (NSUInteger) indexOf: (NSString*) substring {
    NSRange range = [self rangeOfString:substring options:NSCaseInsensitiveSearch];
    return range.location == NSNotFound ? -1 : range.location;
}

- (NSUInteger) indexOf:(NSString *)substring startingFrom: (NSUInteger) index {
    NSString* test = [self substringFromIndex:index];
    return index+[test indexOf:substring];
}

- (NSUInteger) lastIndexOf: (NSString*) substring {
    NSRange range = [self rangeOfString:substring options:NSBackwardsSearch];
    return range.location == NSNotFound ? -1 : range.location;
}

- (NSUInteger) lastIndexOf:(NSString *)substring startingFrom: (NSUInteger) index {
    NSString* test = [self substringFromIndex:index];
    return [test lastIndexOf:substring];
}

- (NSString*) substringFromIndex:(NSUInteger)from toIndex: (NSUInteger) to {
    NSRange range;
    range.location = from;
    range.length = to - from;
    return [self substringWithRange: range];
}

- (NSString*) trim {
    
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSArray*) split: (NSString*) token {
    return [self split:token limit:0];
}

- (NSArray*) split: (NSString*) token limit: (NSUInteger) maxResults {
    NSMutableArray* result = [NSMutableArray arrayWithCapacity: 8];
    NSString* buffer = self;
    while ([buffer contains:token]) {
        if (maxResults > 0 && [result count] == maxResults - 1) {
            break;
        }
        NSUInteger matchIndex = [buffer indexOf:token];
        NSString* nextPart = [buffer substringFromIndex:0 toIndex:matchIndex];
        buffer = [buffer substringFromIndex:matchIndex + [token length]];
        [result addObject:nextPart];
    }
    if ([buffer length] > 0) {
        [result addObject:buffer];
    }
    
    return result;
}

- (NSString*) replace: (NSString*) target withString: (NSString*) replacement {
    return [self stringByReplacingOccurrencesOfString:target withString:replacement];
}

- (CGSize)sizeWithConstrainedToWidth:(float)width fromFont:(UIFont *)font1 lineSpace:(float)lineSpace
{
    return [self sizeWithConstrainedToSize:CGSizeMake(width, CGFLOAT_MAX) fromFont:font1 lineSpace:lineSpace];
}

- (CGSize)sizeWithConstrainedToSize:(CGSize)size fromFont:(UIFont *)font1 lineSpace:(float)lineSpace
{
    CGFloat minimumLineHeight = font1.pointSize, maximumLineHeight = minimumLineHeight, linespace = lineSpace;
    CTFontRef font = CTFontCreateWithName((__bridge CFStringRef)font1.fontName, font1.pointSize, NULL);
    CTLineBreakMode lineBreakMode = kCTLineBreakByWordWrapping;
    // Apply paragraph settings
    CTTextAlignment alignment = kCTLeftTextAlignment;
    CTParagraphStyleRef style = CTParagraphStyleCreate((CTParagraphStyleSetting[6]){
        {kCTParagraphStyleSpecifierAlignment, sizeof(alignment), &alignment},
        {kCTParagraphStyleSpecifierMinimumLineHeight, sizeof(minimumLineHeight), &minimumLineHeight},
        {kCTParagraphStyleSpecifierMaximumLineHeight, sizeof(maximumLineHeight), &maximumLineHeight},
        {kCTParagraphStyleSpecifierMaximumLineSpacing, sizeof(linespace), &linespace},
        {kCTParagraphStyleSpecifierMinimumLineSpacing, sizeof(linespace), &linespace},
        {kCTParagraphStyleSpecifierLineBreakMode, sizeof(CTLineBreakMode), &lineBreakMode}
    }, 6);
    NSDictionary* attributes = [NSDictionary dictionaryWithObjectsAndKeys:(__bridge id)font,(NSString*)kCTFontAttributeName,(__bridge id)style,(NSString*)kCTParagraphStyleAttributeName,nil];
    
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:self attributes:attributes];
    //    [self clearEmoji:string start:0 font:font1];
    CFAttributedStringRef attributedString = (__bridge CFAttributedStringRef)string;
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString(attributedString);
    CGSize result = CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRangeMake(0, [string length]), NULL, size, NULL);
    CFRelease(framesetter);
    CFRelease(font);
    CFRelease(style);
    string = nil;
    attributes = nil;
    return result;
}

- (void)drawInContext:(CGContextRef)context withPosition:(CGPoint)p andFont:(UIFont *)font andTextColor:(UIColor *)color andHeight:(float)height andWidth:(float)width
{
    CGSize size = CGSizeMake(width, font.pointSize + 10);
    CGContextSetTextMatrix(context,CGAffineTransformIdentity);
    CGContextTranslateCTM(context,0,height);
    CGContextScaleCTM(context,1.0,-1.0);
    
    // Determine default text color
    UIColor* textColor = color;
    // Set line height, font, color and break mode
    CTFontRef font1 = CTFontCreateWithName((__bridge CFStringRef)font.fontName, font.pointSize, NULL);
    // Apply paragraph settings
    CGFloat minimumLineHeight = font.pointSize, maximumLineHeight = minimumLineHeight + 10, linespace = 5;
    CTLineBreakMode lineBreakMode = kCTLineBreakByTruncatingTail;
    CTTextAlignment alignment = kCTLeftTextAlignment;
    // Apply paragraph settings
    CTParagraphStyleRef style = CTParagraphStyleCreate((CTParagraphStyleSetting[6]){
        {kCTParagraphStyleSpecifierAlignment, sizeof(alignment), &alignment},
        {kCTParagraphStyleSpecifierMinimumLineHeight, sizeof(minimumLineHeight), &minimumLineHeight},
        {kCTParagraphStyleSpecifierMaximumLineHeight, sizeof(maximumLineHeight), &maximumLineHeight},
        {kCTParagraphStyleSpecifierMaximumLineSpacing, sizeof(linespace), &linespace},
        {kCTParagraphStyleSpecifierMinimumLineSpacing, sizeof(linespace), &linespace},
        {kCTParagraphStyleSpecifierLineBreakMode, sizeof(CTLineBreakMode), &lineBreakMode}
    }, 6);
    
    NSDictionary* attributes = [NSDictionary dictionaryWithObjectsAndKeys:(__bridge id)font1, (NSString*)kCTFontAttributeName,
                                textColor.CGColor, kCTForegroundColorAttributeName,
                                style, kCTParagraphStyleAttributeName,
                                nil];
    // Create path to work with a frame with applied margins
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(p.x, height - p.y - size.height , size.width, size.height));
    
    // Create attributed string, with applied syntax highlighting
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:self attributes:attributes];
    CFAttributedStringRef attributedString = (__bridge CFAttributedStringRef)attributedStr;
    
    //Draw the frame
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString(attributedString);
    CTFrameRef ctframe = CTFramesetterCreateFrame(framesetter, CFRangeMake(0,CFAttributedStringGetLength(attributedString)),path,NULL);
    CTFrameDraw(ctframe, context);
    CGPathRelease(path);
    CFRelease(font1);
    CFRelease(framesetter);
    CFRelease(ctframe);
    [[attributedStr mutableString] setString:@""];
    CGContextSetTextMatrix(context,CGAffineTransformIdentity);
    CGContextTranslateCTM(context,0, height);
    CGContextScaleCTM(context,1.0,-1.0);
}

- (void)drawInContext:(CGContextRef)context withPosition:(CGPoint)p andFont:(UIFont *)font andTextColor:(UIColor *)color andHeight:(float)height{
    [self drawInContext:context withPosition:p andFont:font andTextColor:color andHeight:height andWidth:CGFLOAT_MAX];
}

@end
