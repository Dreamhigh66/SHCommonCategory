//
//  SHSwizzle.h
//
//
//  Created by Jeff on 1/10/16.
//  Copyright © 2016 cn.com.dreamhigh. All rights reserved.
//

#import <Foundation/Foundation.h>

extern void SHSwizzleMethod(Class cls, SEL originalSelector, SEL swizzledSelector);
