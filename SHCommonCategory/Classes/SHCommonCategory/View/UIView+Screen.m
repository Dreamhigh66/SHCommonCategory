//
//  UIView+Screen.m
//   
//
//  Created by Dreamhigh66 on 16/3/11.
//  Copyright © 2016年 cn.com.dreamhigh. All rights reserved.
//

#import "UIView+Screen.h"

@implementation UIView (Screen)

-(UIImage *)convertViewToImage

{
    UIGraphicsBeginImageContext(self.bounds.size);
    
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
