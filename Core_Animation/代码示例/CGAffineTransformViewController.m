//
//  CGAffineTransformViewController.m
//  Core_Animation
//
//  Created by 周希财 on 2017/2/15.
//  Copyright © 2017年 iOS_ZXC. All rights reserved.
//

#import "CGAffineTransformViewController.h"
#import "NoteViewController.h"
@interface CGAffineTransformViewController ()
@property (nonatomic, strong) UIView *trans;
@end

@implementation CGAffineTransformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"CGAffineTransform";
    _trans = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
    [self.view addSubview:_trans];
    _trans.backgroundColor = [UIColor lightGrayColor];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [UIView animateWithDuration:0.5 animations:^{
        
        CALayer *lay = [CALayer layer];
        lay.contents = (__bridge id _Nullable)([UIImage imageNamed:@"阿狸头像"].CGImage);
        lay.frame = CGRectMake(25, 25, 150, 150);
    
        [_trans.layer addSublayer:lay];

       //旋转 (两种效果相同)
//        _trans.layer.affineTransform = CGAffineTransformMakeRotation(M_PI_4);
        _trans.transform = CGAffineTransformMakeRotation(M_PI_4);


        //   缩放 (两种方法不同)
        /********方法中有Make相对于初始状态,没有Make关键字的想对于上一次*********/
//        _trans.transform = CGAffineTransformMakeScale(0.5, 0.5);
        
         //在原来缩小0.5倍基础上放大两倍
        _trans.transform = CGAffineTransformScale(_trans.transform, 0.5, 0.5);

        //平移
        
        _trans.transform = CGAffineTransformTranslate(_trans.transform,100, 100);
    }];
}
- (void)SeeNotes{
    
    NoteViewController *vc = [[NoteViewController alloc] init];
    vc.titleName = @"CGAffineTransform";
    [self.navigationController pushViewController:vc animated:YES];
}
@end
