//
//  UITabBarItem+SHCustomBadge.m
//   
//
//  Created by Dreamhigh66 on 16/4/22.
//  Copyright © 2016年 cn.com.dreamhigh. All rights reserved.
//

#import "UITabBarItem+SHCustomBadge.h"
#import <objc/runtime.h>
#import "NSObject+SHAssociatedObjects.h"
#import "BFKit.h"

@interface UITabBar (SHCustomBadge)

@property (nonatomic, readonly) NSMutableDictionary *sh_badgeLabels;

- (void)storeBadgeLabel:(UILabel *)sh_badgeLabel index:(NSInteger)index;

- (void)removeBadgeLabelAtIndex:(NSInteger)index;

@end

@implementation UITabBar (SHCustomBadge)

- (NSMutableDictionary *)sh_badgeLabels {
    NSMutableDictionary *labels = [self associatedValueForKey:_cmd];
    if (!labels) {
        labels = [[NSMutableDictionary alloc] init];
        [self associateRetainedValue:labels withKey:_cmd];
    }
    return labels;
}

- (void)storeBadgeLabel:(UILabel *)sh_badgeLabel index:(NSInteger)index {
    NSString *key = [NSString stringWithFormat:@"%@", @(index)];
    UILabel *originalLabel = [self.sh_badgeLabels objectForKey:key];
    
    if (originalLabel && originalLabel.superview) {
        [originalLabel removeFromSuperview];
    }
    [self.sh_badgeLabels setObject:sh_badgeLabel forKey:key];
    [self addSubview:sh_badgeLabel];
    [self bringSubviewToFront:sh_badgeLabel];
}

- (void)removeBadgeLabelAtIndex:(NSInteger)index {
    NSString *key = [NSString stringWithFormat:@"%@", @(index)];
    UILabel *originalLabel = [self.sh_badgeLabels objectForKey:key];
    if (originalLabel && originalLabel.superview) {
        [originalLabel removeFromSuperview];
    }
}

@end


@implementation UITabBarItem (SHCustomBadge)


- (NSString *)sh_badgeValue
{
    return [self associatedValueForKey:_cmd];
}

- (void)setSh_badgeValue:(NSString *)sh_badgeValue
{
    [self associateRetainedValue:sh_badgeValue withKey:@selector(sh_badgeValue)];
    self.sh_badgeLabel.text = sh_badgeValue;
    if (!sh_badgeValue || sh_badgeValue.length == 0) {
        self.sh_badgeLabel.hidden = YES;
        [self.sh_tabBar removeBadgeLabelAtIndex:[self.sh_tabBar.items indexOfObject:self]];
    } else {
        self.sh_badgeLabel.hidden = NO;
    }
    if (self.sh_tabBar) {
        [self layoutSH_badgeLabel];
        if (!self.sh_badgeLabel.superview) {
            [self.sh_tabBar storeBadgeLabel:self.sh_badgeLabel index:[self.sh_tabBar.items indexOfObject:self]];
        }
    }
}

- (void)layoutSH_badgeLabel
{
    CGFloat width = [self textSizeWithText:self.sh_badgeValue].width + 4;
    if (width < 18) {
        width = 18;
    }
    self.sh_badgeLabel.frame = CGRectMake([self originX], 2, width, 18);
}

- (CGFloat)originX
{
    CGFloat originX = 0;
    CGFloat width = self.sh_tabBar.bounds.size.width / self.sh_tabBar.items.count;
    NSInteger index = [self.sh_tabBar.items indexOfObject:self];

    originX = width * index + width / 2 + 10;
    return originX;
}

- (UILabel *)sh_badgeLabel
{
    UILabel *label = [self associatedValueForKey:_cmd];
    if (!label) {
        label = [[UILabel alloc] init];
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:12];
        label.backgroundColor = [UIColor hex:@"#d7063b"];
        label.layer.cornerRadius = 9;
        label.layer.masksToBounds = YES;
        label.textAlignment = NSTextAlignmentCenter;
        label.layer.zPosition = 1;
        [self associateRetainedValue:label withKey:_cmd];
    }
    
    return label;
}

- (CGSize)textSizeWithText:(NSString *)text
{
    if (text.length == 0) {
        return CGSizeZero;
    }
    CGSize size = [text boundingRectWithSize:CGSizeMake(0, 18) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} context:nil].size;
    return size;
}

- (UITabBar *)sh_tabBar
{
    return [self associatedValueForKey:_cmd];
}

- (void)setSh_tabBar:(UITabBar *)sh_tabBar
{
    [self associateAssignValue:sh_tabBar withKey:@selector(sh_tabBar)];
    
    if (!self.sh_badgeLabel.superview) {
        [self layoutSH_badgeLabel];
        
        if (!self.sh_badgeValue || self.sh_badgeValue.length == 0) {
            self.sh_badgeLabel.hidden = YES;
        } else {
            self.sh_badgeLabel.hidden = NO;
        }
        [sh_tabBar storeBadgeLabel:self.sh_badgeLabel index:[sh_tabBar.items indexOfObject:self]];
    }
}

@end
