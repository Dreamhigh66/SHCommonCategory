//
//  UIView+SHIBnspectable.h
//   
//
//  Created by Dreamhigh66 on 5/12/15.
//  Copyright (c) 2015 cn.com.dreamhigh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SHIBnspectable)

@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;
@property (nonatomic, assign) IBInspectable BOOL    defaultCornerRadius;
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;
@property (nonatomic, strong) IBInspectable UIColor *borderColor;
@property (nonatomic, assign) IBInspectable BOOL    onePx;

@end
