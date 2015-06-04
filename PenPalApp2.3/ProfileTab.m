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
    
    UIButton *Button = [[UIButton alloc] initWithFrame: CGRectMake(40, 160, 100, 50)];
    [Button setTitleColor:[UIColor colorWithRed:30/255.0 green:144/255.0 blue:255/255.0 alpha:1.0] forState: UIControlStateNormal];
    Button.titleLabel.font = [UIFont systemFontOfSize:14];
    [Button setTitleColor:[UIColor blueColor] forState: UIControlStateHighlighted];
    [Button setTitle:@"Logout" forState:UIControlStateNormal];
    [Button addTarget:self action:@selector(logoutButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:Button];
    
    self.navigationItem.title = NSLocalizedString(@"Profile", nil);
    
    UIBarButtonItem *editItem = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(editButton)];
    

    self.navigationItem.rightBarButtonItem = editItem;
    
}

- (IBAction)editButton{
    
    EditProfilePage *vc = [[EditProfilePage alloc] init];
    UINavigationController *vc2 = [[UINavigationController alloc] initWithRootViewController:vc];
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)logoutButton{
    
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
    
    [[NSUserDefaults standardUserDefaults] setObject:@"NO" forKey:@"loggedIn"];
    [[NSUserDefaults standardUserDefaults] synchronize];

    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    InitView *vc = [[InitView alloc] init];
    UINavigationController *vc2 = [[UINavigationController alloc] initWithRootViewController:vc];
    [appDelegate.window setRootViewController:vc2];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
