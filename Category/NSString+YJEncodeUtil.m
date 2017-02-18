//
//  NSString+YJEncodeUtilities_h.m
//  lu
//
//  Created by Eric on 2017/1/7.
//  Copyright © 2017年 Eric. All rights reserved.
//

#import "NSString+YJEncodeUtil.h"

@implementation NSString (YJEncodeUtil)
+(NSString *)encodeFromBinary:(NSData *)hexData {
    Byte *bytes = (Byte *)[hexData bytes];
    NSString *hexStr = @"";
    for (int i = 0; i < [hexData length]; i++) {
        NSString *newHexStr = [NSString stringWithFormat:@"%x",bytes[i]&0xff];
        if ([newHexStr length] == 1) {
            hexStr = [NSString stringWithFormat:@"%@0%@",hexStr,newHexStr];
        }else
            hexStr = [NSString stringWithFormat:@"%@%@",hexStr,newHexStr];
    }
    return hexStr;
}
+(NSString *)toHex:(uint16_t)tmpid {
    NSString *nLetterValue;
    NSString *str = @"";
    uint16_t ttmpig;
    for (int i = 0; i < 9; i++) {
        ttmpig = tmpid%16;
        tmpid = tmpid/16;
        switch (ttmpig) {
            case 10:
                nLetterValue = @"A";
                break;
            case 11:
                nLetterValue = @"B";
                break;
            case 12:
                nLetterValue = @"C";
                break;
            case 13:
                nLetterValue = @"D";
                break;
            case 14:
                nLetterValue = @"E";
                break;
            case 15:
                nLetterValue = @"F";
                break;
           
            default:
                nLetterValue = [NSString stringWithFormat:@"%u",ttmpig];
        }
        str = [nLetterValue stringByAppendingString:str];
        if(tmpid == 0) {
            break;
        }
    }
    return str;
}
@end
