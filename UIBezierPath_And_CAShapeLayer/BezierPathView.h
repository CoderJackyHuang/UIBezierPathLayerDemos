//
//  BezierPathView.h
//  UIBezierPath_And_CAShapeLayer
//
//  Created by huangyibiao on 15/12/2.
//  Copyright © 2015年 huangyibiao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, HYBBezierPathType) {
  kDefaultPath = 1, // 三角形
  kRectPath = 2, // 矩形
  kCirclePath = 3,//圆
  kOvalPath = 4, // 椭圆
  kRoundedRectPath = 5, // 带圆角的矩形
  kArcPath = 6, // 弧
  kSecondBezierPath = 7, // 二次贝塞尔曲线
  kThirdBezierPath = 8 // 三次贝塞尔曲线
};

@interface BezierPathView : UIView

@property (nonatomic, assign) HYBBezierPathType type;

@end
