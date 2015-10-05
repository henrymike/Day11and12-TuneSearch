//
//  ViewController.m
//  TuneSearch
//
//  Created by Oscar on 10/5/15.
//  Copyright © 2015 Mike Henry. All rights reserved.
//

#import "ViewController.h"
#import "Reachability.h"

@interface ViewController ()

@property (nonatomic, strong) NSString *hostName;

@end

@implementation ViewController

Reachability *hostReach;
Reachability *internetReach;
Reachability *wifiReach;
bool internetAvailable;
bool serverAvailable;

#pragma mark - Network Methods




#pragma mark - Life Cycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
