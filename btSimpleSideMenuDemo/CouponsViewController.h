//
//  CouponsViewController.h
//  btSimpleSideMenuDemo
//
//  Created by Jorge Kinejara on 7/25/14.
//  Copyright (c) 2014 Balram Tiwari. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CouponsViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)IBOutlet UITableView *tableView;

@end
