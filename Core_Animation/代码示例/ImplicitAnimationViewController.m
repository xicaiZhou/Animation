//
//  ImplicitAnimationViewController.m
//  Core_Animation
//
//  Created by 周希财 on 2017/2/15.
//  Copyright © 2017年 iOS_ZXC. All rights reserved.
//

#import "ImplicitAnimationViewController.h"
#import "NoteViewController.h"
@interface ImplicitAnimationViewController ()
@property(nonatomic,weak) CALayer *layer;
@property(nonatomic,weak) UIView *RedView;
@end

@implementation ImplicitAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"隐式动画";
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor redColor].CGColor;
    //默认在(0,0)位置,如果不写也是在(0,0)位置
    layer.position = CGPointMake(100, 100);
    layer.anchorPoint = CGPointMake(0, 0);
    layer.bounds = CGRectMake(0, 0, 100, 100);
    [self.view.layer addSublayer:layer];
    _layer = layer;
    
    //    UIView *redView = [[UIView alloc] init];
    //    redView.backgroundColor = [UIColor redColor];
    //    //center默认点在(0,0)
    //    redView.bounds = CGRectMake(0, 0, 100, 100);
    //    //如果想要修改它的位置
    //    redView.layer.anchorPoint = CGPointMake(0, 0);
    //    redView.center = CGPointMake(100, 100);
    //    [self.view addSubview:redView];
    //    _RedView = redView;
}

- (UIColor *)randomColor{
    
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}


-(void)touchesBegan:(nonnull NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event{
    
    //隐式动画
    //    _layer.bounds = CGRectMake(0, 0, 20, 20);
    
    //只有非根层才有隐式动画
    //    _RedView.bounds =  CGRectMake(0, 0, 20, 20);
    
    //开启一个事务
    [CATransaction begin];
    //不需要隐式动画
    //    [CATransaction setDisableActions:YES];
    [CATransaction  setAnimationDuration:3.0];
    _layer.position = CGPointMake(arc4random_uniform(300), arc4random_uniform(400));
    
    _layer.cornerRadius = arc4random_uniform(50);
    _layer.borderColor = [self randomColor].CGColor;
    _layer.borderWidth = arc4random_uniform(15);
    [CATransaction commit];
    
}
- (void)SeeNotes{
    
    NoteViewController *vc = [[NoteViewController alloc] init];
    vc.titleName = @"隐式动画";
    [self.navigationController pushViewController:vc animated:YES];
}

@end
