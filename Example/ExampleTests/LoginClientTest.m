//
//  LoginClientTest.m
//  ExampleTests
//
//  Created by Viktar Kalinchuk on 5/28/18.
//  Copyright © 2018 Viktar Kalinchuk. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LoginClient.h"
#import "MockNetworkClient.h"
#import <OCMock/OCMock.h>
#import "SettingsStorage.h"
#import "MockSettingsStorage.h"

@interface LoginClientTest : XCTestCase

@end

@implementation LoginClientTest

- (void)testIsLoggedInLoginExists {
    
    LoginClient *client = [[LoginClient alloc] init];
    MockNetworkClient *mockNetwork = [[MockNetworkClient alloc] init];
    [client setValue:mockNetwork forKey:@"networkClient"];
    mockNetwork.stubRequests[@"login"] = @{@"session": @"abwe"};
//    MockSettingsStorage *settings = [[MockSettingsStorage alloc] init];
//    [client setValue:settings forKey:@"storage"];
    SettingsStorage *settings = OCMClassMock([SettingsStorage class]);
    [client setValue:settings forKey:@"storage"];
    OCMStub([settings currentLogin]).andReturn(@"username");
    XCTestExpectation *expectation = [[XCTestExpectation alloc] initWithDescription:@"Expect for completion"];
    [client loginWithUsername:@"username" completion:^(BOOL result) {
        [expectation fulfill];
    }];
    [self waitForExpectations:@[expectation] timeout:1];
    XCTAssertTrue([client isLoggedIn]);
    XCTAssertEqual([mockNetwork.requestedEndpoints count], 0);
    OCMReject([settings saveSession:@"abwe" login:@"username"]);
    
}

- (void)testIsLoggedInNoLogin {
    
    LoginClient *client = [[LoginClient alloc] init];
    MockNetworkClient *mockNetwork = [[MockNetworkClient alloc] init];
    [client setValue:mockNetwork forKey:@"networkClient"];
    mockNetwork.stubRequests[@"login"] = @{@"session": @"abwe"};
    MockSettingsStorage *settings = [[MockSettingsStorage alloc] init];
    [client setValue:settings forKey:@"storage"];
    XCTestExpectation *expectation = [[XCTestExpectation alloc] initWithDescription:@"Expect for completion"];
    [client loginWithUsername:@"username1" completion:^(BOOL result) {
        [expectation fulfill];
    }];
    [self waitForExpectations:@[expectation] timeout:1];
    XCTAssertTrue([client isLoggedIn]);
    XCTAssertEqual([mockNetwork.requestedEndpoints count], 1);
    XCTAssertTrue([mockNetwork.requestedEndpoints.firstObject isEqualToString:@"login"]);
    
}

- (void)testLoginWithUsernameCompletion {
    LoginClient *client = [[LoginClient alloc] init];
    MockNetworkClient *mockNetwork = [[MockNetworkClient alloc] init];
    [client setValue:mockNetwork forKey:@"networkClient"];
    mockNetwork.stubRequests[@"login"] = @{@"session": @"abwe"};
    MockSettingsStorage *settings = [[MockSettingsStorage alloc] init];
    [client setValue:settings forKey:@"storage"];
    
    XCTestExpectation *expectation = [[XCTestExpectation alloc] initWithDescription:@"Expect for completion"];
    [client loginWithUsername:@"username" completion:^(BOOL result) {
        [expectation fulfill];
    }];
    [self waitForExpectations:@[expectation] timeout:1];

    XCTAssertEqual(mockNetwork.requestedEndpoints.count, 1);
    XCTAssertTrue([mockNetwork.requestedEndpoints.firstObject isEqualToString:@"login"]);
}

@end
