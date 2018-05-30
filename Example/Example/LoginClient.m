//
//  LoginClient.m
//  Example
//
//  Created by Viktar Kalinchuk on 5/28/18.
//  Copyright © 2018 Viktar Kalinchuk. All rights reserved.
//

#import "LoginClient.h"
#import "SettingsStorage.h"
#import "NetworkClient.h"

@interface LoginClient ()

@property (nonatomic, strong) NetworkClient *networkClient;
@property (nonatomic, strong) SettingsStorage *storage;

@end

@implementation LoginClient

- (instancetype)init {
    if (self = [super init]) {
        self.networkClient = [[NetworkClient alloc] init];
    }
    self.storage = [SettingsStorage standard];
    return self;
}

- (BOOL)isLoggedIn {
    return self.storage.currentLogin != nil;
}

- (void)loginWithUsername:(NSString *)username completion:(void (^)(BOOL))completion {
    if ([self.storage.currentLogin isEqualToString:username]) {
        completion(YES);
        return;
    }
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        [self.networkClient requestWithEndpoint:@"login" completion:^(id result) {
            if ([result isKindOfClass:[NSDictionary class]] == false) {
                // parsing error
                completion(NO);
                return;
            }
            NSDictionary *json = (NSDictionary*)result;
            NSString *session = json[@"session"];
            if ([session isKindOfClass:[NSString class]] == false) {
                // parsing error
                completion(NO);
                return;
            }
            [self.storage saveSession:session login:username];
            completion(YES);
        }];
    });
}

@end
