//
//  ChannelOrderVC.m
//  CJNewsOrderDemo
//
//  Created by lichq on 15/11/4.
//  Copyright (c) 2015年 lichq. All rights reserved.
//

#import "ChannelOrderVC.h"
#import "ChannelView.h"

@interface ChannelOrderVC ()

@end

@implementation ChannelOrderVC
@synthesize channel_order_YES;
@synthesize channel_order_NO;

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
    if (channel_order_YES.count%5 == 0) {
        row_order = channel_order_YES.count/5;
    }else{
        row_order = channel_order_YES.count/5 + 1;
    }
    
    return row_order;
}


//初始化化数据
- (void)initizalData_CJNewsOrder{
    if (![ChannelFile isExist]) {
        NSAssert(self.dataSource != nil, @"Error: 未设置ChannelOrderVC的dataSource，请检查");
        NSMutableArray *channel_order_YES_Ori =
        [self.dataSource originChannelOrderYES_whenChannelFileNoExist];
        NSMutableArray *channel_order_NO_Ori =
        [self.dataSource originChannelOrderNO_whenChannelFileNoExist];
        [ChannelFile saveChannels_Order_YES:channel_order_YES_Ori];
        [ChannelFile saveChannels_Order_NO:channel_order_NO_Ori];
    }
    self.channel_order_YES = [NSMutableArray arrayWithArray:[ChannelFile getChannels_Order_YES]];
    self.channel_order_NO = [NSMutableArray arrayWithArray:[ChannelFile getChannels_Order_NO]];
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //注意：backButton与self.view的frame有关所以不能写在viewDidLoad中设置self.backButton的frame
    CGRect rect_backButton = CGRectMake(self.view.bounds.size.width - 56, self.view.bounds.size.height - 44, 56, 44);
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.backButton setFrame:rect_backButton];
    [self.backButton setImage:[UIImage imageNamed:@"order_back.png"] forState:UIControlStateNormal];
    [self.backButton setImage:[UIImage imageNamed:@"order_back_select.png"] forState:UIControlStateNormal];
    [self.backButton addTarget:self action:@selector(hiddenOrderViewController) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.backButton];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1.0];
    
    [self initizalData_CJNewsOrder];    //初始化化数据
    
    
    
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
    
    
    
    for (int i = 0; i < channel_order_YES.count; i++) {
        CGFloat x_item = marginLeft + width_item * (i%count_per_row);
        CGFloat y_item = KTableStartPointY + height_item * (i/count_per_row);
        CGRect rect_item = CGRectMake(x_item, y_item, width_item, height_item);
        ChannelView *channelView = [[ChannelView alloc]initWithFrame:rect_item];
        [channelView setBackgroundColor:color_item];
        
        [_viewArr1 addObject:channelView];
        
        channelView->_array = _viewArr1;
        if (i == 0) {
            [channelView.label setTextColor:color_text_firstItem];
        }else{
            [channelView.label setTextColor:color_text_normal];
        }
        channelView.label.text = [[channel_order_YES objectAtIndex:i] title];
        [channelView.label setTextAlignment:NSTextAlignmentCenter];
        [channelView setMoreChannelsLabel:_titleLabel2];
        channelView->_viewArr11 = _viewArr1;
        channelView->_viewArr22 = _viewArr2;
        [channelView setChannelModel:[channel_order_YES objectAtIndex:i]];
        
        [self.view addSubview:channelView];
    }
    
    for (int i = 0; i < channel_order_NO.count; i++) {
        CGFloat x_item = marginLeft + width_item * (i%count_per_row);
        CGFloat y_item = KTableStartPointY + height_item * ([self row_order_YES_count]+1) + height_item * (i/count_per_row);
        CGRect rect_item = CGRectMake(x_item, y_item, width_item, height_item);
        ChannelView *channelView = [[ChannelView alloc]initWithFrame:rect_item];
        [channelView setBackgroundColor:color_item];
        
        [_viewArr2 addObject:channelView];
        channelView->_array = _viewArr2;
        
        channelView.label.text = [[channel_order_NO objectAtIndex:i] title];
        [channelView.label setTextColor:color_text_normal];
        [channelView.label setTextAlignment:NSTextAlignmentCenter];
        [channelView setMoreChannelsLabel:_titleLabel2];
        channelView->_viewArr11 = _viewArr1;
        channelView->_viewArr22 = _viewArr2;
        [channelView setChannelModel:[channel_order_NO objectAtIndex:i]];
        
        [self.view addSubview:channelView];
    }
}


- (void)hiddenOrderViewController{
    if (self.delegate && [self.delegate respondsToSelector:@selector(hiddenChannelOrderVC:)]) {
        [self.delegate hiddenChannelOrderVC:self];
    }
}


- (void)updateCurrentOrder_whenChangeOrder{
//    NSMutableArray *channel_order_YES = [NSMutableArray array];
//    NSMutableArray *channel_order_NO = [NSMutableArray array];
    channel_order_YES = [NSMutableArray array];
    channel_order_NO = [NSMutableArray array];
    
    for (ChannelView *channelView in self->_viewArr1) {
        [channel_order_YES addObject:channelView.channelModel];
    }
    [ChannelFile saveChannels_Order_YES:channel_order_YES];
    
    
    for (ChannelView *channelView in self->_viewArr2) {
        [channel_order_NO addObject:channelView.channelModel];
    }
    [ChannelFile saveChannels_Order_NO:channel_order_NO];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
