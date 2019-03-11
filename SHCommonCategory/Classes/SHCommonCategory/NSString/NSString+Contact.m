//
//  NSString+Contact.m
//
//  Created by yongTao on 16/7/8.
//  Copyright © 2016年 dreamhigh. All rights reserved.
//

#import "NSString+Contact.h"

@implementation NSString (Contact)

- (NSString *)phoneNumberReplaceCharacters {
    
    return [self phoneNumberReplaceCharactersWithprefixLength:3 suffixLength:4];
}

- (NSString *)phoneNumberReplaceCharactersWithLength:(NSUInteger)length {
    
    return [self phoneNumberReplaceCharactersWithprefixLength:length suffixLength:length];
}

- (NSString *)phoneNumberReplaceCharactersWithprefixLength:(NSUInteger)prefixLength suffixLength:(NSUInteger)suffixLength {
    
    if (self.length == 11) {
        
        NSRange range = NSMakeRange(prefixLength, 11 - prefixLength - suffixLength);
        NSMutableString *mutableString = [[NSMutableString alloc] init];
        for (NSInteger i = 0; i < 11 - prefixLength - suffixLength; i ++) {
            
            [mutableString appendString:@"*"];
        }
        return [self stringByReplacingCharactersInRange:range withString:mutableString];
    }
    return self;
}

- (NSString *)eMailReplaceCharactersWithLength:(NSUInteger)length string:(NSString *)string {
    
    return [self eMailReplaceCharactersWithLength:length string:string options:SHContactOptionsAsLittleAsPossible];
}

- (NSString *)eMailReplaceCharactersWithLength:(NSUInteger)length string:(NSString *)string options:(SHContactOptions)options {
    
   return [self eMailReplaceCharactersWithprefixLength:length suffixLength:length string:string options:options];
}

- (NSString *)eMailReplaceCharactersWithprefixLength:(NSUInteger)prefixLength suffixLength:(NSUInteger)suffixLength string:(NSString *)string options:(SHContactOptions)options {
    
    NSArray *array = [self componentsSeparatedByString:@"@"];
    if (array.count == 2) {
        
        NSString *subFirstString = [array firstObject];
        NSString *subLastString = [array lastObject];
        NSString *prefixString = nil;
        NSString *suffixString = nil;
        switch (options) {

            case SHContactOptionsHandleNormalPrefix:
                
                if (subFirstString.length >= MAX(prefixLength, suffixLength)) {
                    
                    prefixString = [subFirstString substringToIndex:prefixLength];
                    NSString *remainingString = [subFirstString substringFromIndex:prefixLength];
                  
                    if (remainingString.length > suffixLength) {
                        
                        suffixString = [remainingString substringFromIndex:remainingString.length - suffixLength];
                    } else {
                        
                        suffixString = remainingString;
                    }
                }
                break;
                
            case SHContactOptionsHandleNormalSuffix:
                
                if (subFirstString.length >= MAX(prefixLength, suffixLength)) {
                    
                    suffixString = [subFirstString substringFromIndex:subFirstString.length - suffixLength];
                    NSString *remainingString = [subFirstString substringToIndex:subFirstString.length - suffixLength];
                    if (remainingString.length > prefixLength) {
                        
                        prefixString = [remainingString substringToIndex:prefixLength];
                    } else {
                        
                        prefixString = remainingString;
                    }
                }
                break;
                
            case SHContactOptionsAsLittleAsPossible:
                
                if (subFirstString.length > prefixLength + suffixLength) {
                    
                    prefixString = [subFirstString substringToIndex:prefixLength];
                    suffixString = [subFirstString substringFromIndex:subFirstString.length - suffixLength];
                }
                
                break;
                
            case SHContactOptionsHandleAsMuchAsPossible:
                
                if (subFirstString.length >= MAX(prefixLength, suffixLength)) {
                    
                    prefixString = [subFirstString substringToIndex:prefixLength];
                    suffixString = [subFirstString substringFromIndex:subFirstString.length - suffixLength];
                }
                break;
                
            default:
                break;
        }
        return [NSString stringWithFormat:@"%@%@%@@%@",prefixString,string,suffixString,subLastString];

    }
    return self;
}


@end
