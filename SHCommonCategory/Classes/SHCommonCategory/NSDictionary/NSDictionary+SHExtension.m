//
//  NSDictionary+SHExtension.m
//   
//
//  Created by Dreamhigh66 on 15/4/28.
//  Copyright (c) 2015年 cn.com.dreamhigh. All rights reserved.
//

#import "NSDictionary+SHExtension.h"
#import <BFKit/BFKit.h>

@implementation NSDictionary (SHExtension)

- (NSDictionary *)removeNullValues
{
    NSMutableDictionary *mutableDictionary = [[NSMutableDictionary alloc] initWithDictionary:[self copy]];
    NSArray *keyForNullValues = [mutableDictionary allKeysForObject:[NSNull null]];
    [mutableDictionary removeObjectsForKeys:keyForNullValues];
    
    NSDictionary *dictionary = [mutableDictionary copy];
    
    for (NSString *key in dictionary.allKeys) {
        id value = [dictionary objectForKey:key];
        if ([[value class] isSubclassOfClass:[NSString class]] && [value isEqualToString:@""]) {
            [mutableDictionary removeObjectForKey:key];
        }
        
        // 替换参数中得true 和false 为0和1；
        if ([NSStringFromClass([value class]) isEqualToString:@"__NSCFBoolean"]) {
            [mutableDictionary setObject:[value boolValue] ? @1 : @0 forKey:key];
        }
        
        if ([[value class] isSubclassOfClass:[NSDictionary class]]) {
            NSDictionary *tempDictionary = value;
            NSDictionary *cleanDictionary = [tempDictionary removeNullValues];
            [mutableDictionary setObject:cleanDictionary forKey:key];
        }
        if ([[value class] isSubclassOfClass:[NSArray class]]) {
            NSMutableArray *mutabeArray = [[NSMutableArray alloc] initWithArray:value];
            NSArray *tempArray = [mutabeArray copy];
            
            for (NSInteger i = 0; i < tempArray.count; i++) {
                id obj = [tempArray safeObjectAtIndex:i];
                if ([[obj class] isSubclassOfClass:[NSDictionary class]]) {
                    NSDictionary *tempDic = obj;
                    NSDictionary *cleanDic = [tempDic removeNullValues];
                    [mutabeArray replaceObjectAtIndex:i withObject:cleanDic];
                }
            }
            [mutableDictionary setObject:mutabeArray forKey:key];
        }
    }
    return [mutableDictionary copy];
}

@end
