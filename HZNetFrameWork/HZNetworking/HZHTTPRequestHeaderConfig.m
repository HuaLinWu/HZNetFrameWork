//
//  HZHTTPRequestHeaderConfig.m
//  HZNetFrameWork
//
//  Created by 吴华林 on 2017/8/25.
//  Copyright © 2017年 吴华林. All rights reserved.
//

#import "HZHTTPRequestHeaderConfig.h"
@interface HZHTTPRequestHeaderConfig()
@property(nonatomic, strong)NSMutableDictionary *allHeaderDict;
@end
@implementation HZHTTPRequestHeaderConfig
#pragma mark public_method
+(instancetype)shareConfig {
    static dispatch_once_t onceToken;
    static HZHTTPRequestHeaderConfig *config;
    dispatch_once(&onceToken, ^{
        config = [[self alloc] init];
        [config commonHeader];
    });
    return config;
}

/**
 固定不变头部信息（这个方法主要用来配置APP 有关的信息）
 */
- (void)commonHeader {
    // 这个方法后面会列出来
}
-(void)customHeader:(NSDictionary *)header {
    if(header) {
      [self.allHeaderDict setValuesForKeysWithDictionary:header];
    }
}
#pragma mark set/get
- (NSMutableDictionary *)allHeaderDict {
    if(!_allHeaderDict) {
        _allHeaderDict = [[NSMutableDictionary alloc] init];
    }
    return _allHeaderDict;
}
- (NSDictionary *)allHeader {
    
    return [_allHeaderDict copy];
}
@end
