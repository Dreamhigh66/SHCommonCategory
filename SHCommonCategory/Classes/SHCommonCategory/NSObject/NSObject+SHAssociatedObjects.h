//
//  NSObject+SHAssociatedObjects.h
//   
//
//  Created by Dreamhigh66 on 7/3/15.
//  Copyright (c) 2015 cn.com.dreamhigh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (SHAssociatedObjects)

- (void)associateRetainedValue:(id)value withKey:(void *)key;

- (void)associateCopiedValue:(id)value withKey:(void *)key;

- (void)associateAssignValue:(id)value withKey:(void *)key;

- (id)associatedValueForKey:(void *)key;

@end
