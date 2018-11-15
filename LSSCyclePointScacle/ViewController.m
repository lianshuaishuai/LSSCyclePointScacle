//
//  ViewController.m
//  LSSCyclePointScacle
//
//  Created by 连帅帅 on 2018/11/15.
//  Copyright © 2018年 连帅帅. All rights reserved.
//

#import "ViewController.h"
#import "LSSCycleAanimation.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView * sacleView  = [UIView new];

    [self.view addSubview:sacleView];
    sacleView.frame  = CGRectMake(0, 100, self.view.bounds.size.width, 200);
    NSLog(@"%f",sacleView.center.y);
    [LSSCycleAanimation setUpScaleAnimation:sacleView andAnimationType:scale];
    
    UIView * opacityView  = [UIView new];

    [self.view addSubview:opacityView];
    opacityView.frame  = CGRectMake(0, CGRectGetMaxY(sacleView.frame)+30, self.view.bounds.size.width, 200);
    [LSSCycleAanimation setUpScaleAnimation:opacityView andAnimationType:opacity];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [LSSCycleAanimation hideAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
