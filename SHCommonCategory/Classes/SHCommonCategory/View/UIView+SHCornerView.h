//
//  UIView+SHCornerView.h
//   
//
//  Created by litt1er on 16/8/10.
//  Copyright © 2016年 cn.com.dreamhigh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SHCornerView)

/**
 *  设置view的圆角
 *
 *  @param rect   rect
 *  @param size   corner Size
 *  @param corner UIRectCorner
 */
- (void)setCornerWithRect:(CGRect)rect andSize:(CGSize)size andCorner:(UIRectCorner)corner;

@end
