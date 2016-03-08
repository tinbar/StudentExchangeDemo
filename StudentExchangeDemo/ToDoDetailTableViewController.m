//
//  ToDoDetailTableViewController.m
//  StudentExchangeDemo
//
//  Created by Atindra Ganeshen on 2016-03-08.
//  Copyright © 2016 Demo. All rights reserved.
//

#import "ToDoDetailTableViewController.h"

@interface ToDoDetailTableViewController ()

@property (strong, nonatomic) UIBarButtonItem *doneButton;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;

@end

@implementation ToDoDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    UITapGestureRecognizer *textFieldDismissTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:textFieldDismissTap];
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonAction:)];
    self.navigationItem.rightBarButtonItem = self.doneButton;
    if (self.toDoItem != nil) {
        self.title = @"Details";
        self.titleTextField.text = [self.toDoItem valueForKey:@"toDoTitle"];
        self.descriptionTextField.text = [self.toDoItem valueForKey:@"toDoDescription"];
    }
    else {
        self.title = @"Add To Do";
    }
}

-(void)dismissKeyboard {
    [self.titleTextField resignFirstResponder];
    [self.descriptionTextField resignFirstResponder];
}

-(void)doneButtonAction:(UIBarButtonItem *)sender {
    NSLog(@"hit");
    NSString *toDoTitle = self.titleTextField.text;
    NSString *toDoDescription = self.descriptionTextField.text;
    if (toDoTitle.length == 0 || toDoDescription.length == 0) {
        // pop up an alert asking to fill in info
        return;
    }
    NSMutableDictionary *toDoDict = [NSMutableDictionary dictionary];
    [toDoDict setValue:toDoTitle forKey:@"toDoTitle"];
    [toDoDict setValue:toDoDescription forKey:@"toDoDescription"];
    if (self.toDoItem != nil){
        [self.delegate updateToDoEntity:self.toDoItem withInfo:toDoDict];
    }
    else {
        [self.delegate addToDoEntity:toDoDict];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
