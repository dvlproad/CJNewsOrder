//
//  ChannelFile.h
//  CJNewsOrderDemo
//
//  Created by 李超前 on 15/11/10.
//  Copyright © 2015年 lichq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#import "ChannelModel.h"

@interface ChannelFile : NSObject

+ (BOOL)isExist;

+ (NSArray *)getChannels_Order_YES;
+ (NSArray *)getChannels_Order_NO;
+ (void)saveChannels_Order_YES:(NSArray *)channels_Order_YES;
+ (void)saveChannels_Order_NO:(NSArray *)channels_Order_NO;

@end
