//
//  OrderViewController.h
//  CJNewsOrderDemo
//
//  Created by lichq on 15/11/4.
//  Copyright (c) 2015年 lichq. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kPath_Order_YES @"order_YES.swh"
#define kPath_Order_NO  @"order_NO.swh"


@interface OrderViewController : UIViewController
{
    @public
    NSArray *array_order_YES;
    NSArray *array_order_NO;
    
    NSMutableArray *_viewArr1;
    NSMutableArray *_viewArr2;
}
@property (nonatomic,retain) NSArray *channelNames;
@property (nonatomic,retain) NSArray *channelUrls;

@property (nonatomic,retain) UILabel *titleLabel;
@property (nonatomic,retain) UILabel *titleLabel2;
@property (nonatomic,retain) UIButton *backButton;

@end
