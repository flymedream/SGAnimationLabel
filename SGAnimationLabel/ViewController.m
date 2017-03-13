//
//  ViewController.m
//  SGAnimationLabel
//
//  Created by lihaohao on 2017/3/13.
//  Copyright © 2017年 低调的魅力. All rights reserved.
//

#import "ViewController.h"
#import "SGAnimationLabel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    SGAnimationLabel *dynamicLabel = [[SGAnimationLabel alloc]initWithFrame:CGRectMake(60, 100, 200, 30)];
    dynamicLabel.text = @"我不想说再见,不说再见,越长大越孤单";
    dynamicLabel.textColor = [UIColor orangeColor];
    dynamicLabel.font = [UIFont systemFontOfSize:24];
    dynamicLabel.speed = 0.2;
    [self.view addSubview:dynamicLabel];
    [dynamicLabel startAnimation];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
