//
//  ViewController.m
//  TuneSearch
//
//  Created by Oscar on 10/5/15.
//  Copyright © 2015 Mike Henry. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@property (nonatomic, strong) NSString                  *hostName;
@property (nonatomic, strong) AppDelegate               *appDelegate;
@property (nonatomic, strong) IBOutlet      UISearchBar *resultsSearchBar;
@property (nonatomic, strong) NSArray                   *iTunesArray;

@end

@implementation ViewController

Reachability *hostReach;
Reachability *internetReach;
Reachability *wifiReach;
bool internetAvailable;
bool serverAvailable;

#pragma mark - Table View Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _iTunesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"ResultsCell"];
    NSDictionary *selectedResult = _iTunesArray[indexPath.row];
    cell.textLabel.text = [selectedResult objectForKey:@"trackName"];
    return cell;
}

#pragma mark - Interactivity Methods

- (void)getData {
    NSLog(@"Get data");
    NSURL *fileURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://%@/search?term=outkast",_hostName]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:fileURL];
    [request setCachePolicy:NSURLRequestReloadIgnoringCacheData];
    [request setTimeoutInterval:30.0];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (([data length] > 0) && (error == nil)) {
            NSJSONSerialization *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            NSLog(@"Got data %@",json);
            _iTunesArray = [(NSDictionary *) json objectForKey:@"results"];
            for (NSDictionary *resultsDict in _iTunesArray) {
                NSLog(@"Song Name:%@",[resultsDict objectForKey:@"trackName"]);
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                // MAIN THREAD CODE GOES HERE
                // reload table view would occur here to display the array
                [_iTunesTableView reloadData];
            });
        }
        else {
            NSLog(@"No data");
        }
    }] resume];
}

#pragma mark - Network Methods

- (void)updateReachabilityStatus:(Reachability *)currReach {
    NSParameterAssert([currReach isKindOfClass:[Reachability class]]);
    NetworkStatus netStatus = [currReach currentReachabilityStatus];
    if (currReach == hostReach) {
        switch (netStatus) {
            case NotReachable:
                NSLog(@"Server not reachable");
                serverAvailable = false;
                break;
            case ReachableViaWiFi:
                NSLog(@"Server reachable via Wifi");
                serverAvailable = true;
                break;
            case ReachableViaWWAN:
                NSLog(@"Server reachable via WAN");
                serverAvailable = true;
                break;
            default:
                break;
        }
    }
    if (currReach == internetReach) {
        switch (netStatus) {
            case NotReachable:
                NSLog(@"Internet not reachable");
                internetAvailable = false;
                break;
            case ReachableViaWiFi:
                NSLog(@"Internet reachable via Wifi");
                internetAvailable = true;
                break;
            case ReachableViaWWAN:
                NSLog(@"Internet reachable via WAN");
                internetAvailable = true;
                break;
            default:
                break;
        }
    }
}

- (void)reachabilityChanged:(NSNotification *)note {
    Reachability *currReach = [note object];
    [self updateReachabilityStatus:currReach];
}


#pragma mark - Life Cycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    _iTunesArray = [[NSArray alloc] init];
    
    _hostName = @"itunes.apple.com";
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    
    hostReach = [Reachability reachabilityWithHostName:_hostName];
    [hostReach startNotifier];
    [self updateReachabilityStatus:hostReach];
    
    internetReach = [Reachability reachabilityWithHostName:_hostName];
    [internetReach startNotifier];
    [self updateReachabilityStatus:internetReach];
    
    [self getData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
