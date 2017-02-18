//
//  NSData+YJDecodeUtil_h.m
//  lu
//
//  Created by Eric on 2017/1/7.
//  Copyright © 2017年 Eric. All rights reserved.
//

#import "NSData+YJDecodeUtil.h"

@implementation NSData (YJDecodeUtil)
+(NSData *)decodeFromHexidecimal:(NSString *)hexStyleString {
    NSString *source = [NSString stringWithString:hexStyleString];
    source = [source stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSLog(@"%@",source);
    NSMutableData *hexData = [NSMutableData data];
    unsigned char bytes;
    char byte_chars[3] = {'\0','\0','\0'};
    NSUInteger i;
    NSUInteger len = source.length/2;
    for (i = 0; i < len; i++) {
        byte_chars[0] = [source characterAtIndex:i * 2];
        byte_chars[1] = [source characterAtIndex:i * 2 + 1];
        bytes = strtol(byte_chars, NULL, 16);
        [hexData appendBytes:&bytes length:1];
    }
    return hexData;
}
@end
