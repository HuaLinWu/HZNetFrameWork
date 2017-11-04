//
//  HZHTTPRequestManager.m
//  HZNetFrameWork
//
//  Created by 吴华林 on 2017/8/25.
//  Copyright © 2017年 吴华林. All rights reserved.
//

#import "HZHTTPRequestManager.h"
#import <AFNetworking/AFHTTPSessionManager.h>
@interface HZHTTPRequestManager()
@property(nonatomic, strong)AFHTTPSessionManager *afManager;
@end
@implementation HZHTTPRequestManager
+ (instancetype)shareManager {
    static dispatch_once_t onceToken;
    static HZHTTPRequestManager *manager;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
        [manager initSessionManager];
        
    });
    return manager;
}
/**
 根据requestModel 发送一个请求
 
 @param requestModel 请求model
 @param complate 完成的block
 */
- (void)sendRequestWithModel:(HZHTTPRequestModel *)requestModel complate:(void(^)(HZHTTPResponseModel *responseModel))complate {
    [self sendRequestWithModel:requestModel progress:nil complate:complate];
}

/**
 根据请求获取requestModel 发送一个请求
 
 @param requestModel request 需要信息的载体
 @param progress 当前请求的进度执行的block
 @param complate 当前请求完成执行的block
 */
- (void)sendRequestWithModel:(HZHTTPRequestModel *)requestModel progress:( void (^)(NSProgress *progress,NSInteger taskIdentifier))progress complate:(void(^)(HZHTTPResponseModel *responseModel))complate {
    
    NSInteger taskIdentifier = requestModel.taskIdentifier;
    NSString *urlString = requestModel.urlString;
    NSString *httpMethod = requestModel.httpMethod;
    NSDictionary *parameters = requestModel.parameters;
    NSDictionary *bodyDataDict = requestModel.bodyDataDict;
    if(urlString) {
        //GET 请求
        if([httpMethod isEqualToString:@"GET"]) {
            
            [_afManager GET:urlString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
                if(progress){
                    progress(downloadProgress,taskIdentifier);
                }
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                HZHTTPResponseModel *responseModel = [[HZHTTPResponseModel alloc] initWithResponseObject:responseObject error:nil taskIdentifier:taskIdentifier];
                if(complate) {
                    complate(responseModel);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                HZHTTPResponseModel *responseModel = [[HZHTTPResponseModel alloc] initWithResponseObject:nil error:error taskIdentifier:taskIdentifier];
                if(complate) {
                    complate(responseModel);
                }
            }];
        }
        //post 请求
        else if ([httpMethod isEqualToString:@"POST"]) {
            [_afManager POST:urlString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
                if(bodyDataDict) {
                    for(NSString *key in [bodyDataDict allKeys]) {
                     NSData *data = bodyDataDict[key];
                     [formData appendPartWithFormData:data name:key];
                    }
                    
                }
            } progress:^(NSProgress * _Nonnull uploadProgress) {
                if(progress){
                    progress(uploadProgress,taskIdentifier);
                }
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                HZHTTPResponseModel *responseModel = [[HZHTTPResponseModel alloc] initWithResponseObject:responseObject error:nil taskIdentifier:taskIdentifier];
                if(complate) {
                    complate(responseModel);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
                HZHTTPResponseModel *responseModel = [[HZHTTPResponseModel alloc] initWithResponseObject:nil error:error taskIdentifier:taskIdentifier];
                if(complate) {
                    complate(responseModel);
                }
            }];
        }
        //head 请求（这个目前没什么用）
        else if([httpMethod isEqualToString:@"HEAD"]) {
            
           [_afManager HEAD:urlString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task) {
               HZHTTPResponseModel *responseModel = [[HZHTTPResponseModel alloc] initWithResponseObject:nil error:nil taskIdentifier:taskIdentifier];
               if(complate) {
                   complate(responseModel);
               }
           } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
               HZHTTPResponseModel *responseModel = [[HZHTTPResponseModel alloc] initWithResponseObject:nil error:error taskIdentifier:taskIdentifier];
               if(complate) {
                   complate(responseModel);
               }
           }];
        }
        //PUT 请求
        else if ([httpMethod isEqualToString:@"PUT"]) {
         [_afManager PUT:urlString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             HZHTTPResponseModel *responseModel = [[HZHTTPResponseModel alloc] initWithResponseObject:responseObject error:nil taskIdentifier:taskIdentifier];
             if(complate) {
                 complate(responseModel);
             }
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             HZHTTPResponseModel *responseModel = [[HZHTTPResponseModel alloc] initWithResponseObject:nil error:error taskIdentifier:taskIdentifier];
             if(complate) {
                 complate(responseModel);
             }
         }];
        }
        //PATCH 请求
        else if ([httpMethod isEqualToString:@"PATCH"]) {
            [_afManager PATCH:urlString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                HZHTTPResponseModel *responseModel = [[HZHTTPResponseModel alloc] initWithResponseObject:responseObject error:nil taskIdentifier:taskIdentifier];
                if(complate) {
                    complate(responseModel);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                HZHTTPResponseModel *responseModel = [[HZHTTPResponseModel alloc] initWithResponseObject:nil error:error taskIdentifier:taskIdentifier];
                if(complate) {
                    complate(responseModel);
                }
            }];
        }
        //DELETE 请求
        else if ([httpMethod isEqualToString:@"DELETE"]) {
            [_afManager DELETE:urlString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                HZHTTPResponseModel *responseModel = [[HZHTTPResponseModel alloc] initWithResponseObject:responseObject error:nil taskIdentifier:taskIdentifier];
                if(complate) {
                    complate(responseModel);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                HZHTTPResponseModel *responseModel = [[HZHTTPResponseModel alloc] initWithResponseObject:nil error:error taskIdentifier:taskIdentifier];
                if(complate) {
                    complate(responseModel);
                }
            }];
        }
        
    }
}

/**
 根据一组requestModel 发送一组请求
 
 @param requestModels requestModel 的组合
 @param complate 一组请求全部完成之后所执行的block
 */
- (void)sendGroupRequestWithModels:(NSArray<HZHTTPRequestModel *> *)requestModels complate:(void(^)(NSArray<HZHTTPResponseModel *>*responseModels))complate {
    
    [self sendGroupRequestWithModels:requestModels progress:nil complate:complate];
}

/**
 根据一组requestModel 发送一组请求
 
 @param requestModels requestModel 的组合
 @param progress 每个request 请求的进度block
 @param complate 一组请求全部完成后执行的block
 */
- (void)sendGroupRequestWithModels:(NSArray<HZHTTPRequestModel *> *)requestModels progress:( void (^)(NSProgress *progress,NSInteger taskIdentifier))progress complate:(void (^)(NSArray<HZHTTPResponseModel *> *))complate {
    
    NSMutableArray *responseModelArray = [[NSMutableArray alloc] init];
    dispatch_group_t group = dispatch_group_create();
    for(HZHTTPRequestModel *requestModel in requestModels) {
        dispatch_group_enter(group);
        [self sendRequestWithModel:requestModel progress:progress complate:^(HZHTTPResponseModel *responseModel) {
            [responseModelArray addObject:responseModel];
            dispatch_group_leave(group);
        }];
    }
    dispatch_queue_t completionQueue = _afManager.completionQueue;
    dispatch_group_notify(group,completionQueue, ^{
        complate(responseModelArray);
    });
}
#pragma mark private
- (void)initSessionManager {
    _afManager = [AFHTTPSessionManager manager];
    _afManager.completionQueue = dispatch_queue_create("HZHTTPRequestComplateQueue", DISPATCH_QUEUE_CONCURRENT);
}
@end
