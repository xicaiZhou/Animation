//
//  CATransitionViewController.m
//  Core_Animation
//
//  Created by 周希财 on 2017/2/15.
//  Copyright © 2017年 iOS_ZXC. All rights reserved.
//

#import "CATransitionViewController.h"
#import "NoteViewController.h"
static int  _i = 2;
@interface CATransitionViewController ()
@property (nonatomic, strong) UIImageView *imageV;
@end

@implementation CATransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"转场动画";
    UIView *fatherView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 150, 200)];
    [self.view addSubview:fatherView];
    UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1"]];
    image.frame = CGRectMake(0, 0, 150, 200);
    [fatherView addSubview:image];
    
    _imageV = image;
}
-(void)touchesBegan:(nonnull NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event{
    
    
    
    if(_i > 3){
        _i = 1;
    }
    //可以弄一个角标记录当前点击的次数,
    NSString *imageName = [NSString stringWithFormat:@"%d",_i];
    self.imageV.image = [UIImage imageNamed:imageName];
    _i++;
    
    
    //创建转场动画
    CATransition *anim = [CATransition animation];
    //设置转场类型
    //    anim.type = @"cube";
    anim.duration = 1;
    //它是往它的父控件上面抽
    //可以给他添加一个View里面, 让它和UiImageView一样大小
    anim.type = @"cube";
    anim.subtype = kCATransitionFromLeft;
    
    
//    ======================================================
    //动画的开始进度
    anim.startProgress = 0.5;
    //结束进度,有一段是没有动画的.
    anim.endProgress  = 0.5;
    
    [_imageV.layer addAnimation:anim forKey:nil];
    
    //转场动画必须要和转场代码一起.
    //把它们分开的话, 就没有这个转场效果了.
    //验证
    
}
- (void)SeeNotes{
    
    NoteViewController *vc = [[NoteViewController alloc] init];
    vc.titleName = @"CATransition转场动画";
    [self.navigationController pushViewController:vc animated:YES];
}

@end
