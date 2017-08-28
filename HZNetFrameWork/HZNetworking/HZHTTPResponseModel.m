//
//  HZHTTPResponseModel.m
//  HZNetFrameWork
//
//  Created by 吴华林 on 2017/8/25.
//  Copyright © 2017年 吴华林. All rights reserved.
//

#import "HZHTTPResponseModel.h"
@interface HZHTTPResponseModel()

@property(nonatomic,strong)id object;
@property(nonatomic,assign)BOOL isSuccess;
@property(nonatomic,copy) NSString *message;
@property(nonatomic,assign) NSInteger taskIdentifier;
@end
@implementation HZHTTPResponseModel
- (instancetype)initWithResponseObject:(id)responseObject error:(NSError *)error taskIdentifier:(NSInteger)taskIdentifier {
    self = [self init];
    if(self) {
        _taskIdentifier = taskIdentifier;
        [self analysisResponseObject:responseObject error:error];
    }
    return self;
}
#pragma mark private
static id _HRMFilterJSONObject(id JSONObject) {
    id returnObject = nil;
   NSDictionary *filterDict = @{@"TRUE" :   @(YES),
                    @"True" :   @(YES),
                    @"true" :   @(YES),
                    @"FALSE" :  @(NO),
                    @"False" :  @(NO),
                    @"false" :  @(NO),
                    @"YES" :    @(YES),
                    @"Yes" :    @(YES),
                    @"yes" :    @(YES),
                    @"NO" :     @(NO),
                    @"No" :     @(NO),
                    @"no" :     @(NO),
                    @"NIL" :    (id)kCFNull,
                    @"Nil" :    (id)kCFNull,
                    @"nil" :    (id)kCFNull,
                    @"NULL" :   (id)kCFNull,
                    @"Null" :   (id)kCFNull,
                    @"null" :   (id)kCFNull,
                    @"(NULL)" : (id)kCFNull,
                    @"(Null)" : (id)kCFNull,
                    @"(null)" : (id)kCFNull,
                    @"<NULL>" : (id)kCFNull,
                    @"<Null>" : (id)kCFNull,
                    @"<null>" : (id)kCFNull
                    };
    if([JSONObject isKindOfClass:[NSDictionary class]]) {
        NSMutableDictionary *mutableDict = [NSMutableDictionary dictionaryWithDictionary:JSONObject];
        for(id key in [JSONObject allKeys]) {
            id value = JSONObject[key];
            if([value isKindOfClass:[NSArray class]] || [value isKindOfClass:[NSDictionary class]]) {
             [mutableDict setObject:_HRMFilterJSONObject(value) forKey:key];
            } else {
                if(filterDict[value]) {
                    id tempValue = filterDict[value];
                    if(tempValue == (id)kCFNull) {
                        [mutableDict removeObjectForKey:key];
                    } else {
                      [mutableDict setObject:tempValue forKey:key];
                    }
                }
            }
        }
        returnObject = mutableDict;
    } else if ([JSONObject isKindOfClass:[NSArray class]]) {
        NSMutableArray *mutableArray = [NSMutableArray arrayWithArray:JSONObject];
        for(int i =0; i<((NSArray *)JSONObject).count; i++) {
            id value = JSONObject[i];
            if([value isKindOfClass:[NSArray class]] || [value isKindOfClass:[NSDictionary class]]) {
                [mutableArray replaceObjectAtIndex:i withObject:_HRMFilterJSONObject(value)];
            } else {
                if(filterDict[value]) {
                    id tempValue = filterDict[value];
                    if(tempValue == (id)kCFNull) {
                        [mutableArray removeObjectAtIndex:i];
                    } else {
                       [mutableArray replaceObjectAtIndex:i withObject:tempValue];
                    }
                }
            }
        }
        returnObject = mutableArray;
    }
    return returnObject;
}
- (void)analysisResponseObject:(id)responseObject error:(NSError *)error {
    if(error) {
        _isSuccess = NO;
        _object = nil;
        _message = [error description];
        return;
    }
    _object =[self _HRMObjectForJsonObject:responseObject];
    _isSuccess = YES;
}

- (id)_HRMObjectForJsonObject:(id)responseObject {
    if(!responseObject || responseObject == (id)kCFNull) return nil;
    id object = nil;
    NSData *jsonData = nil;
    if([responseObject isKindOfClass:[NSDictionary class]] ||[responseObject isKindOfClass:[NSArray class]]) {
        object = responseObject;
    } else if ([responseObject isKindOfClass:[NSString class]]) {
        jsonData = [responseObject dataUsingEncoding:NSUTF8StringEncoding];
    }
    else if ([responseObject isKindOfClass:[NSData class]]) {
        jsonData = responseObject;
    }
    if(jsonData) {
        object = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:NULL];
        
    }
    id tempObject = _HRMFilterJSONObject(object);
    return tempObject;
}

@end
