//
//  UILabel+Extensions.h
//   
//
//  Created by EasonFeng on 7/14/14.
//  Copyright (c) 2014 Eason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Extensions)
/**
 *  Calculate content size
 *
 *  @return CGSize
 */
- (CGSize)contentSize;
- (CGSize)contentSizeWithCustomSize:(CGSize)size;

-(float)resizeToFit;
-(float)expectedHeight;

@end
