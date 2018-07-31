//
//  ViewController.m
//  EmmMBHUDDemo
//
//  Created by Emmm on 2018/7/31.
//  Copyright © 2018年 Emmm. All rights reserved.
//

#import "ViewController.h"
#import "EmmMBHUD/MBProgressHUD+Emm.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [MBProgressHUD showAnimateToview:self.view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
