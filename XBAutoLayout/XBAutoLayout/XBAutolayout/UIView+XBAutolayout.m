//
//  UIView+XBAutolayout.m
//  XBAutoLayout
//
//  Created by xxb on 2017/10/30.
//  Copyright © 2017年 xxb. All rights reserved.
//

#import "UIView+XBAutolayout.h"
#import <objc/message.h>

@interface UIView ()
@property (nonatomic,strong) NSMutableDictionary *dicM_constraints;
@end

@implementation UIView (XBAutolayout)

- (instancetype)xb_clearAllConstraints
{
    [self.dicM_constraints enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSDictionary *dic = (NSDictionary *)obj;
        [self removeConstraintWithDic:dic];
    }];
    [self.dicM_constraints removeAllObjects];
    return self;
}

- (void)setDicM_constraints:(NSMutableDictionary *)dicM_constraints
{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    objc_setAssociatedObject(self, K_Layout_key_dicM_constraints, dicM_constraints, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSMutableDictionary *)dicM_constraints
{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSMutableDictionary *dicM = objc_getAssociatedObject(self, K_Layout_key_dicM_constraints);
    if (dicM == nil)
    {
        dicM = [NSMutableDictionary new];
        objc_setAssociatedObject(self, K_Layout_key_dicM_constraints, dicM, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return dicM;
}

- (void)removeLayoutConstraintWithKey:(NSString *)key
{
    NSDictionary *dic = self.dicM_constraints[key];
    if (dic)
    {
        [self removeConstraintWithDic:dic];
        [self.dicM_constraints removeObjectForKey:key];
    }
}
- (void)removeConstraintWithDic:(NSDictionary *)dic
{
    NSLayoutConstraint *constraint = dic[K_Layout_key_constraint];
    UIView *owner = dic[K_Layout_key_owner];
    [owner removeConstraint:constraint];
}
- (void)storeLayoutConstraintWithKey:(NSString *)key owner:(UIView *)owner constraint:(NSLayoutConstraint *)constraint
{
    NSDictionary *dic = @{K_Layout_key_owner:owner,K_Layout_key_constraint:constraint};
    self.dicM_constraints[key] = dic;
}

- (instancetype)xb_leftSpace:(CGFloat)space toView:(UIView *)view attribute:(NSLayoutAttribute)attribute;
{
    [self removeLayoutConstraintWithKey:K_Layout_key_left];
    NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:view attribute:attribute multiplier:1.0f constant:space];
    [self.superview addConstraint:constraint];
    [self storeLayoutConstraintWithKey:K_Layout_key_left owner:self.superview constraint:constraint];
    return self;
}
- (instancetype)xb_rightSpace:(CGFloat)space toView:(UIView *)view attribute:(NSLayoutAttribute)attribute;
{
    [self removeLayoutConstraintWithKey:K_Layout_key_right];
    NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:view attribute:attribute multiplier:1.0f constant:space];
    [self.superview addConstraint:constraint];
    [self storeLayoutConstraintWithKey:K_Layout_key_right owner:self.superview constraint:constraint];
    return self;
}
- (instancetype)xb_topSpace:(CGFloat)space toView:(UIView *)view attribute:(NSLayoutAttribute)attribute;
{
    [self removeLayoutConstraintWithKey:K_Layout_key_top];
    NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:view attribute:attribute multiplier:1.0f constant:space];
    [self.superview addConstraint:constraint];
    [self storeLayoutConstraintWithKey:K_Layout_key_top owner:self.superview constraint:constraint];
    return self;
}
- (instancetype)xb_bottomSpace:(CGFloat)space toView:(UIView *)view attribute:(NSLayoutAttribute)attribute;
{
    [self removeLayoutConstraintWithKey:K_Layout_key_bottom];
    NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:view attribute:attribute multiplier:1.0f constant:space];
    [self.superview addConstraint:constraint];
    [self storeLayoutConstraintWithKey:K_Layout_key_bottom owner:self.superview constraint:constraint];
    return self;
}
- (instancetype)xb_centerXSpace:(CGFloat)space toView:(UIView *)view attribute:(NSLayoutAttribute)attribute
{
    [self removeLayoutConstraintWithKey:K_Layout_key_centerX];
    NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:view attribute:attribute multiplier:1.0f constant:space];
    [self.superview addConstraint:constraint];
    [self storeLayoutConstraintWithKey:K_Layout_key_centerX owner:self.superview constraint:constraint];
    return self;
}
- (instancetype)xb_centerYSpace:(CGFloat)space toView:(UIView *)view attribute:(NSLayoutAttribute)attribute
{
    [self removeLayoutConstraintWithKey:K_Layout_key_centerY];
    NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:view attribute:attribute multiplier:1.0f constant:space];
    [self.superview addConstraint:constraint];
    [self storeLayoutConstraintWithKey:K_Layout_key_centerY owner:self.superview constraint:constraint];
    return self;
}

