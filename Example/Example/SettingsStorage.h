//
//  SettingsStorage.h
//  Example
//
//  Created by Viktar Kalinchuk on 5/28/18.
//  Copyright © 2018 Viktar Kalinchuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingsStorage : NSObject

+ (instancetype)standard;

- (void)saveSession:(NSString*)session login:(NSString*)login;
- (NSString*)currentSession;
- (NSString*)currentLogin;

@end
