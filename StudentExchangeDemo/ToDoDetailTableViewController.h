//
//  ToDoDetailTableViewController.h
//  StudentExchangeDemo
//
//  Created by Atindra Ganeshen on 2016-03-08.
//  Copyright © 2016 Demo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@protocol ToDoProtocol <NSObject>

-(void)addToDoEntity:(NSDictionary *)toDoInfo;
-(void)updateToDoEntity:(NSManagedObject *)toDoEntity withInfo:(NSDictionary *)toDoInfo;

@end

@interface ToDoDetailTableViewController : UITableViewController

@property (strong, nonatomic) NSManagedObject *toDoItem;
@property id<ToDoProtocol> delegate;

@end
