//
//  NSString+YJEncodeUtilities_h.h
//  lu
//
//  Created by Eric on 2017/1/7.
//  Copyright © 2017年 Eric. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (YJEncodeUtil)
/*** 十六进制转换成二进制数据 编码成字符串 ***/
+(NSString *)encodeFromBinary:(NSData *)hexData;
+(NSString *)toHex:(uint16_t)tmpid;
@end
