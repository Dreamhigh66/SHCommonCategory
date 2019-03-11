//
//  UILabel+MBIBnsepectable.m
//  XiaoMaBao
//
//  Created by 张磊 on 15/5/1.
//  Copyright (c) 2015年 MakeZL. All rights reserved.
//

#import "UILabel+MBIBnsepectable.h"

@implementation UILabel (MBIBnsepectable)

- (void)setAdjustsFontSize:(BOOL)adjustsFontSize
{
    self.adjustsFontSizeToFitWidth = adjustsFontSize;
}

- (BOOL)adjustsFontSize
{
    return self.adjustsFontSizeToFitWidth;
}

@end
