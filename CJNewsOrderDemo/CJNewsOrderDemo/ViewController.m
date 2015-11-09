//
//  ViewController.m
//  CJNewsOrderDemo
//
//  Created by lichq on 15/11/4.
//  Copyright (c) 2015年 lichq. All rights reserved.
//

#import "ViewController.h"

#import "OrderViewController.h"
#import "OrderButton.h"
#import "TouchView.h"


//频道名称和对应的请求接口
#define KChannelList @"头条",@"娱乐",@"健康",@"星座",@"社会",@"佛教",@"时事",@"时尚",@"军事",@"旅游",@"房产",@"汽车",@"港澳",@"教育",@"历史",@"文化",@"财经",@"读书",@"台湾",@"体育",@"科技",@"评论"
#define KChannelUrlStringList @"http://api.3g.ifeng.com/iosNews?id=aid=SYLB10&imgwidth=100&type=list&pagesize=20",@"http://api.3g.ifeng.com/iosNews?id=aid=YL53&imgwidth=100&type=list&pagesize=20",@"http://api.3g.ifeng.com/iosNews?id=aid=JK36&imgwidth=100&type=list&pagesize=20",@"http://api.3g.ifeng.com/iosNews?id=aid=XZ09&imgwidth=100&type=list&pagesize=20",@"http://api.3g.ifeng.com/iosNews?id=aid=SH133&imgwidth=100&type=list&pagesize=20",@"http://api.3g.ifeng.com/iosNews?id=aid=FJ31&imgwidth=100&type=list&pagesize=20",@"http://api.3g.ifeng.com/iosNews?id=aid=XW23&imgwidth=100&type=list&pagesize=20",@"http://api.3g.ifeng.com/iosNews?id=aid=SS78&imgwidth=100&type=list&pagesize=20",@"http://api.3g.ifeng.com/iosNews?id=aid=JS83&imgwidth=100&type=list&pagesize=20",@"http://api.3g.ifeng.com/iosNews?id=aid=LY67&imgwidth=100&type=list&pagesize=20",@"http://api.3g.ifeng.com/iosNews?id=aid=FC81&imgwidth=100&type=list&pagesize=20",@"http://api.3g.ifeng.com/iosNews?id=aid=QC45&imgwidth=100&type=list&pagesize=20",@"http://api.3g.ifeng.com/iosNews?id=aid=GA18&imgwidth=100&type=list&pagesize=20",@"http://api.3g.ifeng.com/iosNews?id=aid=JY90&imgwidth=100&type=list&pagesize=20",@"http://api.3g.ifeng.com/iosNews?id=aid=LS153&imgwidth=100&type=list&pagesize=20",@"http://api.3g.ifeng.com/iosNews?id=aid=WH25&imgwidth=100&type=list&pagesize=20",@"http://api.3g.ifeng.com/iosNews?id=aid=CJ33&imgwidth=100&type=list&pagesize=20",@"http://api.3g.ifeng.com/iosNews?id=aid=DS57&imgwidth=100&type=list&pagesize=20",@"http://api.3g.ifeng.com/iosNews?id=aid=TW73&imgwidth=100&type=list&pagesize=20",@"http://api.3g.ifeng.com/iosNews?id=aid=TY43,FOCUSTY43&imgwidth=100&type=list&pagesize=20",@"http://api.3g.ifeng.com/iosNews?id=aid=KJ123&imgwidth=100&type=list&pagesize=20",@"http://api.3g.ifeng.com/iosNews?id=aid=PL40&imgwidth=100&type=list&pagesize=20"


@interface ViewController ()
{
    IBOutlet OrderButton *orderButton;
    NSInteger orderVCIndex;
}

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *channelNames = [NSArray arrayWithObjects:KChannelList, nil] ;
    NSArray *channelUrls = [NSArray arrayWithObjects:KChannelUrlStringList, nil];
    [orderButton setExtraPropert_VC:self channelNames:channelNames channelUrls:channelUrls];
    
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    
}

- (IBAction)orderViewOut:(id)sender{
    
//    OrderButton *orderButton = (OrderButton *)sender;
//    if([[self.view subviews] count]>1){
//        [[[orderButton.vc.view subviews]objectAtIndex:1] removeFromSuperview];
//        NSLog(@"%d:%@", orderButton.vc.view.subviews.count, [orderButton.vc.view subviews]);
//        NSLog(@"%d:%@", orderButton.vc.childViewControllers.count, orderButton.vc.childViewControllers);
//    }
    orderVCIndex = orderButton.vc.childViewControllers.count;
    
    OrderViewController *orderVC = [[OrderViewController alloc] init];
    orderVC.channelNames = orderButton.channelNames;
    orderVC.channelUrls = orderButton.channelUrls;
    UIView *orderView = [orderVC view];
    [orderView setFrame:CGRectMake(0, - orderButton.vc.view.bounds.size.height, orderButton.vc.view.bounds.size.width, orderButton.vc.view.bounds.size.height)];
    [orderView setBackgroundColor:[UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1.0]];
    [orderVC.backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:orderView];
    [self addChildViewController:orderVC];
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionLayoutSubviews animations:^{
        [orderView setFrame:CGRectMake(0, 64, orderButton.vc.view.bounds.size.width, orderButton.vc.view.bounds.size.height)];
        
    } completion:^(BOOL finished){
        
    }];
    
}


- (void)backAction{
    OrderViewController * orderVC = [self.childViewControllers objectAtIndex:orderVCIndex];
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionLayoutSubviews animations:^{
        [orderVC.view setFrame:CGRectMake(0, - self.view.bounds.size.height, self.view.bounds.size.width, self.view.bounds.size.height)];
        
    } completion:^(BOOL finished){
        NSString *libraryPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSString *filePath_order_YES = [libraryPath stringByAppendingPathComponent:kPath_Order_YES];
        NSString *filePath_order_NO = [libraryPath stringByAppendingPathComponent:kPath_Order_NO];
        
        NSMutableArray *array_order_YES = [NSMutableArray array];
        NSMutableArray *array_order_NO = [NSMutableArray array];
        
        for (TouchView * touchView in orderVC->_viewArr1) {
            [array_order_YES addObject:touchView.touchViewModel];
        }
        NSData *data_order_YES = [NSKeyedArchiver archivedDataWithRootObject:array_order_YES];
        [data_order_YES writeToFile:filePath_order_YES atomically:YES];
        
        
        for (TouchView * touchView in orderVC->_viewArr2) {
            [array_order_NO addObject:touchView.touchViewModel];
        }
        NSData *data_order_NO = [NSKeyedArchiver archivedDataWithRootObject:array_order_NO];
        [data_order_NO writeToFile:filePath_order_NO atomically:YES];
        
        [[[self.childViewControllers  objectAtIndex:orderVCIndex] view] removeFromSuperview];
        [orderVC removeFromParentViewController];
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
