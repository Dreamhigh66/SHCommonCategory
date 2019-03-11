//
//  UIView+SHCornerView.m
//   
//
//  Created by litt1er on 16/8/10.
//  Copyright © 2016年 cn.com.dreamhigh. All rights reserved.
//

#import "UIView+SHCornerView.h"

@implementation UIView (SHCornerView)

- (void)setCornerWithRect:(CGRect)rect andSize:(CGSize)size andCorner:(UIRectCorner)corner
{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corner cornerRadii:size];
    CAShapeLayer *masklayer = [[CAShapeLayer alloc] init];//创建shapelayer
    masklayer.frame = self.bounds;
    masklayer.path = path.CGPath;//设置路径
    self.layer.mask = masklayer;
}
@end
