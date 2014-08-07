//
//  MyListViewController.m
//  ScanMe
//
//  Created by Jorge Kinejara on 8/5/14.
//  Copyright (c) 2014 Balram Tiwari. All rights reserved.
//

#import "MyListViewController.h"

@interface MyListViewController ()

@property (nonatomic,strong)NSMutableArray *arr;

@end

@implementation MyListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Systems USA";
    
    
    self.arr = [[NSMutableArray alloc] initWithObjects:@"nikon1.jpg",@"nikon2.jpg",@"nikon5.jpeg",nil];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.arr count];    //count number of row from counting array hear cataGorry is An Array
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //static NSString *MyIdentifier = @"MyIdentifier";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@""];
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = [NSString stringWithFormat:@"Save $100 "];
            cell.imageView.image = [UIImage imageNamed:@"nikon1.jpg"];
            
            break;
        case 1:
            cell.textLabel.text = [NSString stringWithFormat:@"Save 50%%"];
            cell.imageView.image = [UIImage imageNamed:@"nikon2.jpg"];
            
            break;
        case 2:
            cell.textLabel.text = [NSString stringWithFormat:@"Free iphone cases"];
            cell.imageView.image = [UIImage imageNamed:@"nikon5.jpeg"];
            
            break;
        case 3:
            cell.textLabel.text = [NSString stringWithFormat:@""];
            break;
        case 4:
            cell.textLabel.text = [NSString stringWithFormat:@""];
            break;
            
        default:
            break;
    }
    
    return cell;
}

@end
