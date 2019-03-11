//
//  UILabel+Extensions.m
//   
//
//  Created by EasonFeng on 7/14/14.
//  Copyright (c) 2014 Eason. All rights reserved.
//

#import "UILabel+Extensions.h"

@implementation UILabel (Extensions)

- (CGSize)contentSize
{
    return [self contentSizeWithCustomSize:self.frame.size];
}

- (CGSize)contentSizeWithCustomSize:(CGSize)size
{
//    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
//    paragraphStyle.lineBreakMode = self.lineBreakMode;
//    paragraphStyle.alignment = self.textAlignment;
//    
//    NSDictionary * attributes = @{NSFontAttributeName : self.font,
//                                  NSParagraphStyleAttributeName : paragraphStyle};
    
    CGSize contentSize = [self.text boundingRectWithSize:size
                                                 options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
                                              attributes:[self temp]
                                                 context:nil].size;
    return contentSize;
}

- (NSDictionary *)temp
{
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = self.lineBreakMode;
    paragraphStyle.alignment = self.textAlignment;
    
    return @{NSFontAttributeName : self.font,
             NSParagraphStyleAttributeName : paragraphStyle};
}

- (float)resizeToFit
{
    float height = [self expectedHeight];
    CGRect newFrame = [self frame];
    newFrame.size.height = height;
    [self setFrame:newFrame];
    return newFrame.origin.y + newFrame.size.height;
}

- (float)expectedHeight
{
    [self setNumberOfLines:0];
    [self setLineBreakMode:NSLineBreakByCharWrapping];
    
    CGSize maximumLabelSize = CGSizeMake(self.frame.size.width,9999);
    
    CGSize expectedLabelSize = [[self text] boundingRectWithSize:maximumLabelSize options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) attributes:[self temp] context:nil].size;
    
    return expectedLabelSize.height;
}

@end










