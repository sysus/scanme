//
//  btViewController.m
//  BTSimpleSideMenuDemo
//
//  Created by Balram on 29/05/14.
//  Copyright (c) 2014 Balram Tiwari. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <Accelerate/Accelerate.h>
#import "btViewController.h"
#import "BTSimpleSideMenu.h"
#import "CouponsViewController.h"
#import "QRScanViewController.h"

@interface btViewController () <BTSimpleSideMenuDelegate>
@property(nonatomic)BTSimpleSideMenu *sideMenu;
@end

@implementation btViewController
@synthesize sideMenu, bgView;

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
    // Do any additional setup after loading the view.
    //self.title = @"asdasd";
    //self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(0, 0, 30, 44)];
    [btn setImage:[UIImage imageNamed:@"56.png"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(show) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *btnBack = [[UIBarButtonItem alloc] initWithCustomView:btn];
    [btnBack setTintColor:[UIColor whiteColor]];
    
    self.navigationItem.leftBarButtonItem = btnBack;
    self.navigationController.navigationBarHidden = NO;
    
    bgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"backGround.jpg"]];
    bgView.frame = [UIScreen mainScreen].bounds;
    [self.view addSubview:bgView];
    UIImageView *author = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"logo.png"]];
    author.frame = CGRectMake(120, 30, 95, 95);
    author.alpha = 0.4;
    [self.view addSubview:author];
    author.layer.borderColor = [UIColor whiteColor].CGColor;
    author.layer.borderWidth = 3;
    author.clipsToBounds = YES;
    author.layer.cornerRadius =  author.frame.size.width/2;
    
    
//    sideMenu = [[BTSimpleSideMenu alloc]initWithItemTitles:@[@"One", @"Two", @"Three", @"Four",@"Five", @"Six", @"Seven"]
//                                             andItemImages:@[
//                                                             [UIImage imageNamed:@"icon1.jpeg"],
//                                                             [UIImage imageNamed:@"icon2.jpeg"],
//                                                             [UIImage imageNamed:@"icon3.jpeg"],
//                                                             [UIImage imageNamed:@"icon4.jpeg"],
//                                                             [UIImage imageNamed:@"icon5.jpeg"],
//                                                             [UIImage imageNamed:@"icon6.jpeg"],
//                                                             [UIImage imageNamed:@"icon7.jpeg"]
//                                                             ]
//                                       addToViewController:self];
    sideMenu.delegate = self;
    
    BTSimpleMenuItem *item1 = [[BTSimpleMenuItem alloc]initWithTitle:@"Coupons"
                                                               image:[UIImage imageNamed:@"icon1.png"]
                                                        onCompletion:^(BOOL success, BTSimpleMenuItem *item) {
                                                        
                                                            CouponsViewController *couponsVC = [[CouponsViewController alloc] initWithNibName:@"CouponsViewController" bundle:nil];
                                                            
                                                            [self.navigationController pushViewController:couponsVC animated:YES];
                                                            
                                                            
                                                            NSLog(@"I am Item 1");
                                                        }];
    
    BTSimpleMenuItem *item2 = [[BTSimpleMenuItem alloc]initWithTitle:@"Scan"
                                                               image:[UIImage imageNamed:@"icon2.png"]
                                                        onCompletion:^(BOOL success, BTSimpleMenuItem *item) {
                                                            
                                                            QRScanViewController *QVC = [[QRScanViewController alloc] initWithNibName:@"QRScanViewController" bundle:nil];
                                                            
                                                            [self.navigationController pushViewController:QVC animated:YES];
                                                            
                                                            
                                                            NSLog(@"I am Item 2");
                                                        }];
    
    BTSimpleMenuItem *item3 = [[BTSimpleMenuItem alloc]initWithTitle:@"My List"
                                                               image:[UIImage imageNamed:@"icon3.png"]
                                                        onCompletion:^(BOOL success, BTSimpleMenuItem *item) {
                                                            
                                                            NSLog(@"I am Item 3");
                                                        }];
    
    BTSimpleMenuItem *item4 = [[BTSimpleMenuItem alloc]initWithTitle:@"About us"
                                                               image:[UIImage imageNamed:@"icon4.png"]
                                                        onCompletion:^(BOOL success, BTSimpleMenuItem *item) {
                                                            NSLog(@"I am Item 4");
                                                        }];
    
    BTSimpleMenuItem *item5 = [[BTSimpleMenuItem alloc]initWithTitle:@""
                                                               image:[UIImage imageNamed:@"icon5.png"]
                                                        onCompletion:^(BOOL success, BTSimpleMenuItem *item) {
                                                            
                                                            NSLog(@"I am Item 5");
                                                        }];
    
    BTSimpleMenuItem *item6 = [[BTSimpleMenuItem alloc]initWithTitle:@""
                                                               image:[UIImage imageNamed:@"icon6.png"]
                                                        onCompletion:^(BOOL success, BTSimpleMenuItem *item) {
                                                            
                                                            NSLog(@"I am Item 6");
                                                        }];
    
    BTSimpleMenuItem *item7 = [[BTSimpleMenuItem alloc]initWithTitle:@""
                                                               image:[UIImage imageNamed:@"icon7.png"]
                                                        onCompletion:^(BOOL success, BTSimpleMenuItem *item) {
                                                            
                                                            NSLog(@"I am Item 7");
                                                            
                                                        }];
    
    sideMenu = [[BTSimpleSideMenu alloc]initWithItem:@[item1, item2, item3, item4]
                                 addToViewController:self];
    
    
}


-(void)viewDidAppear:(BOOL)animated {
    
}

-(void)show{
    [sideMenu toggleMenu];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma -mark BTSimpleSideMenuDelegate

-(void)BTSimpleSideMenu:(BTSimpleSideMenu *)menu didSelectItemAtIndex:(NSInteger)index {
    NSLog(@"Item Cliecked : %ld", (long)index);
}

-(void)BTSimpleSideMenu:(BTSimpleSideMenu *)menu selectedItemTitle:(NSString *)title {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Menu Clicked"
                                                   message:[NSString stringWithFormat:@"Item Title : %@", title]
                                                  delegate:self
                                         cancelButtonTitle:@"Dismiss"
                                         otherButtonTitles:nil, nil];
    [alert show];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
