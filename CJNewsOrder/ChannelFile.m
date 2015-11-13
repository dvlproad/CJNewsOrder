//
//  ChannelFile.m
//  CJNewsOrderDemo
//
//  Created by 李超前 on 15/11/10.
//  Copyright © 2015年 lichq. All rights reserved.
//

#import "ChannelFile.h"

#define kPath_Order_YES @"order_YES.swh"
#define kPath_Order_NO  @"order_NO.swh"

@implementation ChannelFile

+ (BOOL)isExist{
    NSString *libraryPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filePath_order_YES = [libraryPath stringByAppendingPathComponent:kPath_Order_YES];
    
    BOOL bValue = [[NSFileManager defaultManager] fileExistsAtPath:filePath_order_YES];
    return bValue;
}

+ (NSArray *)getChannels_Order_YES{
    NSString *libraryPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filePath_order_YES = [libraryPath stringByAppendingPathComponent:kPath_Order_YES];
    NSArray *channel_order_YES = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath_order_YES];
    return channel_order_YES;
}

+ (NSArray *)getChannels_Order_NO{
    NSString *libraryPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filePath_order_NO = [libraryPath stringByAppendingPathComponent:kPath_Order_NO];
    NSArray *channel_order_NO = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath_order_NO];
    return channel_order_NO;
}


+ (void)saveChannels_Order_YES:(NSArray *)channels_Order_YES{
    NSString *libraryPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filePath_order_YES = [libraryPath stringByAppendingPathComponent:kPath_Order_YES];
    
    NSData *data_order_YES = [NSKeyedArchiver archivedDataWithRootObject:channels_Order_YES];
    [data_order_YES writeToFile:filePath_order_YES atomically:YES];
}

+ (void)saveChannels_Order_NO:(NSArray *)channels_Order_NO{
    NSString *libraryPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filePath_order_NO = [libraryPath stringByAppendingPathComponent:kPath_Order_NO];
    
    NSData *data_order_NO = [NSKeyedArchiver archivedDataWithRootObject:channels_Order_NO];
    [data_order_NO writeToFile:filePath_order_NO atomically:YES];
}


@end
