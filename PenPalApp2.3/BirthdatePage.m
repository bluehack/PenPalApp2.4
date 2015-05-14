//
//  BirthdatePage.m
//  PenPalApp2.3
//
//  Created by Computer on 4/13/15.
//  Copyright (c) 2015 Computer. All rights reserved.
//

#import "BirthdatePage.h"

NSString *gV_bday = nil;

@interface BirthdatePage ()

@end

@implementation BirthdatePage



- (void)viewDidLoad {
    [super viewDidLoad];
    
    //birthdate.delegate = self;
    //birthdate.dataSource = self;
    
    birthdate = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, (self.view.frame.size.height/2.0) )];
    birthdate.datePickerMode = UIDatePickerModeDate;
    birthdate.hidden = NO;
    birthdate.date = [NSDate date];
    
    //[birthdate addTarget:self action:@selector(LabelChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:birthdate];
    
    [self.view addSubview:mainView];
    
    UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 28, self.view.frame.size.width, 44)];
    [navBar setTintColor:[UIColor colorWithRed:30/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]];
    [self.view addSubview:navBar];
    
    UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancelButton)];
    
    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(doneButton)];
    
    UINavigationItem *navItem = [[UINavigationItem alloc] initWithTitle:nil];
    [navItem setLeftBarButtonItem:cancelItem animated:YES];
    [navItem setRightBarButtonItem:doneItem animated:YES];
    [navBar setItems:[NSArray arrayWithObject:navItem] animated:YES];
    
    navBar.topItem.title = NSLocalizedString(@"Birthdate", nil);
    
    
}

- (void)doScrolling
{
    //[(UITableView *)self.view scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:34 inSection:0 ] atScrollPosition:0 animated:YES];
}

-(void)viewDidAppear:(BOOL)animated{
    
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)cancelButton{
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)doneButton{
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MM-dd-yyyy"];
    NSString *dateString = [dateFormat stringFromDate:birthdate.date];
    gV_bday = dateString;
    
    NSLog(@"%@", dateString);
    
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
