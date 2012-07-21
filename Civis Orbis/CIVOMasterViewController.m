//
//  CIVOMasterViewController.m
//  Civis Orbis
//
//  Created by Kris Markel on 7/21/12.
//  Copyright (c) 2012 Civis Orbis. All rights reserved.
//

#import "CIVOMasterViewController.h"

#import "City.h"
#import "CIVODetailViewController.h"
#import "iCarousel.h"

@interface CIVOMasterViewController () <iCarouselDataSource, iCarouselDelegate>

@property (weak, nonatomic) IBOutlet UILabel *cityNameLabel;
@property (weak, nonatomic) IBOutlet iCarousel *carouselView;
@property (weak, nonatomic) IBOutlet UILabel *selectACityLabel;

@end

@implementation CIVOMasterViewController
@synthesize cityNameLabel;
@synthesize carouselView;
@synthesize selectACityLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		self.title = NSLocalizedString(@"Select A City", nil);
    }
    return self;
}
							
- (void)viewDidLoad
{
	[super viewDidLoad];
	
	self.selectACityLabel.font = [UIFont fontWithName:@"IM FELL English" size:24];
	
	self.cityNameLabel.font = [UIFont fontWithName:@"IM FELL English" size:24];
	
	self.carouselView.type = iCarouselTypeRotary;
}

- (void) viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	
	[self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidUnload
{
	[self setCityNameLabel:nil];
	[self setCarouselView:nil];
	[self setSelectACityLabel:nil];
   [super viewDidUnload];
	// Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Orientation

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
	// HACK To get the carousel to resize after an orentation change.
	[self.carouselView reloadData];
}

#pragma mark - Fetched results controller

- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    // Edit the entity name as appropriate.
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"City" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];
    
    // Edit the sort key as appropriate.
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:NO];
    NSArray *sortDescriptors = @[sortDescriptor];
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:@"Master"];
    aFetchedResultsController.delegate = self;
    self.fetchedResultsController = aFetchedResultsController;
    
	NSError *error = nil;
	if (![self.fetchedResultsController performFetch:&error]) {
	     // Replace this implementation with code to handle the error appropriately.
	     // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
	    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
	    abort();
	}
    
    return _fetchedResultsController;
}    

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
	[self.carouselView reloadData];
}

#pragma mark - ICarouselDataSource

- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
	id <NSFetchedResultsSectionInfo> sectionInfo = [[self.fetchedResultsController sections] objectAtIndex:0];
	return [sectionInfo numberOfObjects];
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
	
	NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
	City *city = (City *) [self.fetchedResultsController objectAtIndexPath:indexPath];
	
	NSString *smallMapImageName = [NSString stringWithFormat:@"%@-small.jpg", city.mapFile];
	UIImage *mapImage = [UIImage imageNamed:smallMapImageName];
	
	UIImageView *mapImageView = (UIImageView *)view;
	if (!mapImageView) {
		mapImageView = [UIImageView new];
		mapImageView.contentMode = UIViewContentModeScaleAspectFit;
		mapImageView.layer.shadowColor = [[UIColor blackColor] CGColor];
		mapImageView.layer.shadowOffset = CGSizeMake(15.0, 15.0);
		mapImageView.layer.shadowOpacity = 0.8;
		mapImageView.layer.shadowRadius = 10.0;
	}
	
	float scale = MIN( self.carouselView.bounds.size.width/mapImage.size.width, self.carouselView.bounds.size.height/mapImage.size.height);
	
	mapImageView.bounds = (CGRect) {
		
		.origin = mapImageView.bounds.origin,
		.size.width = mapImage.size.width * scale * 0.9,
		.size.height = mapImage.size.height * scale *0.9,
		
	};
	
	mapImageView.image = mapImage;
	
	return mapImageView;
}

#pragma mark - iCarouselDelegate

- (void) carouselCurrentItemIndexDidChange:(iCarousel *)carousel
{
	NSUInteger currentIndex = carousel.currentItemIndex;
	NSIndexPath *indexPath = [NSIndexPath indexPathForRow:currentIndex inSection:0];
	City *currentCity = (City *) [self.fetchedResultsController objectAtIndexPath:indexPath];
	self.cityNameLabel.text = currentCity.name;
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
	if (!self.detailViewController) {
		self.detailViewController = [[CIVODetailViewController alloc] initWithNibName:@"CIVODetailViewController" bundle:nil];
	}
	
	NSUInteger currentIndex = carousel.currentItemIndex;
	NSIndexPath *indexPath = [NSIndexPath indexPathForRow:currentIndex inSection:0];
	City *currentCity = (City *) [self.fetchedResultsController objectAtIndexPath:indexPath];
	self.detailViewController.city = currentCity;
	
	NSString *backButtonText = NSLocalizedString(@"Cities", nil);
	UIBarButtonItem *backButton = [[UIBarButtonItem alloc]
											 initWithTitle: backButtonText
											 style: UIBarButtonItemStyleBordered
											 target: nil action: nil];
	
	[self.navigationItem setBackBarButtonItem: backButton];
	
	[self.navigationController pushViewController:self.detailViewController animated:YES];
}

@end
