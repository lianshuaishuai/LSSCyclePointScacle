//
//  LSSCycleAanimation.h
//  LSSCyclePointScacle
//
//  Created by 连帅帅 on 2018/11/15.
//  Copyright © 2018年 连帅帅. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef enum : NSUInteger {
scale = 0,
opacity,
} animationType;

@interface LSSCycleAanimation : NSObject
/*=============================  本类自己调用 方法   =====================================*/

+(instancetype)shareinstance;
/*=============================  外部调用 方法   =====================================*/
+(void)setUpScaleAnimation:(UIView *)fatherView andAnimationType:(animationType)type;
+(void)hideAnimation;
@end
