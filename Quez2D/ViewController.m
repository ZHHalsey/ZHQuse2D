//
//  ViewController.m
//  Quez2D
//
//  Created by ZZZZZ on 15/11/6.
//  Copyright (c) 2015年 张豪. All rights reserved.
//

#import "ViewController.h"
#import "ZHView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor blueColor];
    [self createView];

}

- (void)createView{
    if (zhbview == nil) {
        zhbview = [[ZHView alloc]initWithFrame:CGRectMake(self.view.bounds.size.width/2 - 150, self.view.bounds.size.height/2 - 150, 300, 300)];
        zhbview.backgroundColor = [UIColor yellowColor];
        [self.view addSubview:zhbview];
        [self createBtn];
    }
}
- (void)createBtn{
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(0, 0, 40, 30);
    [btn1 setTitle:@"清屏" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(clearBtn) forControlEvents:UIControlEventTouchUpInside];
    btn1.backgroundColor = [UIColor grayColor];
    btn1.tag = 101;
    [zhbview addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(50, 0, 40, 30);
    [btn2 setTitle:@"回退" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(backBtn) forControlEvents:UIControlEventTouchUpInside];
    btn2.backgroundColor = [UIColor grayColor];
    btn2.tag = 102;
    [zhbview addSubview:btn2];

    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn3.frame = CGRectMake(100, 0, 40, 30);
    [btn3 setTitle:@"保存" forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(saveBtn) forControlEvents:UIControlEventTouchUpInside];
    btn3.backgroundColor = [UIColor grayColor];
    btn3.tag = 103;
    [zhbview addSubview:btn3];


}

#pragma mark - 开始对上面的三个按钮添加点击事件

- (void)clearBtn{
    
    NSLog(@"点击了清屏按钮");
    [zhbview clearBtn];
}

- (void)backBtn{
    NSLog(@"点击了回退按钮");
    [zhbview backBtn];
}

- (void)saveBtn{

    NSLog(@"点击了保存按钮");
}

@end
