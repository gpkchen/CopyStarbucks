//
//  HttpManager.h
//  testWeChat
//
//  Created by Tesla_Chen on 2017/11/1.
//  Copyright © 2017年 Telsa_Chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import "StarNetClient.h"


@interface HttpManager : NSObject

+ (void)getAsynRequestWithUrl:(NSString *)url
                        Parms:(NSDictionary *)parms
                      Success:(void(^)(NSDictionary *resultObject))success
                      Failure:(void(^)(NSError *requestErr))failure;

+ (void)postAsynRequestWithUrl:(NSString *)url
                         Parms:(NSDictionary *)parms
                       Success:(void(^)(NSDictionary *resultObject))success
                       Failure:(void(^)(NSError *requestErr))failure;



@end
