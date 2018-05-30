//
//  Math.m
//  Example
//
//  Created by Viktar Kalinchuk on 5/25/18.
//  Copyright © 2018 Viktar Kalinchuk. All rights reserved.
//

#import "Math.h"

@interface Math ()

@property (nonatomic, assign) NSInteger saved;

@end

@implementation Math

- (NSUInteger)power:(NSInteger)x {
    return x * x;
}

- (NSUInteger)integerSquareRoot:(NSInteger)x {
    return round(sqrt(x));
}

- (void)memory:(NSInteger)x {
    self.saved = x;
}

- (void)clean {
    self.saved = 0;
}

- (NSInteger)addToSaved:(NSInteger)x {
    self.saved += x;
    return self.saved;
}

@end
