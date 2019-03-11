//
//  NSString+FormartJSONString.m
//   
//
//  Created by HG on 15/12/15.
//  Copyright © 2015年 cn.com.dreamhigh. All rights reserved.
//

#import "NSString+FormartJSONString.h"

@implementation NSString (FormartJSONString)


+ (NSString *)JSONStringNoFormartForDictionary:(NSDictionary *)dictionary{
    
    NSString *json = nil;
    NSError *error = nil;
    //    options = 0 时jsonstring 不会有格式 options = NSJSONWritingPrettyPrinted会有格式
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary options:0 error:&error];
    
    if(!jsonData)
    {
        return @"{}";
    }
    else if(!error)
    {
        json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        json = [NSString clearJSONFormart:json];
        return json;
    }
    else
    {
        return error.localizedDescription;
    }
    
    return json;


}


+ (NSString *)JSONStringForDictionary:(NSDictionary *)dictionary{

    NSString *json = nil;
    NSError *error = nil;
    //    options = 0 时jsonstring 不会有格式 options = NSJSONWritingPrettyPrinted会有格式
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary options:0 error:&error];
    
    if(!jsonData)
    {
        return @"{}";
    }
    else if(!error)
    {
        json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        json = [NSString clearJSONFormart:json];
        json = [NSString formatJSON:json];

        return json;
    }
    else
    {
        return error.localizedDescription;
    }
    
    return json;
}




+ (NSString *)clearJSONFormart:(NSString *)str{
    NSMutableString *responseString = [NSMutableString stringWithString:str];
    NSString *character = nil;
    for (int i = 0; i < responseString.length; i ++) {
        character = [responseString substringWithRange:NSMakeRange(i, 1)];
        if ([character isEqualToString:@"\\"])
            [responseString deleteCharactersInRange:NSMakeRange(i, 1)];
    }
    return responseString;
}

+ (NSString *)clearAndReformatJSON:(NSString *)str{
    str = [NSString clearJSONFormart:str];
    str = [NSString formatJSON:str];
    return str;
}

+ (NSString *)formatJSON:(NSString *)str
{
    //    return self;
    int indentLevel = 0;
    BOOL inString   = NO;
    char currentChar = '\0';
    char *tab = "    ";

    NSUInteger len = [str lengthOfBytesUsingEncoding:NSUTF8StringEncoding];
    const char *utf8 = [str UTF8String];
    NSMutableData *buf = [NSMutableData dataWithCapacity:(NSUInteger)(len * 1.1f)];

    for (int i = 0; i < len; i++)
    {
        currentChar = utf8[i];
        switch (currentChar) {
            case '{':
            case '[':
                if (!inString) {
                    [buf appendBytes:&currentChar length:1];
                    [buf appendBytes:"\n" length:1];

                    for (int j = 0; j < indentLevel+1; j++) {
                        [buf appendBytes:tab length:strlen(tab)];
                    }

                    indentLevel += 1;
                } else {
                    [buf appendBytes:&currentChar length:1];
                }
                break;
            case '}':
            case ']':
                if (!inString) {
                    indentLevel -= 1;
                    [buf appendBytes:"\n" length:1];
                    for (int j = 0; j < indentLevel; j++) {
                        [buf appendBytes:tab length:strlen(tab)];
                    }
                    [buf appendBytes:&currentChar length:1];
                } else {
                    [buf appendBytes:&currentChar length:1];
                }
                break;
            case ',':
                if (!inString) {
                    [buf appendBytes:",\n" length:2];
                    for (int j = 0; j < indentLevel; j++) {
                        [buf appendBytes:tab length:strlen(tab)];
                    }
                } else {
                    [buf appendBytes:&currentChar length:1];
                }
                break;
            case ':':
                if (!inString) {
                    [buf appendBytes:":" length:1];
                } else {
                    [buf appendBytes:&currentChar length:1];
                }
                break;
            case ' ':
            case '\n':
            case '\t':
            case '\r':
                if (inString) {
                    [buf appendBytes:&currentChar length:1];
                }
                break;
            case '"':

                if (i > 0 && utf8[i-1] != '\\')
                {
                    inString = !inString;
                }

                [buf appendBytes:&currentChar length:1];
                break;
            default:
                [buf appendBytes:&currentChar length:1];
                break;
        }
    }
    return [[NSString alloc] initWithData:buf encoding:NSUTF8StringEncoding];
}

@end
