//
//  UIView+SHReuseIdentifier.m
//   
//
//  Created by Dreamhigh66 on 16/6/14.
//  Copyright © 2016年 cn.com.dreamhigh. All rights reserved.
//

#import "UIView+SHReuseIdentifier.h"
#import <objc/runtime.h>

@implementation UIView (SHReuseIdentifier)

- (NSString *)sh_identifier
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setSh_identifier:(NSString *)sh_identifier
{
    objc_setAssociatedObject(self, @selector(sh_identifier), sh_identifier, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
