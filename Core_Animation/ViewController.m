//
//  ViewController.m
//  Core_Animation
//
//  Created by 周希财 on 2017/2/15.
//  Copyright © 2017年 iOS_ZXC. All rights reserved.
//

#import "ViewController.h"
#import "CALayerViewController.h"
#import "CGAffineTransformViewController.h"
#import "CATransform3DViewController.h"
#import "ImplicitAnimationViewController.h"
#import "CABasicAnimationViewController.h"
#import "CATransitionViewController.h"
#import "CAKeyframeAnimationViewController.h"
#import "CAAnimationGroupViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UIButton *btn;
}
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *thankView;
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) UIView *shadow;
@end

@implementation ViewController
- (void)viewDidAppear:(BOOL)animated{

    if (![[NSUserDefaults standardUserDefaults] valueForKey:@"isFirst"]) {
        
        [[NSUserDefaults standardUserDefaults] setValue:@"YES" forKey:@"isFirst"];
        UIWindow *window = [[UIApplication sharedApplication] keyWindow];
        [UIView animateWithDuration:0.5 animations:^{
            
            _shadow = [[UIView alloc]initWithFrame:window.bounds];
            _shadow.backgroundColor = [UIColor grayColor];
            _shadow.alpha = 0.7;
            [window addSubview:_shadow];
            [window addSubview:self.thankView];
            
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:1 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:0.1 options:UIViewAnimationOptionAllowUserInteraction animations:^{
                
                self.thankView.center = window.center;
                
            } completion:^(BOOL finished) {
                
                btn = [UIButton buttonWithType:UIButtonTypeCustom];
                btn.frame = CGRectMake(window.bounds.size.width - 80, 100, 50, 20);
                [btn setTitle:@"开始" forState:UIControlStateNormal];
                [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                [btn addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
                [window addSubview:btn];
                
                CABasicAnimation *an = [CABasicAnimation animation];
                an.keyPath = @"transform.rotation.z";
                an.toValue = [NSNumber numberWithFloat:.1];
                an.fromValue = [NSNumber numberWithFloat:-0.1];
                an.duration = 0.10f;
                an.repeatCount = MAXFLOAT;
                an.removedOnCompletion = NO;
                an.autoreverses = YES;
                [self.thankView.layer addAnimation:an forKey:nil];
            }];
            
        }];

    }else{
        
    }
    
}
- (void)next{

    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    [self.thankView.layer removeAllAnimations];
    
    [UIView animateWithDuration:0.5 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:0.1 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        self.thankView.center = CGPointMake(window.center.x, window.center.y * 3);
    } completion:^(BOOL finished) {

        [btn removeFromSuperview];
        
        _shadow.alpha = 0;
        CATransition *anim = [CATransition animation];
        anim.type = @"reveal";
        anim.duration = 1;
        anim.subtype = kCATransitionFromBottom;
        
        [_shadow.layer addAnimation:anim forKey:nil];

    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Core Animation";
    
    _dataArray = @[@"CALayer的基本操作",
                   @"CGAffineTransform 仿射变形",
                   @"CATransform3D",
                   @"隐式动画",
                   @"CABasicAnimation基础核心动画",
                   @"CATransition转场动画",
                   @"CAKeyframeAnimation帧动画",
                   @"CAAnimationGroup动画组"];
    [self.view addSubview:self.tableView];
    
    [self thankView1];

}

- (void)thankView1{

    if (!_thankView) {
        _thankView = [[UIView alloc] initWithFrame:CGRectMake(self.view.center.x - 100, -500, 200, 200)];
//         _thankView.center = self.view.center;
        _thankView.layer.borderWidth = 1;
        _thankView.layer.borderColor = [UIColor purpleColor].CGColor;
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
        label.font = [UIFont systemFontOfSize:20];
        label.text = @"Thanks";
        label.backgroundColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        [_thankView addSubview:label];
        UIImageView *imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"0"]];
        imageV.frame = CGRectMake(0, 30, 200, 150);
        [label addSubview:imageV];
        UILabel *labelT = [[UILabel alloc] initWithFrame:CGRectMake(0, 170, 200, 30)];
        labelT.font = [UIFont systemFontOfSize:20];
        labelT.text = @"希望它能帮助你";
        label.backgroundColor = [UIColor whiteColor];
        labelT.textAlignment = NSTextAlignmentCenter;
        [_thankView addSubview:labelT];
        //        _thankView = view;
    }
}
- (UITableView *)tableView{

    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.backgroundColor = [UIColor whiteColor];
        [tableView setTableFooterView:[[UIView alloc] init]];
        _tableView = tableView;
    }
    return _tableView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _dataArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *cellIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = _dataArray[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
    switch (indexPath.row) {
        case 0:
            [self.navigationController pushViewController:[[CALayerViewController alloc] init] animated:YES];
            break;
        case 1:
            [self.navigationController pushViewController:[[CGAffineTransformViewController alloc] init] animated:YES];
            break;
        case 2:
            [self.navigationController pushViewController:[[CATransform3DViewController alloc] init] animated:YES];
            break;
        case 3:
            [self.navigationController pushViewController:[[ImplicitAnimationViewController alloc] init] animated:YES];
            break;
        case 4:
            [self.navigationController pushViewController:[[CABasicAnimationViewController alloc] init] animated:YES];
            break;
        case 5:
            [self.navigationController pushViewController:[[CATransitionViewController alloc] init] animated:YES];
            break;
        case 6:
            [self.navigationController pushViewController:[[CAKeyframeAnimationViewController alloc] init] animated:YES];
            break;
        case 7:
            [self.navigationController pushViewController:[[CAAnimationGroupViewController alloc] init] animated:YES];
            break;
        default:
            break;
    }
}
@end
