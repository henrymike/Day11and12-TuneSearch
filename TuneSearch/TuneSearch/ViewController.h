//
//  ViewController.h
//  TuneSearch
//
//  Created by Oscar on 10/5/15.
//  Copyright © 2015 Mike Henry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reachability.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>


@property (nonatomic, strong) NSManagedObjectContext    *managedObjectContext;
@property (nonatomic, weak)   IBOutlet  UITableView     *iTunesTableView;
@property (nonatomic, strong) NSArray                   *iTunesArray;




@end

