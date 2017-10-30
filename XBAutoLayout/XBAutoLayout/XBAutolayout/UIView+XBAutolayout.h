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

- (instancetype)xb_leftSpace:(CGFloat)space ToView:(UIView *)view attribute:(NSLayoutAttribute)attribute;
- (instancetype)xb_rightSpace:(CGFloat)space ToView:(UIView *)view attribute:(NSLayoutAttribute)attribute;
- (instancetype)xb_topSpace:(CGFloat)space ToView:(UIView *)view attribute:(NSLayoutAttribute)attribute;
- (instancetype)xb_bottomSpace:(CGFloat)space ToView:(UIView *)view attribute:(NSLayoutAttribute)attribute;
- (instancetype)xb_centerXSpace:(CGFloat)space ToView:(UIView *)view attribute:(NSLayoutAttribute)attribute;
- (instancetype)xb_centerYSpace:(CGFloat)space ToView:(UIView *)view attribute:(NSLayoutAttribute)attribute;

- (instancetype)xb_leftEqualToView:(UIView *)view;
- (instancetype)xb_rightEqualToView:(UIView *)view;
- (instancetype)xb_topEqualToView:(UIView *)view;
- (instancetype)xb_bottomEqualToView:(UIView *)view;
- (instancetype)xb_centerEqualToView:(UIView *)view;
- (instancetype)xb_centerXEqualToView:(UIView *)view;
- (instancetype)xb_centerYEqualToView:(UIView *)view;
- (instancetype)xb_sizeEqualToView:(UIView *)view;
- (instancetype)xb_edgeEqualToView:(UIView *)view;

- (instancetype)xb_widthEqualToView:(UIView *)view multiple:(CGFloat)multiple constant:(CGFloat)constant;
- (instancetype)xb_heightEqualToView:(UIView *)view multiple:(CGFloat)multiple constant:(CGFloat)constant;

- (instancetype)xb_leftIs:(CGFloat)value;
- (instancetype)xb_rightIs:(CGFloat)value;
- (instancetype)xb_topIs:(CGFloat)value;
- (instancetype)xb_bottomIs:(CGFloat)value;
- (instancetype)xb_widthIs:(CGFloat)value;
- (instancetype)xb_heightIs:(CGFloat)value;
- (instancetype)xb_sizeIs:(CGSize)size;

@end
