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


@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.automaticallyAdjustsScrollViewInsets = NO;
  self.edgesForExtendedLayout = UIRectEdgeNone;
  
  CGFloat height = [UIScreen mainScreen].bounds.size.height;
  BezierPathView *v = [[BezierPathView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, height - 140 - 64)];
  [self.view addSubview:v];
  v.layer.borderColor = [UIColor redColor].CGColor;
  v.layer.borderWidth = 5;
  v.backgroundColor = [UIColor whiteColor];
  
//  v.type = kDefaultPath;
//  v.type = kRectPath;
//  v.type = kCirclePath;
//  v.type = kOvalPath;
//  v.type = kRoundedRectPath;
//  v.type = kArcPath;
//  v.type = kSecondBezierPath;
  v.type = kThirdBezierPath;
  
  self.view.layer.borderWidth = 1;
  self.view.layer.borderColor = [UIColor blueColor].CGColor;
}


@end
