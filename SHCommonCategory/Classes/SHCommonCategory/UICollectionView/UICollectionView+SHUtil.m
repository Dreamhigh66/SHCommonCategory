//
//  UICollectionView+SHUtil.m
//   
//
//  Created by Dreamhigh66 on 16/5/9.
//  Copyright © 2016年 cn.com.dreamhigh. All rights reserved.
//

#import "UICollectionView+SHUtil.h"

@implementation UICollectionView (SHUtil)

- (void)reloadDataWithoutAnimation
{
    [UIView performWithoutAnimation:^{
        [self reloadData];
    }];
}

@end
