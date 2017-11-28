//
//  GSNetWorkManager.m
//  HZNetFrameWork
//
//  Created by 吴华林 on 2017/11/27.
//  Copyright © 2017年 吴华林. All rights reserved.
//

#import "GSNetWorkManager.h"
#import "AFHTTPSessionManager.h"
#import "GSINetRequest.h"
#import "GSIFileNetRequest.h"

@implementation GSNetWorkManager
- (void)asyLoadRequest:(id<GSINetRequest>)request responeClass:(NSString *)responeClass progress:(void (^)(NSProgress *uploadProgress))progressBlock success:(void(^)(id<GSINetResponse> respone))successBlock fail:(void(^)(id<GSINetError> error))failBlock {
    [self asyLoadRequest:request responeClass:responeClass progress:progressBlock filter:nil success:successBlock fail:failBlock];
}
- (void)asyLoadRequest:(id<GSINetRequest>)request responeClass:(NSString *)responeClass progress:(void (^)(NSProgress *uploadProgress))progressBlock filter:(BOOL(^)(id responeObject))filterBlock  success:(void(^)(id<GSINetResponse> responeObject))successBlock fail:(void(^)(id<GSINetError> error))failBlock {
    if([request conformsToProtocol:@protocol(GSIFileNetRequest)]) {
        //文件上传的
        
    } else {
        AFHTTPSessionManager *sessionManager =[AFHTTPSessionManager manager];
        
        NSError *serializationError = nil;
        NSMutableURLRequest *request = [self.requestSerializer requestWithMethod:method URLString:[[NSURL URLWithString:URLString relativeToURL:self.baseURL] absoluteString] parameters:parameters error:&serializationError];
        if (serializationError) {
            if (failure) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wgnu"
                dispatch_async(self.completionQueue ?: dispatch_get_main_queue(), ^{
                    failure(nil, serializationError);
                });
#pragma clang diagnostic pop
            }
            
            return nil;
        }
        
        __block NSURLSessionDataTask *dataTask = nil;
        dataTask = [self dataTaskWithRequest:request
                              uploadProgress:uploadProgress
                            downloadProgress:downloadProgress
                           completionHandler:^(NSURLResponse * __unused response, id responseObject, NSError *error) {
                               if (error) {
                                   if (failure) {
                                       failure(dataTask, error);
                                   }
                               } else {
                                   if (success) {
                                       success(dataTask, responseObject);
                                   }
                               }
                           }];
        
    }
}
- (void)cancel {
    
}
#pragma mark private_method
- (NSMutableURLRequest *)getURLRequestFrom:(id<GSINetRequest>)request {
    AFHTTPSessionManager *sessionManager =[AFHTTPSessionManager manager];
    //请求参数的类型
    switch (request.requestParameterSerializer) {
        case GSdDefault:{
            sessionManager.requestSerializer = [AFHTTPRequestSerializer serializer];
             break;
        }
        case GSNetXMl:{
            sessionManager.requestSerializer = [AFPropertyListRequestSerializer serializer];
            break;
        }
        case GSNetJSON:{
            sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
            break;
        }
    }
    //返回的数据类型
    switch (request.responseDataSerializer) {
        case GSdDefault:{
            sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
            break;
        }
        case GSNetXMl:{
            sessionManager.responseSerializer = [AFPropertyListResponseSerializer serializer];
            break;
        }
        case GSNetJSON:{
            sessionManager.responseSerializer = [AFJSONResponseSerializer serializer];
            break;
        }
    }
    NSError *serializationError = nil;
    NSString *urlString = @"";
    if(request.path) {
        NSURL *url =nil;
        NSURL *baseURL = nil;
        if(request.baseURL) {
            baseURL = [NSURL URLWithString:request.baseURL];
        }
        if(baseURL) {
            url = [NSURL URLWithString:request.path relativeToURL:baseURL];
        } else {
            
        }
    }
    NSMutableURLRequest *urlRequest = [sessionManager.requestSerializer requestWithMethod:request.method URLString:[[NSURL URLWithString:request.path relativeToURL:[NSURL URLWithString:request.baseURL]] absoluteString] parameters:request.parameter error:&serializationError];
    if (serializationError) {
        if (failure) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wgnu"
            dispatch_async(self.completionQueue ?: dispatch_get_main_queue(), ^{
                failure(nil, serializationError);
            });
#pragma clang diagnostic pop
        }
        
        return nil;
    }
}
@end
