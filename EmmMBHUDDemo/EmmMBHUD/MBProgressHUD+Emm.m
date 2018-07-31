//
//  MBProgressHUD+Emm.m
//  MBProgressHUD
//
//  Created by Emmm on 2018/7/27.
//

#import "MBProgressHUD+Emm.h"

#define isNSString(obj) [obj isKindOfClass:[NSString class]]
@implementation MBProgressHUD (Emm)
#pragma mark 显示信息
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.detailsLabelFont = [UIFont systemFontOfSize:16];
    hud.detailsLabelText =text;
    
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", icon]]];
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // 1秒之后再消失
    [hud hide:YES afterDelay:1.5];
    
}

+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view showTime:(NSTimeInterval)showTime
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.detailsLabelFont = [UIFont systemFontOfSize:16];
    hud.detailsLabelText =text;
    
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", icon]]];
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // 几秒秒之后再消失
    [hud hide:YES afterDelay:showTime];
    
}

#pragma mark 显示错误信息

+ (void)showError:(NSString *)error toView:(UIView *)view{
    [self show:error icon:@"MBError" view:view];
}

+ (void)showSuccess:(NSString *)success toView:(UIView *)view
{
    [self show:success icon:@"MBSuccess" view:view];
}

#pragma mark 显示一些信息
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view {
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = message;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // YES代表需要蒙版效果
    hud.dimBackground = NO;
    return hud;
}

+ (void)showSuccess:(NSString *)success
{
    [self showSuccess:success toView:nil];
}

+ (void)showError:(NSString *)error
{
    [self showError:error toView:nil];
}



+ (MBProgressHUD *)showMessage:(NSString *)message
{
    return [self showMessage:message toView:nil];
}

+ (void)showTip:(NSString *)tip
         toView:(UIView *)view
       showTime:(NSTimeInterval)showTime
       complete:(void(^)(void))complete
{
    
    if (isNSString(tip)) {
        if ([tip isEqualToString:@""])
        {
            return;
        }
        [self show:tip icon:nil view:view showTime:showTime?:1];
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(((showTime?:1) +0.3) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (complete) {
            complete();
        }
    });
    
    
}


+ (void)showTip:(NSString *)tip toView:(UIView *)view
{
    if (isNSString(tip)) {
        if ([tip isEqualToString:@""])
        {
            return;
        }
        [self show:tip icon:nil view:view];
    }
    
}

+ (void)showTipWithTime:(NSString *)tip
                 toView:(UIView *)view
               showTime:(NSTimeInterval)showTime
{
    if (isNSString(tip)) {
        if ([tip isEqualToString:@""])
        {
            return;
        }
        [self show:tip icon:nil view:view showTime:showTime?:1];
    }
    
    
}


+ (MBProgressHUD *)showAnimate{
    UIView *view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    [hud setColor:[UIColor clearColor]];
    
    UIImageView *imgLoading = [[UIImageView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, 70.0f, 70.0f)];
    
    imgLoading.animationImages = @[[UIImage imageNamed:@"MBLoading001"],
                                   [UIImage imageNamed:@"MBLoading002"],
                                   [UIImage imageNamed:@"MBLoading003"],
                                   [UIImage imageNamed:@"MBLoading004"],
                                   [UIImage imageNamed:@"MBLoading005"],
                                   [UIImage imageNamed:@"MBLoading006"],
                                   [UIImage imageNamed:@"MBLoading007"],
                                   [UIImage imageNamed:@"MBLoading008"],
                                   [UIImage imageNamed:@"MBLoading009"],
                                   [UIImage imageNamed:@"MBLoading010"]
                                   ];
    imgLoading.animationDuration = 1.0;
    imgLoading.animationRepeatCount = 0;
    [imgLoading startAnimating];
    hud.customView = imgLoading;
    
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    [hud setNeedsDisplay];
    [hud layoutIfNeeded];
    
    return hud;
}
+ (MBProgressHUD *)showAnimateToview:(UIView *)view yOffset:(CGFloat)yOffset
{
    
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    [hud setColor:[UIColor clearColor]];
    hud.yOffset = yOffset;
    UIImageView *imgLoading = [[UIImageView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, 70.0f, 70.0f)];
    
    imgLoading.animationImages = @[[UIImage imageNamed:@"MBLoading001"],
                                   [UIImage imageNamed:@"MBLoading002"],
                                   [UIImage imageNamed:@"MBLoading003"],
                                   [UIImage imageNamed:@"MBLoading004"],
                                   [UIImage imageNamed:@"MBLoading005"],
                                   [UIImage imageNamed:@"MBLoading006"],
                                   [UIImage imageNamed:@"MBLoading007"],
                                   [UIImage imageNamed:@"MBLoading008"],
                                   [UIImage imageNamed:@"MBLoading009"],
                                   [UIImage imageNamed:@"MBLoading010"]
                                   ];
    imgLoading.animationDuration = 1.0;
    imgLoading.animationRepeatCount = 0;
    [imgLoading startAnimating];
    hud.customView = imgLoading;
    
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    [hud setNeedsDisplay];
    [hud layoutIfNeeded];
    
    return hud;
}


+ (MBProgressHUD *)showAnimateToview:(UIView *)view
{
    
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    [hud setColor:[UIColor clearColor]];
    hud.userInteractionEnabled = YES;
    UIImageView *imgLoading = [[UIImageView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, 70.0f, 70.0f)];
    
    imgLoading.animationImages = @[[UIImage imageNamed:@"MBLoading001"],
                                   [UIImage imageNamed:@"MBLoading002"],
                                   [UIImage imageNamed:@"MBLoading003"],
                                   [UIImage imageNamed:@"MBLoading004"],
                                   [UIImage imageNamed:@"MBLoading005"],
                                   [UIImage imageNamed:@"MBLoading006"],
                                   [UIImage imageNamed:@"MBLoading007"],
                                   [UIImage imageNamed:@"MBLoading008"],
                                   [UIImage imageNamed:@"MBLoading009"],
                                   [UIImage imageNamed:@"MBLoading010"]
                                   ];
    imgLoading.animationDuration = 1.0;
    imgLoading.animationRepeatCount = 0;
    [imgLoading startAnimating];
    hud.customView = imgLoading;
    
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    [hud setNeedsDisplay];
    [hud layoutIfNeeded];
    
    return hud;
}


+ (void)hideHUDForView:(UIView *)view
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    [self hideHUDForView:view animated:YES];
}

+ (void)hideHUD
{
    [self hideHUDForView:nil];
}

@end
