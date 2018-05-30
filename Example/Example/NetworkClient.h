//
//  NetworkClient.h
//  Example
//
//  Created by Viktar Kalinchuk on 5/28/18.
//  Copyright © 2018 Viktar Kalinchuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkClient : NSObject

- (void)requestWithEndpoint:(NSString*)endpoint completion:(void(^)(id result))completion;

@end
