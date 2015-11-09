//
//  OrderViewController.m
//  CJNewsOrderDemo
//
//  Created by lichq on 15/11/4.
//  Copyright (c) 2015年 lichq. All rights reserved.
//

#import "OrderViewController.h"
#import "TouchViewModel.h"
#import "TouchView.h"



@interface OrderViewController ()

@end

@implementation OrderViewController
@synthesize array_order_YES;
@synthesize array_order_NO;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



//已订阅的内容所占的行数
- (unsigned long )row_order_YES_count{
    unsigned long row_order = 0;
    if (array_order_YES.count%5 == 0) {
        row_order = array_order_YES.count/5;
    }else{
        row_order = array_order_YES.count/5 + 1;
    }
    
    return row_order;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
//    [self initizalData_CJNewsOrder];
    
    
    _viewArr1 = [[NSMutableArray alloc] init];
    _viewArr2 = [[NSMutableArray alloc] init];
    
    
    
    CGFloat marginLeft = kMarginLeft;   //25;//订阅项目与边缘的距离
    NSInteger count_per_row = 5;
    CGFloat width_item = (self.view.frame.size.width - 2*marginLeft)/count_per_row;
    CGFloat height_item = KButtonHeight;    //40;
    //item的背景颜色
    UIColor *color_item = [UIColor colorWithRed:210/255.0 green:210/255.0 blue:210/255.0 alpha:1.0];
    //头条的文字颜色
    UIColor *color_text_firstItem = [UIColor colorWithRed:187/255.0 green:1/255.0 blue:1/255.0 alpha:1.0];
    //非头条的文字颜色
    UIColor *color_text_normal = [UIColor colorWithRed:99/255.0 green:99/255.0 blue:99/255.0 alpha:1.0];
    
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(110, 25, 100, 40)];
    _titleLabel.text = @"我的订阅";
    [_titleLabel setTextAlignment:NSTextAlignmentCenter];
    [_titleLabel setTextColor:[UIColor colorWithRed:187/255.0 green:1/255.0 blue:1/255.0 alpha:1.0]];
    [self.view addSubview:_titleLabel];
    
    
    _titleLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(110, KTableStartPointY + height_item * [self row_order_YES_count] + 22, 100, 20)];
    _titleLabel2.text = @"更多频道";
    [_titleLabel2 setFont:[UIFont systemFontOfSize:10]];
    [_titleLabel2 setTextAlignment:NSTextAlignmentCenter];
    [_titleLabel2 setTextColor:[UIColor grayColor]];
    [self.view addSubview:_titleLabel2];
    
    
    
    for (int i = 0; i < array_order_YES.count; i++) {
        CGFloat x_item = marginLeft + width_item * (i%count_per_row);
        CGFloat y_item = KTableStartPointY + height_item * (i/count_per_row);
        CGRect rect_item = CGRectMake(x_item, y_item, width_item, height_item);
        TouchView *touchView = [[TouchView alloc]initWithFrame:rect_item];
        [touchView setBackgroundColor:color_item];
        
        [_viewArr1 addObject:touchView];
        
        touchView->_array = _viewArr1;
        if (i == 0) {
            [touchView.label setTextColor:color_text_firstItem];
        }else{
            [touchView.label setTextColor:color_text_normal];
        }
        touchView.label.text = [[array_order_YES objectAtIndex:i] title];
        [touchView.label setTextAlignment:NSTextAlignmentCenter];
        [touchView setMoreChannelsLabel:_titleLabel2];
        touchView->_viewArr11 = _viewArr1;
        touchView->_viewArr22 = _viewArr2;
        [touchView setTouchViewModel:[array_order_YES objectAtIndex:i]];
        
        [self.view addSubview:touchView];
    }
    
    for (int i = 0; i < array_order_NO.count; i++) {
        CGFloat x_item = marginLeft + width_item * (i%count_per_row);
        CGFloat y_item = KTableStartPointY + height_item * ([self row_order_YES_count]+1) + height_item * (i/count_per_row);
        CGRect rect_item = CGRectMake(x_item, y_item, width_item, height_item);
        TouchView *touchView = [[TouchView alloc]initWithFrame:rect_item];
        [touchView setBackgroundColor:color_item];
        
        [_viewArr2 addObject:touchView];
        touchView->_array = _viewArr2;
        
        touchView.label.text = [[array_order_NO objectAtIndex:i] title];
        [touchView.label setTextColor:color_text_normal];
        [touchView.label setTextAlignment:NSTextAlignmentCenter];
        [touchView setMoreChannelsLabel:_titleLabel2];
        touchView->_viewArr11 = _viewArr1;
        touchView->_viewArr22 = _viewArr2;
        [touchView setTouchViewModel:[array_order_NO objectAtIndex:i]];
        
        [self.view addSubview:touchView];
    }
    

    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.backButton setFrame:CGRectMake(self.view.bounds.size.width - 56, self.view.bounds.size.height - 44 - 64, 56, 44)];
    [self.backButton setImage:[UIImage imageNamed:@"order_back.png"] forState:UIControlStateNormal];
    [self.backButton setImage:[UIImage imageNamed:@"order_back_select.png"] forState:UIControlStateNormal];
    [self.view addSubview:self.backButton];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
