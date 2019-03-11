//
//  UITextField+SHExpansion.h
//   
//
//  Created by EasonFeng on 12/24/14.
//  Copyright (c) 2014 cn.com.dreamhigh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (SHExpansion)

- (NSInteger)curOffset;
- (void)makeOffset:(NSInteger)offset;
- (void)makeOffsetFromBeginning:(NSInteger)offset;

@end
