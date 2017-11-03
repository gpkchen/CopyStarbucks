//
//  HomeHeaderButton.m
//  testWeChat
//
//  Created by Tesla_Chen on 2017/11/3.
//  Copyright © 2017年 Telsa_Chen. All rights reserved.
//

#import "HomeHeaderButton.h"

@interface HomeHeaderButton ()

{
    UIImageView *leftImageView;
    UILabel     *rightLabel;
}


@property (nonatomic, assign) CGRect  frame;



@end

@implementation HomeHeaderButton



- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
    }
    return self;
}


#pragma mark -- Private instance Method

- (void)setupHomeHeaderView {
    
    leftImageView = [[UIImageView alloc] init];
    leftImageView.backgroundColor = KColor_red_f9;
    leftImageView.frame = CGRectMake(5, self.frame.size.height/2 - 5, 12, 10);
    leftImageView.userInteractionEnabled = NO;
    [self addSubview:leftImageView];
    
    rightLabel = [[UILabel alloc] init];
    rightLabel.backgroundColor = KColor_Gray;
    rightLabel.textAlignment = NSTextAlignmentCenter;
    rightLabel.font = [UIFont systemFontOfSize:13*kMainScaleMiunes];
    rightLabel.frame = CGRectMake(CGRectGetMaxX(leftImageView.frame) + 5, leftImageView.frame.origin.y, 20, 10);
    [self addSubview:rightLabel];
    
}

#pragma mark -- Setter

- (void)setLeftImage:(UIImage *)leftImage {
    _leftImage = leftImage;
    
    [leftImageView setImage:leftImage];
    
}

- (void)setTitle:(NSString *)title {
    _title = title;
    [rightLabel setText:title];
}

@end
