//
//  LSSCycleAanimation.m
//  LSSCyclePointScacle
//
//  Created by 连帅帅 on 2018/11/15.
//  Copyright © 2018年 连帅帅. All rights reserved.
//

#import "LSSCycleAanimation.h"

@interface LSSCycleAanimation ()

@property(nonatomic,weak)UIView * red1;
@property(nonatomic,weak)UIView * red2;
@property(nonatomic,weak)UIView * red3;
@property(nonatomic,assign)CGFloat width;
@end

@implementation LSSCycleAanimation

+(instancetype)shareinstance{
    
    static LSSCycleAanimation *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[LSSCycleAanimation alloc] init];
    });
    
    return instance;
}


+(void)setUpScaleAnimation:(UIView *)fatherView andAnimationType:(animationType)type{
    NSString * typeStr = @"";
    NSArray * vaules1;
    NSArray * vaules2;
    NSArray * vaules3;
    switch (type) {
        case scale:
        {
           //缩放
            [LSSCycleAanimation shareinstance].width = 5;
            typeStr = @"transform.scale";
            vaules1 = @[@3,@2,@1,@3];
            vaules2 = @[@2,@3,@2.2,@2];
            vaules3 = @[@1,@1,@3,@1];
        }
            break;
        case opacity:
        {
           //颜色
             [LSSCycleAanimation shareinstance].width = 10;
            typeStr = @"opacity";
            vaules1 = @[@1,@0.3,@0.3,@1];
            vaules2 = @[@0.3,@1,@0.3,@0.3];
            vaules3 = @[@0.3,@0.3,@1,@0.3];
        }
            break;
        default:
            break;
    }
    //第一个球
    CGPoint redPoint1 = CGPointMake(fatherView.center.x -20, fatherView.bounds.size.height/2.0);
    
    UIView * red1 =  [self setUpView:fatherView andPoint:redPoint1];
    [LSSCycleAanimation shareinstance].red1 = red1;
    [self addAnimation:red1 andVaules:vaules1 andKeyPath:@"firstAnimation" andAnimationPath:typeStr];
    
    //第二个球
    CGPoint redPoint2 = CGPointMake(fatherView.center.x, fatherView.bounds.size.height/2.0);
    UIView * red2 = [self setUpView:fatherView andPoint:redPoint2];
    [LSSCycleAanimation shareinstance].red2 = red2;
    [self addAnimation:red2 andVaules:vaules2 andKeyPath:@"centerAnimation" andAnimationPath:typeStr];
    
    //第三个球
    CGPoint redPoint3 = CGPointMake(fatherView.center.x +20, fatherView.bounds.size.height/2.0);
    UIView * red3 =  [self setUpView:fatherView andPoint:redPoint3];
    [LSSCycleAanimation shareinstance].red3 = red3;
    [self addAnimation:red3 andVaules:vaules3 andKeyPath:@"lastAnimation" andAnimationPath:typeStr];
}

//创建三个球view
+(UIView *)setUpView:(UIView *)fatherView andPoint:(CGPoint)center{
    CGFloat redWidth =  [LSSCycleAanimation shareinstance].width;
    UIView * animationView = [[UIView alloc]initWithFrame:CGRectMake(center.x, center.y, redWidth, redWidth)];

    animationView.backgroundColor = [UIColor grayColor];
    animationView.layer.cornerRadius = redWidth/2.0;
    animationView.clipsToBounds = YES;
    [fatherView addSubview:animationView];
    return animationView;
}

//动画
+(void)addAnimation:(UIView *)view andVaules:(NSArray*)vaules andKeyPath:(NSString *)keyPath andAnimationPath:(NSString *)animationPath{
   
    CAKeyframeAnimation * animation = [CAKeyframeAnimation animationWithKeyPath:animationPath];
    
    animation.duration = 0.6;
    
    animation.repeatCount = MAXFLOAT;
    animation.values = vaules;
    
    animation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    [view.layer addAnimation:animation forKey:keyPath];
}

+(void)hideAnimation{
    [[LSSCycleAanimation shareinstance].red1.layer.sublayers respondsToSelector:@selector(removeFromSuperlayer)];
    [[LSSCycleAanimation shareinstance].red2.layer.sublayers respondsToSelector:@selector(removeFromSuperlayer)];
    [[LSSCycleAanimation shareinstance].red3.layer.sublayers respondsToSelector:@selector(removeFromSuperlayer)];
    [[LSSCycleAanimation shareinstance].red1 removeFromSuperview];
    [[LSSCycleAanimation shareinstance].red2 removeFromSuperview];
    [[LSSCycleAanimation shareinstance].red3 removeFromSuperview];
    
}

@end
