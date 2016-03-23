//
//  ViewController.m
//  BezierPathPhoto
//
//  Created by xwy on 16/3/23.
//  Copyright © 2016年 MJ. All rights reserved.
//

#import "ViewController.h"

//屏幕尺寸
#define UI_width [UIScreen mainScreen].bounds.size.width
#define UI_height [UIScreen mainScreen].bounds.size.height
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //背景图片
    UIImageView *imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tupian87.jpg"]];
    imageView1.frame = CGRectMake(0, 64, UI_width, 400);
    imageView1.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:imageView1];
    
    //加蒙版
    UIView *blackView = [[UIView alloc] initWithFrame:imageView1.bounds];
    blackView.backgroundColor = [UIColor blackColor];
    blackView.alpha = 0.5;
    [imageView1 addSubview:blackView];

    //再第二张图片上面进行曲线修改
    UIImageView *imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tupian87.jpg"]];
    imageView2.frame = imageView1.bounds;
    imageView2.contentMode = UIViewContentModeScaleAspectFill;
    [imageView1 addSubview:imageView2];

    //先画出一个大圆
    CGFloat radius1 = 290/2;
    CGFloat startAngle1 = 0;
    CGFloat endAngle1 = M_PI*2;
    CGPoint centerPoint1 = CGPointMake(imageView1.frame.size.width*0.5, (imageView1.frame.size.height-64)*0.5+44);
    UIBezierPath *path1 = [UIBezierPath bezierPathWithArcCenter:centerPoint1 radius:radius1 startAngle:startAngle1 endAngle:endAngle1 clockwise:YES];
    [path1 addLineToPoint:centerPoint1];
    
    CAShapeLayer *layer1 = [[CAShapeLayer alloc] init];
    layer1.path = path1.CGPath;
    imageView2.layer.mask = layer1;

    //右下角圆的一部分
    CGFloat radius2 = 250/2;
    CGFloat startAngle2 = M_PI;
    CGFloat endAngle2 = M_PI_2*3;
    CGPoint centerPoint2 = CGPointMake(imageView1.frame.size.width*0.5+radius1, (imageView1.frame.size.height-64)*0.5+44+radius1);
    
    UIBezierPath *path2 = [UIBezierPath bezierPathWithArcCenter:centerPoint2 radius:radius2 startAngle:startAngle2 endAngle:endAngle2 clockwise:YES];
//    起点，终点与中心 相连
    [path2 addLineToPoint:centerPoint2];
//    起点与终点相连
//    [path2 closePath];
    
    CAShapeLayer *layer2 = [[CAShapeLayer alloc] init];
    layer2.path = path2.CGPath;
    layer2.fillColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.5f].CGColor;
    [imageView2.layer addSublayer:layer2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
