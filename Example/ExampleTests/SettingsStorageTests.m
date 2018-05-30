//
//  SettingsStorageTests.m
//  ExampleTests
//
//  Created by Viktar Kalinchuk on 5/28/18.
//  Copyright © 2018 Viktar Kalinchuk. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SettingsStorage.h"
#import <OCMock/OCMock.h>
#import "MockSettingsStorage.h"

@interface SettingsStorageTests : XCTestCase

@property (nonatomic, strong) id defaultsMock;
@property (nonatomic, strong) id storageMock;

@end

@implementation SettingsStorageTests

- (void)setUp {
    [super setUp];
    self.defaultsMock = OCMClassMock([NSUserDefaults class]);
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSaveSessionLoginEmptySession {
    self.storageMock = OCMClassMock([SettingsStorage class]);
    [self.storageMock saveSession:@"" login:@"my_login"];
    
    XCTAssertTrue(((SettingsStorage*)self.storageMock).currentSession == nil);
    XCTAssertTrue(((SettingsStorage*)self.storageMock).currentLogin == nil);
    
}

- (void)testSaveSessionLoginEmptyLogin {
    self.storageMock = OCMClassMock([SettingsStorage class]);
    [self.storageMock saveSession:@"session_id" login:@""];
    
    XCTAssertTrue(((SettingsStorage*)self.storageMock).currentSession == nil);
    XCTAssertTrue(((SettingsStorage*)self.storageMock).currentLogin == nil);
}

- (void)testSaveSessionLoginNilSession {
    self.storageMock = OCMClassMock([SettingsStorage class]);
    [self.storageMock saveSession:nil login:@"my_login"];
    
    XCTAssertTrue(((SettingsStorage*)self.storageMock).currentSession == nil);
    XCTAssertTrue(((SettingsStorage*)self.storageMock).currentLogin == nil);
}

- (void)testSaveSessionLoginNilLogin {
//    self.storageMock = OCMClassMock([SettingsStorage class]);
//    [self.storageMock saveSession:@"session_id" login:nil];
//    
//    XCTAssertTrue(((SettingsStorage*)self.storageMock).currentSession == nil);
//    XCTAssertTrue(((SettingsStorage*)self.storageMock).currentLogin == nil);
    
    MockSettingsStorage *settings = [[MockSettingsStorage alloc] init];
    [settings saveSession:@"session_id" login:nil];
    
    XCTAssertTrue(settings.currentSession == nil);
    XCTAssertTrue(settings.currentLogin == nil);
}

- (void)testSaveSessionLoginValidValues {
    SettingsStorage *storage = [[SettingsStorage alloc] init];
    [storage setValue:self.defaultsMock forKey:@"userDefaults"];

    [storage saveSession:@"session_id" login:@"my_login"];

    OCMVerify([self.defaultsMock setObject:@"session_id" forKey:@"sessionKey"]);
    OCMVerify([self.defaultsMock setObject:@"my_login" forKey:@"loginKey"]);
}

- (void)testCurrentSession {
    SettingsStorage *storage = [[SettingsStorage alloc] init];
    [storage setValue:self.defaultsMock forKey:@"userDefaults"];

    OCMStub([self.defaultsMock stringForKey:@"sessionKey"]).andReturn(@"session_id");
    XCTAssertTrue([storage.currentSession isEqualToString:@"session_id"]);
    OCMVerify([self.defaultsMock stringForKey:@"sessionKey"]);
}

- (void)testCurrentLogin {
    SettingsStorage *storage = [[SettingsStorage alloc] init];
    [storage setValue:self.defaultsMock forKey:@"userDefaults"];

    OCMStub([self.defaultsMock stringForKey:@"loginKey"]).andReturn(@"my_login");
    XCTAssertTrue([storage.currentLogin isEqualToString:@"my_login"]);
    OCMVerify([self.defaultsMock stringForKey:@"loginKey"]);
}

@end
