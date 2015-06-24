//
//  FirstViewController.m
//  PenPalApp2.3
//
//  Created by Computer on 4/12/15.
//  Copyright (c) 2015 Computer. All rights reserved.
//

#import "PostsTab.h"


@interface PostsTab ()

@end

@implementation PostsTab

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.title = NSLocalizedString(@"Posts", nil);
    
    UIBarButtonItem *refreshItem = [[UIBarButtonItem alloc] initWithTitle:@"Refresh" style:UIBarButtonItemStylePlain target:self action:@selector(refresh_search)];
    
    UIBarButtonItem *editItem = [[UIBarButtonItem alloc] initWithTitle:@"+" style:UIBarButtonItemStylePlain target:self action:@selector(addButton)];
    
    self.navigationItem.leftBarButtonItem = refreshItem;
    self.navigationItem.rightBarButtonItem = editItem;
    
}

- (IBAction)addButton{

}

- (IBAction)refresh_search{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
