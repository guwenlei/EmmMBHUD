//
//  MBProgressHUD+Emm.h
//  MBProgressHUD
//
//  Created by Emmm on 2018/7/27.
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (Emm)
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;

+ (void)showError:(NSString *)error toView:(UIView *)view;



+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;


+ (void)showSuccess:(NSString *)success;

+ (void)showError:(NSString *)error;


+ (MBProgressHUD *)showMessage:(NSString *)message;

+ (MBProgressHUD *)showAnimateToview:(UIView *)view;
+ (MBProgressHUD *)showAnimateToview:(UIView *)view yOffset:(CGFloat)yOffset;

+ (MBProgressHUD *)showAnimate;

+ (void)showTip:(NSString *)tip toView:(UIView *)view;

/**
 *  提示（自定义展示时间）
 *
 *  @param tip      内容
 *  @param view     显示的位置
 *  @param showTime 展示的时长
 */
+ (void)showTipWithTime:(NSString *)tip toView:(UIView *)view showTime:(NSTimeInterval)showTime;


+ (void)showTip:(NSString *)tip
         toView:(UIView *)view
       showTime:(NSTimeInterval)showTime
       complete:(void(^)(void))complete;

+ (void)hideHUDForView:(UIView *)view;

+ (void)hideHUD;


@end
