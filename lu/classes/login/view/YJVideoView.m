//
//  YJVideoView.m
//  lu
//
//  Created by Eric on 2017/1/7.
//  Copyright © 2017年 Eric. All rights reserved.
//

#import "YJVideoView.h"

@implementation YJVideoView


//里面的代码未执行
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGSize WH = [UIScreen mainScreen].bounds.size;
        self.frame = CGRectMake(0, 0, WH.height, WH.width);
    }
  
    return self;
}


@end
