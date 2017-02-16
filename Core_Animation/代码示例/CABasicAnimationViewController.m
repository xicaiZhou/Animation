//
//  CABasicAnimationViewController.m
//  Core_Animation
//
//  Created by 周希财 on 2017/2/15.
//  Copyright © 2017年 iOS_ZXC. All rights reserved.
//

#import "CABasicAnimationViewController.h"
#import "NoteViewController.h"
@interface CABasicAnimationViewController ()
@property(nonatomic,weak) UIView *RedView;
@end

@implementation CABasicAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"基础核心动画";
    
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    redView.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:redView];
    _RedView = redView;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    
//    呼吸动画
    /*
    CABasicAnimation *animation =[CABasicAnimation animationWithKeyPath:@"opacity"];
    
    animation.fromValue = [NSNumber numberWithFloat:1.0f];
    
    animation.toValue = [NSNumber numberWithFloat:0.0f];
    
    animation.autoreverses = YES;    //回退动画（动画可逆，即循环）
    
    animation.duration = 0.250f;
    
    animation.repeatCount = MAXFLOAT;
    
    animation.removedOnCompletion = NO;
    
    animation.fillMode = kCAFillModeForwards;//removedOnCompletion,fillMode配合使用保持动画完成效果
    
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    [_RedView.layer addAnimation:animation forKey:@"aAlpha"];
     */

    //抖动效果
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    rotationAnimation.toValue = [NSNumber numberWithFloat:.1];
    
    rotationAnimation.fromValue = [NSNumber numberWithFloat:-0.1];
    
    rotationAnimation.duration = 0.10f;
    
    rotationAnimation.repeatCount = MAXFLOAT;
    
    rotationAnimation.removedOnCompletion = NO;
    
    rotationAnimation.autoreverses = YES;
    
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    rotationAnimation.fillMode = kCAFillModeForwards;
    
    [_RedView.layer addAnimation:rotationAnimation forKey:nil];
   
}

- (void)SeeNotes{
    
    NoteViewController *vc = [[NoteViewController alloc] init];
    vc.titleName = @"基础核心动画";
    [self.navigationController pushViewController:vc animated:YES];
}
@end
