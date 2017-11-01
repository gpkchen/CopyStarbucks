//
//  HttpManager.m
//  testWeChat
//
//  Created by Tesla_Chen on 2017/11/1.
//  Copyright © 2017年 Telsa_Chen. All rights reserved.
//

#import "HttpManager.h"
#import "StarNetClient.h"


@implementation HttpManager

+ (void)getAsynRequestWithUrl:(NSString *)url
                        Parms:(NSDictionary *)parms
                      Success:(void(^)(NSDictionary *resultObject))success
                      Failure:(void(^)(NSError *requestErr))failure
{
    [HttpManager requestAsynRequestWithUrl:url Parms:parms Success:success Failure:failure isGet:YES];
    
}

+ (void)postAsynRequestWithUrl:(NSString *)url
                         Parms:(NSDictionary *)parms
                       Success:(void(^)(NSDictionary *resultObject))success
                       Failure:(void(^)(NSError *requestErr))failure
{
    
    [HttpManager postAsynRequestWithUrl:url Parms:parms Success:success Failure:failure];
    
}


+ (void)requestAsynRequestWithUrl:(NSString *)url
                         Parms:(NSDictionary *)parms
                       Success:(void(^)(NSDictionary *resultObject))success
                       Failure:(void(^)(NSError *requestErr))failure
                            isGet:(BOOL)_isGet
{
    
    StarNetClient *session =[StarNetClient sharedStatNetClient];
    
    session.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    
    __weak typeof(self) wSelf = self;
    id successBlock = ^(NSURLSessionDataTask * _Nonnull task,id _Nullable responceObject) {
        
        if (!wSelf) {
            return ;
        }
        
        NSError *error;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responceObject options:NSJSONReadingMutableContainers error:&error];
        
        
        if (success != NULL) {
            success(dic);
        }
        
        
    };
    
    
    id failureBlock = ^(NSURLSessionDataTask * _Nonnull task, NSError * _Nullable error) {
        
        NSLog(@"%@",error);
        
        if (failure != NULL) {
            failure(error);
        }
        
    };
    
    
    if (_isGet == YES) {
        [session GET:url parameters:parms progress:nil success:successBlock failure:failureBlock];
    } else {
        [session POST:url parameters:parms progress:nil success:successBlock failure:failureBlock];
    }
    
}

@end
