//
//  FirstViewController.m
//  PenPalApp2.3
//
//  Created by Computer on 4/12/15.
//  Copyright (c) 2015 Computer. All rights reserved.
//

#import "SearchTab.h"
#import "FilterSearchPage.h"

@interface SearchTab ()

@end

@implementation SearchTab

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(filter_search)];
    
    UIBarButtonItem *filterItem = [[UIBarButtonItem alloc] initWithTitle:@"Filter" style:UIBarButtonItemStylePlain target:self action:@selector(filter_search)];
    
    
    //self.navigationController.navigationItem.rightBarButtonItem = filterItem;
    //self.navigationItem.leftBarButtonItem = cancelItem;
    self.navigationItem.rightBarButtonItem = filterItem;
    
    self.navigationItem.title = NSLocalizedString(@"Search", nil);
    
    //[[self.tabBarController.tabBar.items objectAtIndex:0] setTitle:NSLocalizedString(@"Search", @"Search")];

    
}

- (IBAction)filter_search{
    
    FilterSearchPage *vc = [[FilterSearchPage alloc] init];
    UINavigationController *vc2 = [[UINavigationController alloc] initWithRootViewController:vc];
    vc2.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:vc2 animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
