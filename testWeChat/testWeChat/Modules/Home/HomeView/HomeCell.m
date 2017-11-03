//
//  HomeCell.m
//  testWeChat
//
//  Created by Chen on 2017/10/31.
//  Copyright © 2017年 Telsa_Chen. All rights reserved.
//

#import "HomeCell.h"


@implementation HomeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setSelectionStyle:(UITableViewCellSelectionStyleNone)];
        [self setupHomeCell];
    }
    return self;
}

//每次刷新都会走的方法
- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    
}


- (void) setupHomeCell {
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = self.bounds;
    [self addSubview:imageView];
    
}


@end
