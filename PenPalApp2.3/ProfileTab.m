//
//  FirstViewController.m
//  PenPalApp2.3
//
//  Created by Computer on 4/12/15.
//  Copyright (c) 2015 Computer. All rights reserved.
//

#import "ProfileTab.h"
#import "InitView.h"
#import "MainView.h"
#import "AppDelegate.h"
#import "EditProfilePage.h"

@interface ProfileTab ()

@end

@implementation ProfileTab

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    self.navigationItem.title = NSLocalizedString(@"Profile", nil);
    
    UIBarButtonItem *editItem = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(editButton)];
    

    self.navigationItem.rightBarButtonItem = editItem;
    
}

- (IBAction)editButton{
    
    EditProfilePage *vc = [[EditProfilePage alloc] init];
    //UINavigationController *vc2 = [[UINavigationController alloc] initWithRootViewController:vc];
    
   // [(UINavigationController *)self.tabBarController.selectedViewController pushViewController:vc animated:YES];
    //[self.navigationController pushViewController:vc animated:YES];
    
    UINavigationController *vc2 = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:vc2 animated:YES completion:nil];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
