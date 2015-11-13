//
//  ChannelModel.h
//  CJNewsOrderDemo
//
//  Created by lichq on 15/11/4.
//  Copyright (c) 2015年 lichq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChannelModel : NSObject<NSCoding>

@property (nonatomic,retain) NSString *title;
@property (nonatomic,retain) NSString *urlString;
- (id)initWithTitle:(NSString *)title urlString:(NSString *)urlString;
@end
