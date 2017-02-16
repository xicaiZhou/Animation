//
//  CAKeyframeAnimationViewController.m
//  Core_Animation
//
//  Created by 周希财 on 2017/2/16.
//  Copyright © 2017年 iOS_ZXC. All rights reserved.
//

#import "CAKeyframeAnimationViewController.h"
#import "NoteViewController.h"
@interface CAKeyframeAnimationViewController ()
@property (nonatomic, strong) UIImageView *imageV;

@end

@implementation CAKeyframeAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"帧动画";
    self.view.backgroundColor = [UIColor whiteColor];
    _imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"阿狸头像"]];
    _imageV.frame = CGRectMake(0, 0, 100, 100);
    _imageV.center = CGPointMake(self.view.center.x, 300);
    [self.view addSubview:_imageV];
   

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [UIView animateWithDuration:0.5 animations:^{
        
        /*
         1.用路径path的方法
           1）贝塞尔曲线UIBezierPath（圆弧运动）
         CAKeyframeAnimation *key = [CAKeyframeAnimation animation];
         key.keyPath = @"position";
         UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.view.center.x, 150) radius:150 startAngle:3.1415926 endAngle:0 clockwise:NO];
         key.path = path.CGPath;
         
         key.duration = 2;
         
         key.repeatCount = MAXFLOAT;
         
         key.autoreverses = YES;
         
         key.fillMode = kCAFillModeForwards;

         [_imageV.layer addAnimation:key forKey:nil];
         
         2)CGMutablePathRef
         
         CAKeyframeAnimation *key = [CAKeyframeAnimation animationWithKeyPath:@"position"];
         key.duration = 2;
         key.repeatCount = MAXFLOAT;
         key.autoreverses = YES;
         CGMutablePathRef path = CGPathCreateMutable();
         
         //起始坐标
         CGPathMoveToPoint(path, NULL, self.imageV.center.x, self.imageV.center.y);
         //直线
         //设置移动轨迹 也就是每一帧（坐标）
         //参数1.为移动路径
         //参数2.备用参数，设为NULL
         //参数3.移动的x坐标
         //参数4.移动的y坐标
         CGPathAddLineToPoint(path, NULL, 100, 100);
         CGPathAddLineToPoint(path, NULL, 10, 10);
         CGPathAddLineToPoint(path, NULL, 20, 100);
         CGPathAddLineToPoint(path, NULL, 50, 300);
         CGPathAddLineToPoint(path, NULL, 150, 100);
         
         //曲线
         CGPathAddCurveToPoint(path, NULL, 200, 200, 100, 120, 40, 60);
         CGPathAddCurveToPoint(path, NULL, 80, 10, 20, 100, 300, 100);
         CGPathAddCurveToPoint(path, NULL, 10, 60, 200, 180, 30, 100);
         CGPathAddCurveToPoint(path, NULL, 50, 90, 110, 10, self.imageV.center.x,self.imageV.center.y );
         
         key.path = path;
         [_imageV.layer addAnimation:key forKey:nil];

         */
        
    /*
         2.用value的方式
         CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
         
         //设置value
         
         NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
         
         NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(200, 100)];
         
         NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(200, 200)];
         
         NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(100, 200)];
         
         NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(100, 300)];
         
         NSValue *value6 = [NSValue valueWithCGPoint:CGPointMake(200, 400)];
         
         animation.values = @[value1, value2, value3, value4, value5, value6];
         
         //重复次数 默认为1
         
         animation.repeatCount = MAXFLOAT;
         
         //设置是否原路返回默认为不
         
         animation.autoreverses = YES;
         
         //设置动画之行时间
         
         animation.duration = 4.0f;
         
         animation.removedOnCompletion = NO;
         
         animation.fillMode = kCAFillModeForwards;
         
         animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
         //给这个view加上动画效果
         
         [_imageV.layer addAnimation:animation forKey:nil];

    */
        
    }];
    
}


- (void)SeeNotes{

    
    NoteViewController *vc = [[NoteViewController alloc] init];
    vc.titleName = @"关键帧动画";
    [self.navigationController pushViewController:vc animated:YES];

}
@end
