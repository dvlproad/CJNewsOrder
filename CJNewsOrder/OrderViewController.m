//
//  OrderViewController.m
//  ifengNewsOrderDemo
//
//  Created by zer0 on 14-2-27.
//  Copyright (c) 2014年 zer0. All rights reserved.
//

#import "OrderViewController.h"
#import "TouchViewModel.h"
#import "TouchView.h"


#define KDefaultCountOfUpsideList 10    //默认订阅频道数


@interface OrderViewController ()

@end

@implementation OrderViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSString *libraryPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filePath_order_YES = [libraryPath stringByAppendingPathComponent:kPath_Order_YES];
    NSString *filePath_order_NO = [libraryPath stringByAppendingPathComponent:kPath_Order_NO];
    
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePath_order_YES]) {
        
        NSMutableArray *array_order_YES = [NSMutableArray array];
        NSMutableArray *array_order_NO = [NSMutableArray array];
        
        for (int i = 0; i < [self.channelNames count]; i++) {
            NSString *channelName = [self.channelNames objectAtIndex:i];
            NSString *channelUrl = [self.channelUrls objectAtIndex:i];
            TouchViewModel *touchViewModel = [[TouchViewModel alloc]initWithTitle:channelName urlString:channelUrl];
            
            if (i < KDefaultCountOfUpsideList - 1) {
                [array_order_YES addObject:touchViewModel];
            }else{
                [array_order_NO addObject:touchViewModel];
            }
            
        }
        
        NSData *data_order_YES = [NSKeyedArchiver archivedDataWithRootObject:array_order_YES];
        [data_order_YES writeToFile:filePath_order_YES atomically:YES];
        
        NSData *data_order_NO = [NSKeyedArchiver archivedDataWithRootObject:array_order_NO];
        [data_order_NO writeToFile:filePath_order_NO atomically:YES];
    }
    
    _modelArr1 = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath_order_YES];
    NSArray *modelArr2 = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath_order_NO];
    
    _viewArr1 = [[NSMutableArray alloc] init];
    _viewArr2 = [[NSMutableArray alloc] init];
    
    
    
    
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(110, 25, 100, 40)];
    _titleLabel.text = @"我的订阅";
    [_titleLabel setTextAlignment:NSTextAlignmentCenter];
    [_titleLabel setTextColor:[UIColor colorWithRed:187/255.0 green:1/255.0 blue:1/255.0 alpha:1.0]];
    [self.view addSubview:_titleLabel];
    
    
    
    _titleLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(110, KTableStartPointY + KButtonHeight * ([self array2StartY] - 1) + 22, 100, 20)];
    _titleLabel2.text = @"更多频道";
    [_titleLabel2 setFont:[UIFont systemFontOfSize:10]];
    [_titleLabel2 setTextAlignment:NSTextAlignmentCenter];
    [_titleLabel2 setTextColor:[UIColor grayColor]];
    [self.view addSubview:_titleLabel2];
    
    
    for (int i = 0; i < _modelArr1.count; i++) {
        TouchView * touchView = [[TouchView alloc] initWithFrame:CGRectMake(KTableStartPointX + KButtonWidth * (i%5), KTableStartPointY + KButtonHeight * (i/5), KButtonWidth, KButtonHeight)];
        [touchView setBackgroundColor:[UIColor colorWithRed:210/255.0 green:210/255.0 blue:210/255.0 alpha:1.0]];
        
        [_viewArr1 addObject:touchView];
        
        touchView->_array = _viewArr1;
        if (i == 0) {
            [touchView.label setTextColor:[UIColor colorWithRed:187/255.0 green:1/255.0 blue:1/255.0 alpha:1.0]];
        }
        else{
            
            [touchView.label setTextColor:[UIColor colorWithRed:99/255.0 green:99/255.0 blue:99/255.0 alpha:1.0]];
        }
        touchView.label.text = [[_modelArr1 objectAtIndex:i] title];
        [touchView.label setTextAlignment:NSTextAlignmentCenter];
        [touchView setMoreChannelsLabel:_titleLabel2];
        touchView->_viewArr11 = _viewArr1;
        touchView->_viewArr22 = _viewArr2;
        [touchView setTouchViewModel:[_modelArr1 objectAtIndex:i]];
        
        [self.view addSubview:touchView];
    }
    
    for (int i = 0; i < modelArr2.count; i++) {
        TouchView * touchView = [[TouchView alloc] initWithFrame:CGRectMake(KTableStartPointX + KButtonWidth * (i%5), KTableStartPointY + [self array2StartY] * KButtonHeight + KButtonHeight * (i/5), KButtonWidth, KButtonHeight)];
        
        [touchView setBackgroundColor:[UIColor colorWithRed:210/255.0 green:210/255.0 blue:210/255.0 alpha:1.0]];
        
        [_viewArr2 addObject:touchView];
        touchView->_array = _viewArr2;
        
        touchView.label.text = [[modelArr2 objectAtIndex:i] title];
        [touchView.label setTextColor:[UIColor colorWithRed:99/255.0 green:99/255.0 blue:99/255.0 alpha:1.0]];
        [touchView.label setTextAlignment:NSTextAlignmentCenter];
        [touchView setMoreChannelsLabel:_titleLabel2];
        touchView->_viewArr11 = _viewArr1;
        touchView->_viewArr22 = _viewArr2;
        [touchView setTouchViewModel:[modelArr2 objectAtIndex:i]];
        
        [self.view addSubview:touchView];
        
        
    }
    
    

    

    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.backButton setFrame:CGRectMake(self.view.bounds.size.width - 56, self.view.bounds.size.height - 44 - 64, 56, 44)];
    [self.backButton setImage:[UIImage imageNamed:@"order_back.png"] forState:UIControlStateNormal];
    [self.backButton setImage:[UIImage imageNamed:@"order_back_select.png"] forState:UIControlStateNormal];
    [self.view addSubview:self.backButton];
}



- (unsigned long )array2StartY{
    unsigned long y = 0;

    y = _modelArr1.count/5 + 2;
    if (_modelArr1.count%5 == 0) {
        y -= 1;
    }
    return y;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
