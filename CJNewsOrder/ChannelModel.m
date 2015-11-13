//
//  ChannelModel.m
//  CJNewsOrderDemo
//
//  Created by lichq on 15/11/4.
//  Copyright (c) 2015年 lichq. All rights reserved.
//

#import "ChannelModel.h"

@implementation ChannelModel

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.urlString forKey:@"urlString"];
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        self.title = [aDecoder decodeObjectForKey:@"title"];
        self.urlString = [aDecoder decodeObjectForKey:@"urlString"];
    }
    return self;
}

- (id)initWithTitle:(NSString *)title urlString:(NSString *)urlString{
    if (self = [super init]) {
        self.title = title;
        self.urlString = urlString;
    }
    return self;
}

@end
