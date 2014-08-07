//
//  MyListViewController.h
//  ScanMe
//
//  Created by Jorge Kinejara on 8/5/14.
//  Copyright (c) 2014 Balram Tiwari. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyListViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)IBOutlet UITableView *tableView;

@end
