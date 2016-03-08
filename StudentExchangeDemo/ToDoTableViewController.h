//
//  ToDoTableViewController.h
//  StudentExchangeDemo
//
//  Created by Atindra Ganeshen on 2016-03-08.
//  Copyright © 2016 Demo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "ToDoDetailTableViewController.h"

@interface ToDoTableViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
