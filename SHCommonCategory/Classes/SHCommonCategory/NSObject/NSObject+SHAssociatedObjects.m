//
//  NSObject+SHAssociatedObjects.m
//   
//
//  Created by Dreamhigh66 on 7/3/15.
//  Copyright (c) 2015 cn.com.dreamhigh. All rights reserved.
//

#import "NSObject+SHAssociatedObjects.h"
#import <objc/runtime.h>

@implementation NSObject (SHAssociatedObjects)

- (void)associateRetainedValue:(id)value withKey:(void *)key
{
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)associateCopiedValue:(id)value withKey:(void *)key
{
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)associateAssignValue:(id)value withKey:(void *)key
{
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_ASSIGN);
}

- (id)associatedValueForKey:(void *)key
{
    return objc_getAssociatedObject(self, key);
}

@end
