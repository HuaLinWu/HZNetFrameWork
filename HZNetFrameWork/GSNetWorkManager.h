//
//  GSNetWorkManager.h
//  HZNetFrameWork
//
//  Created by 吴华林 on 2017/11/27.
//  Copyright © 2017年 吴华林. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol GSINetRequest,GSINetResponse,GSINetError;
@interface GSNetWorkManager : NSObject

/**
 发送的请求（这个是不带过滤器的）
 @param request 需要请求的request
 @param responeClass 返回的处理的类名
 @param successBlock 成功执行的block
 @param failBlock 失败执行的block
 */
- (void)asyLoadRequest:(id<GSINetRequest>)request responeClass:(NSString *)responeClass progress:(void (^)(NSProgress *uploadProgress))progressBlock success:(void(^)(id<GSINetResponse> respone))successBlock fail:(void(^)(id<GSINetError> error))failBlock;

/**
 发送的请求（带过滤器）

 @param request 需要请求的request
 @param responeClass 处理返回的类名
 @param filterBlock 过滤规则执行的block
 @param successBlock 成功执行的block
 @param failBlock 失败执行的block
 */
- (void)asyLoadRequest:(id<GSINetRequest>)request responeClass:(NSString *)responeClass progress:(void (^)(NSProgress *uploadProgress))progressBlock filter:(BOOL(^)(id responeObject))filterBlock  success:(void(^)(id<GSINetResponse> responeObject))successBlock fail:(void(^)(id<GSINetError> error))failBlock;
/**
 取消当前的网络请求
 */
- (void)cancel;
@end
