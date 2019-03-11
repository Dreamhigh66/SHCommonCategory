//
//  UISlider+UItouch.m
//  QRCode
//
//  Created by Dreamhigh66 on 14-9-2.
//  Copyright (c) 2014年 Dreamhigh66. All rights reserved.
//

#import "UISlider+UItouch.h"

@implementation UISlider (UItouch)
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [[self nextResponder] touchesBegan:touches withEvent:event];
    [super touchesBegan:touches withEvent:event];
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [[self nextResponder] touchesMoved:touches withEvent:event];
    [super touchesMoved:touches withEvent:event];
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [[self nextResponder] touchesEnded:touches withEvent:event];
    [super touchesEnded:touches withEvent:event];
}

@end
