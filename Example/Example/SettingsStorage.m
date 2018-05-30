//
//  SettingsStorage.m
//  Example
//
//  Created by Viktar Kalinchuk on 5/28/18.
//  Copyright © 2018 Viktar Kalinchuk. All rights reserved.
//

#import "SettingsStorage.h"

@interface SettingsStorage ()

@property (nonatomic, strong) NSUserDefaults *userDefaults;

@end

@implementation SettingsStorage

#define SESSION_KEY      @"sessionKey"
#define LOGIN_KEY        @"loginKey"

static SettingsStorage *sharedInstance;
+ (instancetype)standard {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    if (self = [super init]) {
        self.userDefaults = [NSUserDefaults standardUserDefaults];
    }
    return self;
}

- (void)saveSession:(NSString *)session login:(NSString *)login {
    if (session.length == 0) {
        return;
    }
    if (login.length == 0) {
        return;
    }
    [self.userDefaults setObject:session forKey:SESSION_KEY];
    [self.userDefaults setObject:login forKey:LOGIN_KEY];
}

- (NSString *)currentLogin {
    return [self.userDefaults stringForKey:LOGIN_KEY];
}

- (NSString *)currentSession {
    return [self.userDefaults stringForKey:SESSION_KEY];
}

@end
