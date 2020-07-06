//
//  SGAnimationLabel.m
//  SGAnimationLabel
//
//  Created by lihaohao on 2017/3/13.
//  Copyright © 2017年 低调的魅力. All rights reserved.
//

#import "SGAnimationLabel.h"
#define kDynamicLabelAnimationKey @"DynamicLabelAnimation"
@interface SGAnimationLabel()
@property (nonatomic ,strong)UILabel *animationLabel;
@end
@implementation SGAnimationLabel
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.speed = 0.3;
        [self initAnimationLabel];
        [self addNotification];
        self.isAccessibilityElement = YES;
        self.accessibilityLabel = self.animationLabel.text;
    }
    return self;
}
- (void)initAnimationLabel{
    _animationLabel = [[UILabel alloc]init];
    _animationLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:_animationLabel];

    CAShapeLayer* maskLayer = [CAShapeLayer layer];
    maskLayer.path = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
    self.layer.mask = maskLayer;
}
- (void)addNotification{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(startAnimation) name:UIApplicationWillEnterForegroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(stopAnimation) name:UIApplicationDidEnterBackgroundNotification object:nil];
}
#pragma mark -
#pragma mark - set mothods
- (void)setText:(NSString *)text{
    self.animationLabel.text = text;
    [self.animationLabel sizeToFit];
    
    self.accessibilityLabel = [self.animationLabel.text stringByAppendingString:@"。占位文本"];
}
- (void)setTextColor:(UIColor *)textColor{
    self.animationLabel.textColor = textColor;
}
- (void)setFont:(UIFont *)font{
    self.animationLabel.font = font;
    [self.animationLabel sizeToFit];
    CGRect frame = self.frame;
    if (frame.size.height < font.lineHeight) {
        frame.size.height = font.lineHeight;
        self.frame = frame;
    }
}
#pragma mark -
#pragma mark - start or stop animation
- (void)startAnimation{
    if ([self.animationLabel.layer animationForKey:kDynamicLabelAnimationKey] || self.animationLabel.frame.size.width <= self.frame.size.width) {
        return;
    }
    CGFloat lenth = self.animationLabel.frame.size.width + self.frame.size.width;
    CAKeyframeAnimation* keyFrame = [CAKeyframeAnimation animation];
    keyFrame.keyPath = @"transform.translation.x";
    keyFrame.values = @[@(0), @(-self.animationLabel.frame.size.width)];
    keyFrame.repeatCount = NSIntegerMax;
    keyFrame.duration = lenth * self.speed / 10;
    keyFrame.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    [self.animationLabel.layer addAnimation:keyFrame forKey:kDynamicLabelAnimationKey];
}
- (void)stopAnimation{
    if ([self.animationLabel.layer animationForKey:kDynamicLabelAnimationKey]) {
        [self.animationLabel.layer removeAnimationForKey:kDynamicLabelAnimationKey];
    }
}
#pragma mark -
- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
