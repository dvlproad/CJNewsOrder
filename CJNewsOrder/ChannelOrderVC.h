//
//  ChannelOrderVC.h
//  CJNewsOrderDemo
//
//  Created by lichq on 15/11/4.
//  Copyright (c) 2015年 lichq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChannelFile.h"

@class ChannelOrderVC;
@protocol ChannelOrderVCDelegate <NSObject>
@required
- (void)hiddenChannelOrderVC:(ChannelOrderVC *)orderVC;

@end

@protocol ChannelOrderVCDataSource <NSObject>
@required
- (NSMutableArray *)originChannelOrderYES_whenChannelFileNoExist;
- (NSMutableArray *)originChannelOrderNO_whenChannelFileNoExist;

@end



@interface ChannelOrderVC : UIViewController
{
    @public
    NSMutableArray *_viewArr1;
    NSMutableArray *_viewArr2;
}
@property (nonatomic, assign) id<ChannelOrderVCDelegate> delegate;
@property (nonatomic, assign) id<ChannelOrderVCDataSource> dataSource;
@property (nonatomic, strong) NSMutableArray *channel_order_YES;
@property (nonatomic, strong) NSMutableArray *channel_order_NO;

@property (nonatomic,retain) UILabel *titleLabel;
@property (nonatomic,retain) UILabel *titleLabel2;
@property (nonatomic,retain) UIButton *backButton;

- (void)updateCurrentOrder_whenChangeOrder;

@end
