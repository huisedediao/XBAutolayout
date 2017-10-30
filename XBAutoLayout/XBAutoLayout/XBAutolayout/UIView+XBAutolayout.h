//
//  UIView+XBAutolayout.h
//  XBAutoLayout
//
//  Created by xxb on 2017/10/30.
//  Copyright © 2017年 xxb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XBLayoutDefine.h"

@interface UIView (XBAutolayout)

- (instancetype)xb_clearAllConstraints;

- (instancetype)xb_leftSpace:(CGFloat)space toView:(UIView *)view attribute:(NSLayoutAttribute)attribute;
- (instancetype)xb_rightSpace:(CGFloat)space toView:(UIView *)view attribute:(NSLayoutAttribute)attribute;
- (instancetype)xb_topSpace:(CGFloat)space toView:(UIView *)view attribute:(NSLayoutAttribute)attribute;
- (instancetype)xb_bottomSpace:(CGFloat)space toView:(UIView *)view attribute:(NSLayoutAttribute)attribute;
- (instancetype)xb_centerXSpace:(CGFloat)space toView:(UIView *)view attribute:(NSLayoutAttribute)attribute;
- (instancetype)xb_centerYSpace:(CGFloat)space toView:(UIView *)view attribute:(NSLayoutAttribute)attribute;

- (instancetype)xb_leftEqualtoView:(UIView *)view;
- (instancetype)xb_rightEqualtoView:(UIView *)view;
- (instancetype)xb_topEqualtoView:(UIView *)view;
- (instancetype)xb_bottomEqualtoView:(UIView *)view;
- (instancetype)xb_centerEqualtoView:(UIView *)view;
- (instancetype)xb_centerXEqualtoView:(UIView *)view;
- (instancetype)xb_centerYEqualtoView:(UIView *)view;
- (instancetype)xb_sizeEqualtoView:(UIView *)view;
- (instancetype)xb_edgeEqualtoView:(UIView *)view;

- (instancetype)xb_widthEqualtoView:(UIView *)view multiple:(CGFloat)multiple constant:(CGFloat)constant;
- (instancetype)xb_heightEqualtoView:(UIView *)view multiple:(CGFloat)multiple constant:(CGFloat)constant;

- (instancetype)xb_leftIs:(CGFloat)value;
- (instancetype)xb_rightIs:(CGFloat)value;
- (instancetype)xb_topIs:(CGFloat)value;
- (instancetype)xb_bottomIs:(CGFloat)value;
- (instancetype)xb_widthIs:(CGFloat)value;
- (instancetype)xb_heightIs:(CGFloat)value;
- (instancetype)xb_sizeIs:(CGSize)size;

@end