- (instancetype)xb_leftEqualToView:(UIView *)view
{
    [self xb_leftSpace:0 toView:view attribute:NSLayoutAttributeLeft];
    return self;
}
- (instancetype)xb_rightEqualToView:(UIView *)view
{
    [self xb_rightSpace:0 toView:view attribute:NSLayoutAttributeRight];
    return self;
}
- (instancetype)xb_topEqualToView:(UIView *)view
{
    [self xb_topSpace:0 toView:view attribute:NSLayoutAttributeTop];
    return self;
}
- (instancetype)xb_bottomEqualToView:(UIView *)view
{
    [self xb_bottomSpace:0 toView:view attribute:NSLayoutAttributeBottom];
    return self;
}
- (instancetype)xb_centerEqualToView:(UIView *)view
{
    [self xb_centerXEqualToView:view];
    [self xb_centerYEqualToView:view];
    return self;
}
- (instancetype)xb_centerXEqualToView:(UIView *)view
{
    [self xb_centerXSpace:0 toView:view attribute:NSLayoutAttributeCenterX];
    return self;
}
- (instancetype)xb_centerYEqualToView:(UIView *)view
{
    [self xb_centerYSpace:0 toView:view attribute:NSLayoutAttributeCenterY];
    return self;
}
- (instancetype)xb_sizeEqualToView:(UIView *)view
{
    [self xb_widthEqualToView:view multiple:1 constant:0];
    [self xb_heightEqualToView:view multiple:1 constant:0];
    return self;
}
- (instancetype)xb_edgeEqualToView:(UIView *)view
{
    [self xb_clearAllConstraints];
    [self xb_centerEqualToView:view];
    [self xb_sizeEqualToView:view];
    return self;
}

- (instancetype)xb_widthEqualToView:(UIView *)view multiple:(CGFloat)multiple constant:(CGFloat)constant
{
    [self removeLayoutConstraintWithKey:K_Layout_key_width];
    NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeWidth multiplier:multiple constant:constant];
    [self.superview addConstraint:constraint];
    [self storeLayoutConstraintWithKey:K_Layout_key_width owner:self.superview constraint:constraint];
    return self;
}
- (instancetype)xb_heightEqualToView:(UIView *)view multiple:(CGFloat)multiple constant:(CGFloat)constant
{
    [self removeLayoutConstraintWithKey:K_Layout_key_height];
    NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeHeight multiplier:multiple constant:constant];
    [self.superview addConstraint:constraint];
    [self storeLayoutConstraintWithKey:K_Layout_key_height owner:self.superview constraint:constraint];
    return self;
}

- (instancetype)xb_leftIs:(CGFloat)value
{
    [self xb_leftSpace:value toView:self.superview attribute:NSLayoutAttributeLeft];
    return self;
}
- (instancetype)xb_rightIs:(CGFloat)value
{
    [self xb_rightSpace:value toView:self.superview attribute:NSLayoutAttributeLeft];
    return self;
}
- (instancetype)xb_topIs:(CGFloat)value
{
    [self xb_topSpace:value toView:self.superview attribute:NSLayoutAttributeTop];
    return self;
}
- (instancetype)xb_bottomIs:(CGFloat)value
{
    [self xb_bottomSpace:value toView:self.superview attribute:NSLayoutAttributeTop];
    return self;
}
- (instancetype)xb_widthIs:(CGFloat)value
{
    [self removeLayoutConstraintWithKey:K_Layout_key_width];
    NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:kNilOptions multiplier:1.0f constant:value];
    [self addConstraint:constraint];
    [self storeLayoutConstraintWithKey:K_Layout_key_width owner:self constraint:constraint];
    return self;
}
- (instancetype)xb_heightIs:(CGFloat)value
{
    [self removeLayoutConstraintWithKey:K_Layout_key_height];
    NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:kNilOptions multiplier:1.0f constant:value];
    [self addConstraint:constraint];
    [self storeLayoutConstraintWithKey:K_Layout_key_height owner:self constraint:constraint];
    return self;
}
- (instancetype)xb_sizeIs:(CGSize)size
{
    [self xb_widthIs:size.width];
    [self xb_heightIs:size.height];
    return self;
}
@end
