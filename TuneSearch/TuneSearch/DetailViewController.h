//
//  DetailViewController.h
//  TuneSearch
//
//  Created by Oscar on 10/5/15.
//  Copyright © 2015 Mike Henry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <Social/Social.h>

@interface DetailViewController : UIViewController <MFMailComposeViewControllerDelegate>

@property (nonatomic, strong) NSDictionary *selectedResult;

@end
