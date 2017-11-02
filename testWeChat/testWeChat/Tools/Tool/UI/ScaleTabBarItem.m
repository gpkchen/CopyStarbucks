//
//  ScaleTabBarItem.m
//  testWeChat
//
//  Created by Tesla_Chen on 2017/11/2.
//  Copyright © 2017年 Telsa_Chen. All rights reserved.
//

#import "ScaleTabBarItem.h"
#import <pop/POP.h>
@implementation ScaleTabBarItem


- (instancetype)initWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage{
    self = [super initWithTitle:title image:image selectedImage:selectedImage];
    if (self) {
        [self setup];
        [self setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12*kMainScaleMiunes]} forState:(UIControlStateNormal | UIControlStateSelected)];
    }
    return self;
}


#pragma mark -- Pravite instance Method

- (void)setup {
    
    
    
}

- (void)scaleToSmall{
    
    POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewScaleXY];
    scaleAnimation.toValue = [NSValue valueWithCGSize:(CGSizeMake(0.7f, 0.7f))];
    
    
}







@end
