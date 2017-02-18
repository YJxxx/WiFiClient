//
//  YJSetting.m
//  lu
//
//  Created by Eric on 2017/1/7.
//  Copyright © 2017年 Eric. All rights reserved.
//

#import "YJSetting.h"
#import "NSData+YJDecodeUtil.h"
//#import "Const.h"
static YJSetting *settingData = nil;
@interface YJSetting ()
@end
@implementation YJSetting

+(id)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        settingData = [super allocWithZone:zone];
    });
    return settingData;
    
}

+ (instancetype)sharedInstance {
    static dispatch_once_t predicate;
    settingData = [[self alloc]init];
    dispatch_once(&predicate, ^{
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        
        [ud setObject:[NSData decodeFromHexidecimal:@"FF040100FF"] forKey:@"textField1"];
        [ud setObject:[NSData decodeFromHexidecimal:@"FF000100FF"] forKey:@"textField2"];
        [ud setObject:[NSData decodeFromHexidecimal:@"FF040000FF"] forKey:@"textField3"];
        [ud setObject:[NSData decodeFromHexidecimal:@"FF000000FF"] forKey:@"textField4"];
        [ud setObject:[NSData decodeFromHexidecimal:@"FF000000FF"] forKey:@"textField5"];
        [ud setObject:[NSData decodeFromHexidecimal:@"FF000000FF"] forKey:@"textField6"];
        [ud setObject:[NSData decodeFromHexidecimal:@"kai"] forKey:@"textField5"];
        [ud setObject:[NSData decodeFromHexidecimal:@"guan"] forKey:@"textField6"];
        
        [ud setObject:@"192.168.1.1" forKey:@"host"];
        [ud setObject:@"2001" forKey:@"portToControl"];
        [ud setObject:@"8080" forKey:@"portToVideo"];
        [ud setBool:YES forKey:@"gearSave"];
        
        [ud synchronize];
    });
    return settingData;
}

-(id)copy {
    return settingData;
}
@end
