//
//  CALayerNoteViewController.m
//  Core_Animation
//
//  Created by 周希财 on 2017/2/15.
//  Copyright © 2017年 iOS_ZXC. All rights reserved.
//

#import "NoteViewController.h"

@interface NoteViewController ()<UITextViewDelegate>

@end
//    /Users/zhouxicai/Desktop/Core_Animation/Core_Animation/代码笔记/CALayer基本操作.md
@implementation NoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = _titleName;
    self.view.backgroundColor = [UIColor whiteColor];
    NSString *name = self.titleName;
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"txt"];
    NSString *str = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@",str);
    
    UITextView *text = [[UITextView alloc] init];
    text.frame = self.view.frame;
    text.delegate = self;
    text.font = [UIFont systemFontOfSize:20];
    text.editable = NO;//禁止编辑
    text.text = str;
    [self.view addSubview:text];
    
}

@end
