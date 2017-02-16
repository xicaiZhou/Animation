//
//  CALayerViewController.m
//  Core_Animation
//
//  Created by 周希财 on 2017/2/15.
//  Copyright © 2017年 iOS_ZXC. All rights reserved.
//

#import "CALayerViewController.h"
#import "NoteViewController.h"
@interface CALayerViewController ()
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation CALayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"CALayer基本操作";
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    _imageView.image = [UIImage imageNamed:@"阿狸头像"];
    [self.view addSubview:_imageView];
    
    
    // Do any additional setup after loading the view.
}
- (void)SeeNotes{

    NoteViewController *vc = [[NoteViewController alloc] init];
    vc.titleName = @"CALayer基本操作";
    [self.navigationController pushViewController:vc animated:YES];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    //设置图片的圆角半径
    _imageView.layer.cornerRadius = 50;
    //裁剪,超出裁剪区域的部分全部裁剪掉
    _imageView.layer.masksToBounds = YES;
    
    //    阴影
    //    设置阴影不透明Opacity View的透明度 alpha
    _imageView.layer.shadowOpacity = 1;
    //    运行得出结论: 默认图层是有阴影的, 只不过,是透明的
    //    设置阴影的模糊程度
    _imageView.layer.shadowRadius  =10;
    //    设置阴影的颜色,把UIKit转换成CoreGraphics框架,用.CG开头
    _imageView.layer.shadowColor = [UIColor blueColor].CGColor;
    
    //设置图形边框
    _imageView.layer.borderWidth = 2;
    _imageView.layer.borderColor = [UIColor whiteColor].CGColor;




}

@end
