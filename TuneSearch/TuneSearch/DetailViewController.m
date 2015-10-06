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

@property (nonatomic, weak) IBOutlet UILabel     *detailTrackNameLabel;
@property (nonatomic, weak) IBOutlet UILabel     *detailArtistNameLabel;
@property (nonatomic, weak) IBOutlet UILabel     *detailCollectionNameLabel;
@property (nonatomic, weak) IBOutlet UILabel     *detailTrackPriceLabel;
@property (nonatomic, weak) IBOutlet UIImageView *albumArtImage;
@property (nonatomic, weak) IBOutlet UIButton    *shareTwitterButton;
@property (nonatomic, weak) IBOutlet UIButton    *shareEmailButton;


@end

@implementation DetailViewController

#pragma mark - Interactivity Methods

- (IBAction)sendViaEmail:(id)sender {
    NSLog(@"Email Button");
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *mailVC = [[MFMailComposeViewController alloc] init];
        mailVC.mailComposeDelegate = self;
        [mailVC setSubject:@"Thought you would enjoy this!"];
        [mailVC setMessageBody:[NSString stringWithFormat:@"Check out %@",[_selectedResult objectForKey:@"trackName"]] isHTML:false];
        [self.navigationController presentViewController:mailVC animated:true completion:nil];
    }
}

- (IBAction)shareViaTwitter:(id)sender {
    NSLog(@"Twitter Button");
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        SLComposeViewController *twitterVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        [twitterVC setInitialText:[NSString stringWithFormat:@"Check out %@",[_selectedResult objectForKey:@"trackName"]]];
        [self.navigationController presentViewController:twitterVC animated:true completion:nil];
    }
}

#pragma mark - File System Methods

- (NSString *)getDocumentsDirectory {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true);
    NSString *documentDirectory = paths[0];
    NSLog(@"DocPath:%@",paths[0]);
    return documentDirectory;
}

- (BOOL)fileIsLocal:(NSString *)filename {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *filePath = [[self getDocumentsDirectory] stringByAppendingPathComponent:filename];
    return [fileManager fileExistsAtPath:filePath];
}

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
    
    NSString *fileName = [_selectedResult objectForKey:@"artworkUrl30"];
    NSString *lastComponent = [[NSURL URLWithString:fileName] lastPathComponent];
        _albumArtImage.image = [UIImage imageNamed:[[self getDocumentsDirectory] stringByAppendingPathComponent:lastComponent]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end