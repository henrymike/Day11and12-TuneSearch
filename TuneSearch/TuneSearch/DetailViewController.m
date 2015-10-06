//
//  DetailViewController.m
//  TuneSearch
//
//  Created by Oscar on 10/5/15.
//  Copyright © 2015 Mike Henry. All rights reserved.
//

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
//    NSDictionary *selectedResult = _iTunesArray[indexPath.row];
    _detailArtistNameLabel = [_selectedResult objectForKey:@"artistName"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end