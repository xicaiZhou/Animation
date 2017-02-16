//
//  CATransform3DViewController.m
//  Core_Animation
//
//  Created by 周希财 on 2017/2/15.
//  Copyright © 2017年 iOS_ZXC. All rights reserved.
//

#import "CATransform3DViewController.h"
#import "NoteViewController.h"
@interface CATransform3DViewController ()
@property (nonatomic, strong) UIView *trans;

@end

@implementation CATransform3DViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"CATransform3D";
    _trans = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
    [self.view addSubview:_trans];
    _trans.backgroundColor = [UIColor lightGrayColor];

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    /*********************简单的一个旋转效果**************************/
    CATransform3D affine = CATransform3DMakeRotation(M_PI_4, 1, 1, 0);
   
     /*********************简单的一个缩放效果**************************/
     affine = CATransform3DMakeScale(0.5, 0.5, 1);
    
     /*********************简单的一个平移效果**************************/
    affine = CATransform3DMakeTranslation(100, 200, 200);
    
     _trans.layer.transform = affine;
    
    /*********************3D透视效果**************************/
//    CATransform3D  affine = CATransform3DIdentity;
//    affine.m34 = -1.0 / 500.0;
//    affine = CATransform3DRotate(affine, M_PI_4, 1, 0, 0);
//    _trans.layer.transform = affine;

}
- (void)SeeNotes{
    NoteViewController *vc = [[NoteViewController alloc] init];
    vc.titleName = @"CATransform3D";
    [self.navigationController pushViewController:vc animated:YES];
    
}
@end
