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
    IBOutlet OrderButton *orderBtn;
    NSInteger orderVCIndex;
}

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = NSLocalizedString(@"网易新闻", nil);
    
    if (orderBtn) {
        NSArray *channelNames = [NSArray arrayWithObjects:KChannelList, nil] ;
        NSArray *channelUrls = [NSArray arrayWithObjects:KChannelUrlStringList, nil];
        NSMutableArray *channels = [[NSMutableArray alloc]init];
        for (int i = 0; i < channelNames.count; i++) {
            NSString *channelName = [channelNames objectAtIndex:i];
            NSString *channelUrl = [channelUrls objectAtIndex:i];
            TouchViewModel *channel = [[TouchViewModel alloc]initWithTitle:channelName urlString:channelUrl];
            [channels addObject:channel];
        }
        [orderBtn setExtraPropert_VC:self channelsAll:channels];
    }
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    
}


#pragma mark - 类似网易新闻的订阅功能
- (IBAction)orderViewOut:(id)sender{
    
    OrderButton *orderButton = (OrderButton *)sender;
//    if([[self.view subviews] count]>1){
//        [[[orderButton.vc.view subviews]objectAtIndex:1] removeFromSuperview];
//        NSLog(@"%d:%@", orderButton.vc.view.subviews.count, [orderButton.vc.view subviews]);
//        NSLog(@"%d:%@", orderButton.vc.childViewControllers.count, orderButton.vc.childViewControllers);
//    }
    orderVCIndex = orderButton.vc.childViewControllers.count;
    
    OrderViewController *orderVC = [[OrderViewController alloc] init];
    orderVC.array_order_YES = [ChannelFile getChannels_Order_YES];
    orderVC.array_order_NO = [ChannelFile getChannels_Order_NO];
    
    UIView *orderView = [orderVC view];
    
    CGFloat width = orderButton.vc.view.bounds.size.width;//本例中orderButton.vc等于self
    CGFloat height = orderButton.vc.view.bounds.size.height;
    CGRect rect_hidden = CGRectMake(0, - height, width, height);
    CGRect rect_show = CGRectMake(0, 64, width, height);
    
    [orderView setFrame:rect_hidden];
    [orderView setBackgroundColor:[UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1.0]];
    [orderVC.backButton addTarget:self action:@selector(hidden_orderView) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:orderView];
    [self addChildViewController:orderVC];
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionLayoutSubviews animations:^{
        [orderView setFrame:rect_show];
        
    } completion:^(BOOL finished){
        
    }];
    
}


- (void)hidden_orderView{
    CGFloat width = self.view.bounds.size.width;//本例中orderButton.vc等于self
    CGFloat height = self.view.bounds.size.height;
    CGRect rect_hidden = CGRectMake(0, - height, width, height);
    
    OrderViewController *orderVC = [self.childViewControllers objectAtIndex:orderVCIndex];
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionLayoutSubviews animations:^{
        [orderVC.view setFrame:rect_hidden];
        
    } completion:^(BOOL finished){
        
        
        NSMutableArray *array_order_YES = [NSMutableArray array];
        NSMutableArray *array_order_NO = [NSMutableArray array];
        
        for (TouchView * touchView in orderVC->_viewArr1) {
            [array_order_YES addObject:touchView.touchViewModel];
        }
        [ChannelFile saveChannels_Order_YES:array_order_YES];
        
        
        for (TouchView * touchView in orderVC->_viewArr2) {
            [array_order_NO addObject:touchView.touchViewModel];
        }
        [ChannelFile saveChannels_Order_NO:array_order_NO];
        
        [[[self.childViewControllers  objectAtIndex:orderVCIndex] view] removeFromSuperview];
        [orderVC removeFromParentViewController];
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
