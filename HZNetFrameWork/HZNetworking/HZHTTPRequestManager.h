//
//  HZHTTPRequestManager.h
//  HZNetFrameWork
//
//  Created by 吴华林 on 2017/8/25.
//  Copyright © 2017年 吴华林. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HZHTTPRequestModel.h"
#import "HZHTTPResponseModel.h"
@interface HZHTTPRequestManager : NSObject

+ (instancetype)shareManager;

/**
 根据requestModel 发送一个请求

 @param requestModel 请求model
 @param complate 完成的block
 */
- (void)sendRequestWithModel:(HZHTTPRequestModel *)requestModel complate:(void(^)(HZHTTPResponseModel *responseModel))complate;

/**
 根据请求获取requestModel 带进度block发送一个请求

 @param requestModel request 需要信息的载体
 @param progress 当前请求的进度执行的block
 @param complate 当前请求完成执行的block
 */
- (void)sendRequestWithModel:(HZHTTPRequestModel *)requestModel progress:( void (^)(NSProgress *progress,NSInteger taskIdentifier))progress complate:(void(^)(HZHTTPResponseModel *responseModel))complate;

/**
 根据一组requestModel 发送一组请求

 @param requestModels requestModel 的组合
 @param complate 一组请求全部完成之后所执行的block
 */
- (void)sendGroupRequestWithModels:(NSArray<HZHTTPRequestModel *> *)requestModels complate:(void(^)(NSArray<HZHTTPResponseModel *>*responseModels))complate;

/**
 根据一组requestModel 发送一组请求，带进度block

 @param requestModels requestModel 的组合
 @param progress 每个request 请求的进度block
 @param complate 一组请求全部完成后执行的block
 */
- (void)sendGroupRequestWithModels:(NSArray<HZHTTPRequestModel *> *)requestModels progress:( void (^)(NSProgress *progress,NSInteger taskIdentifier))progress complate:(void (^)(NSArray<HZHTTPResponseModel *> *))complate;
@end
