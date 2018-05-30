//
//  MockNetworkClient.m
//  ExampleTests
//
//  Created by Viktar Kalinchuk on 5/28/18.
//  Copyright © 2018 Viktar Kalinchuk. All rights reserved.
//

#import "MockNetworkClient.h"

@implementation MockNetworkClient

- (instancetype)init {
    if (self = [super init]) {
        self.requestedEndpoints = [NSMutableArray array];
        self.stubRequests = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)requestWithEndpoint:(NSString *)endpoint completion:(void (^)(id))completion {
    [self.requestedEndpoints addObject:endpoint];
    completion(self.stubRequests[endpoint]);
}

@end
