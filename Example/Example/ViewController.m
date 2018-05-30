//
//  ViewController.m
//  Example
//
//  Created by Viktar Kalinchuk on 5/25/18.
//  Copyright © 2018 Viktar Kalinchuk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"view did load");
}


- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateTitle:(NSString*)newTitle {
    self.title = newTitle;
}

- (void)setDefaultTitle {
    self.title = @"default title";
}

@end
