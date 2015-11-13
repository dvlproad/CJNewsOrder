//
//  ChannelView.h
//  CJNewsOrderDemo
//
//  Created by lichq on 15/11/4.
//  Copyright (c) 2015年 lichq. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kMarginLeft 25  //订阅项目与边缘的距离
#define KTableStartPointY 60
//已订阅的按钮起始的位置
#define KButtonWidth 54 //值为(self.view.frame.size.width-2*kMarginLeft)/count_per_row; 即320/5
#define KButtonHeight 40
//按钮的大小


@class ChannelModel;
@interface ChannelView : UIImageView
{
    CGPoint _point;
    CGPoint _point2;
    NSInteger _sign;
    @public
    
    NSMutableArray * _array;
    NSMutableArray * _viewArr11;
    NSMutableArray * _viewArr22;
}
@property (nonatomic,retain) UILabel *label;
@property (nonatomic,retain) UILabel *moreChannelsLabel;
@property (nonatomic,retain) ChannelModel *channelModel;
@end
