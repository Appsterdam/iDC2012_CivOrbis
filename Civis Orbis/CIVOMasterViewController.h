//
//  CIVOMasterViewController.h
//  Civis Orbis
//
//  Created by Kris Markel on 7/21/12.
//  Copyright (c) 2012 Civis Orbis. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CIVODetailViewController;

#import <CoreData/CoreData.h>

@interface CIVOMasterViewController :UIViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) CIVODetailViewController *detailViewController;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
