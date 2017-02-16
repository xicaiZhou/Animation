//
//  CAAnimationGroupViewController.m
//  Core_Animation
//
//  Created by 周希财 on 2017/2/16.
//  Copyright © 2017年 iOS_ZXC. All rights reserved.
//

#import "CAAnimationGroupViewController.h"
#import "NoteViewController.h"
@interface CAAnimationGroupViewController ()
@property(nonatomic,weak) UIView *RedView;
@end

@implementation CAAnimationGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"CAAnimationGroup动画组";
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    redView.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:redView];
    _RedView = redView;

}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{


    CAAnimationGroup *group = [CAAnimationGroup animation];
    
//    平移
    CABasicAnimation *anim = [CABasicAnimation animation];
    anim.keyPath = @"position.y";
    anim.toValue = @400;
    
//    缩放
    CABasicAnimation *scaleAnim = [CABasicAnimation  animation];
    scaleAnim.keyPath = @"transform.scale";
    scaleAnim.toValue = @0.5;
//    设置动画组属性
    group.animations = @[anim,scaleAnim];
    
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeForwards;
//    添加组动画
    [_RedView.layer addAnimation:group forKey:nil];
}
- (void)SeeNotes{
    
    NoteViewController *vc = [[NoteViewController alloc] init];
    vc.titleName = @"动画组";
    [self.navigationController pushViewController:vc animated:YES];
    
}
@end
