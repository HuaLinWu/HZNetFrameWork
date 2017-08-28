//
//  HZHTTPRequestHeaderConfig.h
//  HZNetFrameWork
//  通用头部配置信息在这配置
//  Created by 吴华林 on 2017/8/25.
//  Copyright © 2017年 吴华林. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZHTTPRequestHeaderConfig : NSObject

/**
 这个是公用头部信息和自定义信息的集合
 */
@property(nonatomic, readonly, copy)NSDictionary *allHeader;
+(instancetype)shareConfig;
/**
 自定义头部信息，这个主要给变化的头部信息，比如身份验证的头部信息

 @param header 头部信息字典
 */
-(void)customHeader:(NSDictionary *)header;
@end
