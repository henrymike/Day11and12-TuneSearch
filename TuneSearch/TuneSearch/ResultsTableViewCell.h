//
//  ResultsTableViewCell.h
//  TuneSearch
//
//  Created by Oscar on 10/5/15.
//  Copyright © 2015 Mike Henry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultsTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *trackNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *artistNameLabel;
@property (nonatomic, weak) IBOutlet UIImage *albumArtImage;

@end