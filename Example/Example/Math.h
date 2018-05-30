//
//  Math.h
//  Example
//
//  Created by Viktar Kalinchuk on 5/25/18.
//  Copyright © 2018 Viktar Kalinchuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Math : NSObject

@property (nonatomic, readonly) NSInteger saved;

- (NSUInteger)power:(NSInteger)x;
- (NSUInteger)integerSquareRoot:(NSInteger)x;

- (void)memory:(NSInteger)x;
- (NSInteger)addToSaved:(NSInteger)x;
- (void)clean;

@end
