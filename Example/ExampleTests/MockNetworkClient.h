//
//  MockNetworkClient.h
//  ExampleTests
//
//  Created by Viktar Kalinchuk on 5/28/18.
//  Copyright © 2018 Viktar Kalinchuk. All rights reserved.
//

#import "NetworkClient.h"

@interface MockNetworkClient : NetworkClient

@property (nonatomic, strong) NSMutableDictionary *stubRequests;
@property (nonatomic, strong) NSMutableArray *requestedEndpoints;

@end
