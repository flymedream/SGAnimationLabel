//
//  SGAnimationLabel.h
//  SGAnimationLabel
//
//  Created by lihaohao on 2017/3/13.
//  Copyright © 2017年 低调的魅力. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SGAnimationLabel : UIView
@property(nonatomic, strong) NSString *text;
@property(nonatomic, strong) UIColor *textColor;
@property(nonatomic, strong) UIFont *font;
@property(nonatomic, assign) CGFloat speed;//0.1~0.5  默认是0.3
/*!
 *
 * @abstract start animation
 */
- (void)startAnimation;
/*!
 *
 * @abstract stop animation
 */
- (void)stopAnimation;
@end
