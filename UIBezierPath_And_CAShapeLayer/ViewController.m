//
//  ViewController.m
//  UIBezierPath_And_CAShapeLayer
//
//  Created by huangyibiao on 15/12/1.
//  Copyright © 2015年 huangyibiao. All rights reserved.
//

#import "ViewController.h"
#import "BezierPathView.h"

@interface ViewController ()

@property (nonatomic, strong) CAShapeLayer *loadingLayer;
@property (nonatomic, strong) NSTimer       *timer;
@property (nonatomic, strong) NSArray       *animationTypes;
@property (nonatomic, assign) NSUInteger    index;
@property (nonatomic, strong) BezierPathView *pathView;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.automaticallyAdjustsScrollViewInsets = NO;
  self.edgesForExtendedLayout = UIRectEdgeNone;
  
  // 如果要测试UIBezierPath，打开注释
  [self testBezierPath];
  
  // 使用CAShapeLayer与UIBezierPath画圆
//  [self drawCircle];
  
//  [self drawHalfCircle];
}

- (void)drawHalfCircle {
  self.loadingLayer = [self drawCircle];
  
  // 这个是用于指定画笔的开始与结束点
  self.loadingLayer.strokeStart = 0.0;
  self.loadingLayer.strokeEnd = 0.75;
  
  self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                                target:self
                                              selector:@selector(updateCircle)
                                              userInfo:nil
                                               repeats:YES];
}

- (void)updateCircle {
  if (self.loadingLayer.strokeEnd > 1 && self.loadingLayer.strokeStart < 1) {
    self.loadingLayer.strokeStart += 0.1;
  } else if (self.loadingLayer.strokeStart == 0) {
    self.loadingLayer.strokeEnd += 0.1;
  }
  
  if (self.loadingLayer.strokeEnd == 0) {
    self.loadingLayer.strokeStart = 0;
  }
  
  if (self.loadingLayer.strokeStart >= 1 && self.loadingLayer.strokeEnd >= 1) {
    self.loadingLayer.strokeStart = 0;
    [self.timer invalidate];
    self.timer = nil;
  }
}

- (CAShapeLayer *)drawCircle {
  CAShapeLayer *circleLayer = [CAShapeLayer layer];
  // 指定frame，只是为了设置宽度和高度
  circleLayer.frame = CGRectMake(0, 0, 200, 200);
  // 设置居中显示
  circleLayer.position = self.view.center;
  // 设置填充颜色
  circleLayer.fillColor = [UIColor clearColor].CGColor;
  // 设置线宽
  circleLayer.lineWidth = 2.0;
  // 设置线的颜色
  circleLayer.strokeColor = [UIColor redColor].CGColor;
  
  // 使用UIBezierPath创建路径
  CGRect frame = CGRectMake(0, 0, 200, 200);
  UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:frame];
  
  // 设置CAShapeLayer与UIBezierPath关联
  circleLayer.path = circlePath.CGPath;
  
  // 将CAShaperLayer放到某个层上显示
  [self.view.layer addSublayer:circleLayer];
  
  return circleLayer;
}

- (void)testBezierPath {
  CGFloat height = [UIScreen mainScreen].bounds.size.height;
  BezierPathView *v = [[BezierPathView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, height - 140 - 64)];
  [self.view addSubview:v];
  v.layer.borderColor = [UIColor redColor].CGColor;
  v.layer.borderWidth = 5;
  v.backgroundColor = [UIColor whiteColor];
  
  v.type = kDefaultPath;
  self.index = 0;
  
  self.animationTypes = @[@(kDefaultPath),
                          @(kRectPath),
                          @(kCirclePath),
                          @(kOvalPath),
                          @(kRoundedRectPath),
                          @(kArcPath),
                          @(kSecondBezierPath)];
  
  self.timer = [NSTimer scheduledTimerWithTimeInterval:1
                                                target:self
                                              selector:@selector(updateType)
                                              userInfo:nil
                                               repeats:YES];
  
  self.view.layer.borderWidth = 1;
  self.view.layer.borderColor = [UIColor blueColor].CGColor;
  self.pathView = v;
}

- (void)updateType {
  if (self.index + 1 < self.animationTypes.count) {
    self.index ++;
  } else {
    self.index = 0;
  }
  
  self.pathView.type = [[self.animationTypes objectAtIndex:self.index] intValue];
  [self.pathView setNeedsDisplay];
}

@end
