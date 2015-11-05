//
//  TouchView.h
//  TouchDemo
//
//  Created by Zer0 on 13-10-11.
//  Copyright (c) 2013年 Zer0. All rights reserved.
//

#import <UIKit/UIKit.h>

#define KTableStartPointX 25
#define KTableStartPointY 60
//已订阅的按钮起始的位置
#define KButtonWidth 54
#define KButtonHeight 40
//按钮的大小


@class TouchViewModel;
@interface TouchView : UIImageView
{
    CGPoint _point;
    CGPoint _point2;
    NSInteger _sign;
    @public
    
    NSMutableArray * _array;
    NSMutableArray * _viewArr11;
    NSMutableArray * _viewArr22;
}
@property (nonatomic,retain) UILabel * label;
@property (nonatomic,retain) UILabel * moreChannelsLabel;
@property (nonatomic,retain) TouchViewModel * touchViewModel;
@end
