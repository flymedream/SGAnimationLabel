# SGAnimationLabel
一个滚动显示 label;
项目交流:993234418@qq.com;
使用说明:
    SGAnimationLabel *dynamicLabel = [[SGAnimationLabel alloc]initWithFrame:CGRectMake(60, 100, 200, 30)];
    dynamicLabel.text = @"我不想说再见,不说再见,越长大越孤单";
    dynamicLabel.textColor = [UIColor orangeColor];
    dynamicLabel.font = [UIFont systemFontOfSize:24];
    dynamicLabel.speed = 0.2;
    [self.view addSubview:dynamicLabel];
    [dynamicLabel startAnimation];












