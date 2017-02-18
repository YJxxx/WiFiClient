//
//  NSData+YJDecodeUtil_h.h
//  lu
//
//  Created by Eric on 2017/1/7.
//  Copyright © 2017年 Eric. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (YJDecodeUtil)
+(NSData *)decodeFromHexidecimal:(NSString *)hexStyleString;
@end
