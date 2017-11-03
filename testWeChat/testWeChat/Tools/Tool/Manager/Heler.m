//
//  Heler.m
//  testWeChat
//
//  Created by Tesla_Chen on 2017/11/3.
//  Copyright © 2017年 Telsa_Chen. All rights reserved.
//

#import "Heler.h"

@implementation Heler



+ (NSString *)getCurrentTimeYMD {
    
    NSDate *currentDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd"];
    NSString *currentDateStr = [dateFormatter stringFromDate:currentDate];
    return currentDateStr;
    
}

+ (NSString *)getCurrentTimeHMS {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"hh-mm-ss"];
    NSString *currentTime = [dateFormatter stringFromDate:[NSDate date]];
    return currentTime;
}
@end
