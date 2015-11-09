//
//  OrderViewController.h
//  CJNewsOrderDemo
//
//  Created by lichq on 15/11/4.
//  Copyright (c) 2015年 lichq. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface OrderViewController : UIViewController
{
    @public
    NSMutableArray *_viewArr1;
    NSMutableArray *_viewArr2;
}
@property (nonatomic, strong) NSArray *array_order_YES;
@property (nonatomic, strong) NSArray *array_order_NO;

@property (nonatomic,retain) UILabel *titleLabel;
@property (nonatomic,retain) UILabel *titleLabel2;
@property (nonatomic,retain) UIButton *backButton;

@end
