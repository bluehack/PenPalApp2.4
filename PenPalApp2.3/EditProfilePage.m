//
//  EditProfilePage.m
//  PenPalApp2.3
//
//  Created by Computer on 6/4/15.
//  Copyright (c) 2015 Computer. All rights reserved.
//

#import "EditProfilePage.h"
#import "SignupOptions.h"
#import "SLCountryPickerViewController.h"

@interface EditProfilePage ()
@property (nonatomic, strong) UITextField *searchTextField;

@end

@implementation EditProfilePage
@synthesize searchTextField = _searchTextField;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIBarButtonItem *saveItem = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(saveButton)];
    
    
    self.navigationItem.rightBarButtonItem = saveItem;
    
    self.navigationItem.title = NSLocalizedString(@"Edit", nil);
    
    float width = self.view.frame.size.width - 15;
    float height = 38;
    float xPos = 15;
    float yPos = 3;
    
    float buttonWidth =  self.view.frame.size.width;
    float buttonHeight = 28;
    float buttonX = (self.view.frame.size.width - buttonWidth)/2;
    
    
    
    
    _searchTextField = [[UITextField alloc] initWithFrame:CGRectMake(xPos, yPos, width, height)];
    _searchTextField.borderStyle = UITextBorderStyleRoundedRect;
    _searchTextField.textColor = [UIColor blackColor];
    _searchTextField.font = [UIFont systemFontOfSize:17.0];
    _searchTextField.placeholder = NSLocalizedString(@"Search Term", nil);
    _searchTextField.backgroundColor = [UIColor clearColor];
    _searchTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    _searchTextField.keyboardType = UIKeyboardTypeDefault;
    _searchTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
#pragma mark - may need to center do diff screen sizes
    _searchTextField.borderStyle = UITextBorderStyleNone;
    _searchTextField.tag = 101;
    _searchTextField.returnKeyType = UIReturnKeyNext;
    _searchTextField.delegate = self;
    
    
    
    UIButton *countryButton2 = [[UIButton alloc] initWithFrame: CGRectMake(buttonX, yPos + 5, buttonWidth, buttonHeight)];
    [countryButton2 setTitleColor:[UIColor colorWithRed:30/255.0 green:144/255.0 blue:255/255.0 alpha:1.0] forState: UIControlStateNormal];
    [countryButton2 setTitleColor:[UIColor blueColor] forState: UIControlStateHighlighted];
    [countryButton2 setTitle:@"Select Country" forState:UIControlStateNormal];
    [countryButton2 setTag:106];
    [countryButton2 addTarget:self action:@selector(actionCNY:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *regionButton2 = [[UIButton alloc] initWithFrame: CGRectMake(buttonX, yPos + 5, buttonWidth, buttonHeight)];
    [regionButton2 setTitleColor:[UIColor colorWithRed:30/255.0 green:144/255.0 blue:255/255.0 alpha:1.0] forState: UIControlStateNormal];
    [regionButton2 setTitleColor:[UIColor blueColor] forState: UIControlStateHighlighted];
    [regionButton2 setTitle:@"Select Region" forState:UIControlStateNormal];
    [regionButton2 setTag:107];
    [regionButton2 addTarget:self action:@selector(actionBTN:) forControlEvents:UIControlEventTouchUpInside];
    
    
    mainView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    
    mainView.delegate = self;
    mainView.dataSource = self;
    
    [self.view addSubview:mainView];

}


- (IBAction)saveButton{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)actionBTN:(id)sender{
    
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInteger:[sender tag]] forKey:@"pageListID"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    SignupOptions *vc = [[SignupOptions alloc] init];
    UINavigationController *vc2 = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:vc2 animated:YES completion:nil];
    
}


-(void)actionCNY:(id)sender{
    SLCountryPickerViewController *vc = [[SLCountryPickerViewController alloc]init];
    vc.completionBlock = ^(NSString *country, NSString *code){
        //_countryNameLabel.text = country;
        //_countryImageView.image = [UIImage imageNamed:code];
        //_countryCodeLabel.text = code;
        
        NSString *text = country;
        
    };
    
    UINavigationController *vc2 = [[UINavigationController alloc] initWithRootViewController:vc];
    
    [self presentViewController:vc2 animated:YES completion:nil];
    
}




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    
    switch (section) {
        case 0:
            return 3;
            break;
        case 4:
            return 2;
            break;
        default:
            break;
    }
    return 1;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
        return 22;
    if (section == 1)
        return 20;
    if (section == 2)
        return 20;
    if (section == 3)
        return 20;
    if (section == 4)
        return 40;
    return tableView.sectionHeaderHeight;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0)
        return 1;
    if (section == 1)
        return 1;
    if (section == 2)
        return 1;
    if (section == 4)
        return 250;
    return tableView.sectionFooterHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:nil];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
    }
    
    
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
                //[cell addSubview:usernameTextField];
                break;
            case 1:
                //[cell addSubview:nameTextField];
                break;
            case 2:
                //[cell addSubview:passwordTextField];
                break;
            default:
                break;
        }
    }
    if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 0:
                //[cell addSubview:nameTextField];
                break;
            default:
                break;
        }
    }
    if (indexPath.section == 2) {
        switch (indexPath.row) {
            case 0:
                //[cell addSubview:passwordTextField];
                break;
            default:
                break;
        }
    }
    if (indexPath.section == 3) {
        switch (indexPath.row) {
            case 0:
                //[cell addSubview:emailTextField];
                break;
            default:
                break;
        }
    }
    if (indexPath.section == 4) {
        switch (indexPath.row) {
            case 0:
                //[cell  addSubview: countryButton2]; //cell.contentView
                break;
            case 1:
                //[cell addSubview: regionButton2];
                break;
            default:
                break;
                
        }
        
    }
    
#pragma - might make parts a global veriable
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
