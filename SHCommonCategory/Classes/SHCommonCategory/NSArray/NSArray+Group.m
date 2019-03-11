//
//  NSArray+Group.m
//   
//
//  Created by Dreamhigh66 on 15/10/10.
//  Copyright © 2015年 cn.com.dreamhigh. All rights reserved.
//

#import "NSArray+Group.h"

@implementation NSArray (Group)

- (NSArray *)safeSubarrayWithRange:(NSRange)range
{
    if (range.location > self.count - 1) {
        return nil;
    }
    
    if (range.location + range.length > self.count) {
        range.length = self.count - range.location;
    }
    return [self subarrayWithRange:range];

}

@end
