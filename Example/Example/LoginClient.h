//
//  LoginClient.h
//  Example
//
//  Created by Viktar Kalinchuk on 5/28/18.
//  Copyright © 2018 Viktar Kalinchuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginClient : NSObject

- (BOOL)isLoggedIn;

- (void)loginWithUsername:(NSString*)username completion:(void(^)(BOOL result))completion;

@end
