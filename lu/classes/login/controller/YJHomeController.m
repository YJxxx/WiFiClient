//
//  YJHomeController.m
//  lu
//
//  Created by Eric on 2017/1/7.
//  Copyright © 2017年 Eric. All rights reserved.
//

#import "YJHomeController.h"
#import "YJVideoView.h"

#define END_MARK_BYTES {0xFF,0xD9}
static NSData *endMarkData = nil;
static NSData *endData = nil;


@interface YJHomeController ()


//自定义view 不能用  待解决
@property (weak, nonatomic) IBOutlet UIImageView *videoView;

@property (strong,nonatomic) NSURLConnection *connection;
@property (nonatomic,strong) NSMutableData *receivedData;

@property (assign,nonatomic) CGPoint localP;

//视频x轴居中值
@property (assign,nonatomic) NSInteger lastX;
@end

@implementation YJHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.lastX = 0;
    //自定义view 不能用  待解决
    [self.view addSubview:self.videoView];
    NSURL *url = [NSURL URLWithString:@"http://192.168.1.1:8080/?action=stream"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    self.connection=[[NSURLConnection alloc]initWithRequest:request delegate:self];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

//获取移动的距离
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint point = [touch locationInView:self.videoView];
    self.localP = point;
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint point = [touch locationInView:self.videoView];
//    CGPoint p = CGPointMake(point.x - _localP.x, point.y - _localP.y);
//    self.localP = p;
//    CGFloat W = [UIScreen mainScreen].bounds.size.width;
//    CGFloat X = p.x / (W/180);
//    NSLog(@"%f",X);

//    if (X>0) {
//        X+=self.lastX;
//            self.lastX = X;
//        if (X >= 180) {
//            X = 180;
//        }
//        NSLog(@"%f",X);
//
//    }else {
//        self.lastX = X;
//        NSLog(@"%f",180 - fabs(self.lastX - fabs(X)));
//        if (X <= 0) {
//            X = 0 ;
//        }
//
//    }
        //1 设置四个方向键  定时器  每过一段时间加上一部分值
        //2点那走哪   再加上滑杆
        CGFloat W = [UIScreen mainScreen].bounds.size.width;
        CGFloat X = point.x / (W/180);
        NSLog(@"%f",X);
}



//- (void)slideChange:(UISlider *)slider {
//    int16_t i = slider.value;
//    NSLog(@"%d",i);
//    NSString *str = [NSString toHex:i];
//    NSString *str1 = @"FF0107!!FF";
//    str1 = [str1 stringByReplacingOccurrencesOfString:@"!!" withString:str];
//    NSData *data = [NSData decodeFromHexidecimal:str1];
//    NSError *err;
//    [self.socket connectToHost:@"192.168.1.1" onPort:2001 error:&err];
//    if (err != nil) {
//        [err localizedDescription];
//        
//    }
//    [self.socket writeData:data withTimeout:-1 tag:i];
//    
//}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    if(self.receivedData){
    }
    self.receivedData = [NSMutableData data];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.receivedData appendData:data];
    if (endMarkData == nil) {
        uint8_t endMarker[2] = END_MARK_BYTES;
        endMarkData = [[NSData alloc]initWithBytes:endMarker length:2];
    }
    NSRange endRange = [self.receivedData rangeOfData:endMarkData options:0 range:NSMakeRange(0, self.receivedData.length)];
    long long endLocation = endRange.location + endRange.length;
    if (self.receivedData.length >= endLocation) {
        NSData *imageData = [self.receivedData subdataWithRange:NSMakeRange(0, endLocation)];
        UIImage *receivedImage = [UIImage imageWithData:imageData];
        if (receivedImage) {
            self.videoView.image = receivedImage;
        }
    }
}


- (BOOL)prefersStatusBarHidden {
    return YES;
}
@end
