//
//  ViewController.m
//  XBAutoLayout
//
//  Created by xxb on 2017/10/30.
//  Copyright © 2017年 xxb. All rights reserved.
//

#import "ViewController.h"
#import "XBAutolayout.h"

@interface ViewController ()
{
    UIView *baseView;
    UIView *greenView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    baseView = [UIView new];
    [self.view addSubview:baseView];
    baseView.frame = CGRectMake(100, 100, 100, 100);
    baseView.backgroundColor = [UIColor blueColor];
    
    
    //创建redView
    UIView *redView = [[UIView alloc]init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    [redView xb_leftSpace:20 toView:self.view attribute:NSLayoutAttributeLeft];
    [redView xb_topSpace:70 toView:self.view attribute:NSLayoutAttributeTop];
    [redView xb_widthIs:50];
    [redView xb_heightIs:50];
    
    
    greenView = [UIView new];
    greenView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:greenView];
    
//    [greenView xb_leftSpace:10 ToView:redView side:XBSideLeft];
//    [greenView xb_topSpace:20 ToView:redView side:XBSideBottom];
//    [greenView xb_rightSpace:70 ToView:redView side:XBSideLeft];
//    [greenView xb_heightIs:60];
//    [greenView xb_topIs:170];
//    [greenView xb_leftIs:20];
//    [greenView xb_rightIs:110];
//    [greenView xb_bottomIs:260];
    
//    [greenView xb_leftEqualToView:redView];
//    [greenView xb_rightEqualToView:redView];
//    [greenView xb_topEqualToView:redView];
//    [greenView xb_bottomEqualToView:redView];
    
//    [greenView xb_centerEqualToView:redView];
//    [greenView xb_heightIs:30];
//    [greenView xb_widthIs:30];
    
//    [greenView xb_centerXEqualToView:self.view];
    [greenView xb_centerXSpace:100 toView:redView attribute:NSLayoutAttributeCenterX];
    [greenView xb_centerYSpace:100 toView:redView attribute:NSLayoutAttributeBottom];
    [greenView xb_sizeEqualToView:redView];
    [greenView xb_sizeIs:CGSizeMake(100, 100)];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [UIView animateWithDuration:0.5 animations:^{
//        [greenView xb_centerEqualToView:self.view];
//        [greenView xb_sizeIs:CGSizeMake(200, 200)];
        [greenView xb_edgeEqualToView:self.view];
        [self.view layoutIfNeeded];
    }];
}

@end
