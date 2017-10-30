//
//  XBLayoutDefine.h
//  XBAutoLayout
//
//  Created by xxb on 2017/10/30.
//  Copyright © 2017年 xxb. All rights reserved.
//

#ifndef XBLayoutDefine_h
#define XBLayoutDefine_h

typedef enum
{
    XBSideTop = 0,    //上
    XBSideBottom,     //下
    XBSideLeft,       //左
    XBSideRight       //右
    
}XBSide;


#define K_Layout_key_dicM_constraints  @"K_Layout_key_dicM_constraints"
#define K_Layout_key_left              @"K_Layout_key_left"
#define K_Layout_key_right             @"K_Layout_key_right"
#define K_Layout_key_top               @"K_Layout_key_top"
#define K_Layout_key_bottom            @"K_Layout_key_bottom"
#define K_Layout_key_center            @"K_Layout_key_center"
#define K_Layout_key_centerX           @"K_Layout_key_centerX"
#define K_Layout_key_centerY           @"K_Layout_key_centerY"
#define K_Layout_key_width             @"K_Layout_key_width"
#define K_Layout_key_height            @"K_Layout_key_height"
#define K_Layout_key_size              @"K_Layout_key_size"


#define K_Layout_key_owner             @"K_Layout_key_owner"
#define K_Layout_key_constraint        @"K_Layout_key_constraint"


//判断某个view是否是另一个view的子view (BOOL)
#define isSubViewOfView_subV_fatherV(subV,fatherV)\
({\
BOOL isSubView=NO;\
NSArray *subViews=fatherV.subviews;\
for (UIView *subView in subViews)\
{\
if (subView==subV)\
{\
isSubView=YES;\
break;\
}\
}\
isSubView;\
})

#endif /* XBLayoutDefine_h */
