//
//  UITabBarItem+SHCustomBadge.h
//   
//
//  Created by Dreamhigh66 on 16/4/22.
//  Copyright © 2016年 cn.com.dreamhigh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBarItem (SHCustomBadge)

@property (nonatomic, strong) NSString *sh_badgeValue;
@property (nonatomic, readonly) UILabel *sh_badgeLabel;
@property (nonatomic, weak) UITabBar *sh_tabBar;

- (void)layoutSH_badgeLabel;

@end
