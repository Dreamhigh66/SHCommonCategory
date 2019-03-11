//
//  UISlider+UItouch.h
//  QRCode
//
//  Created by Dreamhigh66 on 14-9-2.
//  Copyright (c) 2014年 Dreamhigh66. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UISlider (UItouch)
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event ;
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event ;
 
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event ;
 

@end
