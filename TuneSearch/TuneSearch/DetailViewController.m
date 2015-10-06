//
//  DetailViewController.m
//  TuneSearch
//
//  Created by Oscar on 10/5/15.
//  Copyright © 2015 Mike Henry. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "DetailViewController.h"

@interface DetailViewController ()

@property (nonatomic, weak) IBOutlet UILabel *detailTrackNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *detailArtistNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *detailCollectionNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *detailTrackPriceLabel;

@end

@implementation DetailViewController

#pragma mark - Interactivity Methods




#pragma mark - Life Cycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _detailTrackNameLabel.text = [_selectedResult objectForKey:@"trackName"];
    _detailArtistNameLabel.text = [_selectedResult objectForKey:@"artistName"];
    _detailCollectionNameLabel.text = [_selectedResult objectForKey:@"collectionName"];
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    _detailTrackPriceLabel.text = [formatter stringFromNumber:[_selectedResult objectForKey:@"trackPrice"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end