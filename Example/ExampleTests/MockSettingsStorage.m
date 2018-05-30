//
//  MockSettingsStorage.m
//  ExampleTests
//
//  Created by Valiantsin Vasiliavitski on 5/30/18.
//  Copyright © 2018 Viktar Kalinchuk. All rights reserved.
//

#import "MockSettingsStorage.h"

@interface MockSettingsStorage ()

@property (nonatomic, strong) NSString *login;
@property (nonatomic, strong) NSString *session;


@end

@implementation MockSettingsStorage

-(void)saveSession:(NSString *)session login:(NSString *)login {
    
    if (session.length == 0) {
        return;
    }
    if (login.length == 0) {
        return;
    }
    self.session = session;
    self.login = login;
    
}

-(NSString *)currentLogin {
    
    return self.login;
}

-(NSString *)currentSession {
    
    return self.session;
}

@end
