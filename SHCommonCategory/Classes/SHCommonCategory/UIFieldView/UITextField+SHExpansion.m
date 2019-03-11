//
//  UITextField+SHExpansion.m
//   
//
//  Created by EasonFeng on 12/24/14.
//  Copyright (c) 2014 cn.com.dreamhigh. All rights reserved.
//

#import "UITextField+SHExpansion.h"

@implementation UITextField (SHExpansion)

- (NSInteger)curOffset{
    
    // 基于文首计算出到光标的偏移数值。
    return [self offsetFromPosition:self.beginningOfDocument toPosition:self.selectedTextRange.start];
    
}

- (void)makeOffset:(NSInteger)offset{
    
    // 实现原理是先获取一个基于文尾的偏移，然后加上要施加的偏移，再重新根据文尾计算位置，最后利用选取来实现光标定位。
    UITextRange *selectedRange = [self selectedTextRange];
    NSInteger currentOffset = [self offsetFromPosition:self.endOfDocument toPosition:selectedRange.end];
    currentOffset += offset;
    UITextPosition *newPos = [self positionFromPosition:self.endOfDocument offset:currentOffset];
    self.selectedTextRange = [self textRangeFromPosition:newPos toPosition:newPos];
    
}

- (void)makeOffsetFromBeginning:(NSInteger)offset{
    
    // 先把光标移动到文首，然后再调用上面实现的偏移函数。
    UITextPosition *begin = self.beginningOfDocument;
    UITextPosition *start = [self positionFromPosition:begin offset:0];
    UITextRange *range = [self textRangeFromPosition:start toPosition:start];
    [self setSelectedTextRange:range];
    [self makeOffset:offset];
    
}



//- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
//{
////    if (action == @selector(paste:)||action==@selector(cut:)||action==@selector(copy:)||action==@selector(select:)||action==@selector(selectAll:))
//        return NO;
////    return [super canPerformAction:action withSender:sender];
//}

@end
