//
//  CIVODetailViewController.m
//  Civis Orbis
//
//  Created by Kris Markel on 7/21/12.
//  Copyright (c) 2012 Civis Orbis. All rights reserved.
//

#import "CIVODetailViewController.h"

#import "City.h"

const float CIVOInitialMapZoomLevel = 0.2;

@interface CIVODetailViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *mapImageView;

- (void)configureView;

@end

@implementation CIVODetailViewController

#pragma mark - Managing the detail item
@synthesize scrollView;
@synthesize mapImageView;

- (void)setCity:(id)newCity
{
    if (_city != newCity) {
        _city = newCity;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
	if (!self.isViewLoaded) {
		return;
	}
	
	// Update the user interface for the detail item.
	self.title = self.city.name;
	
	NSString *mapFileName = [NSString stringWithFormat:@"%@.jpg", self.city.mapFile];
	UIImage *mapImage = [UIImage imageNamed:mapFileName];
	self.mapImageView.frame = (CGRect) {
		.origin = CGPointZero,
		.size = mapImage.size,
	};
	self.mapImageView.image = mapImage;
	
	self.scrollView.contentSize = self.mapImageView.image.size;
	self.scrollView.zoomScale = CIVOInitialMapZoomLevel;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	[self configureView];
}

- (void)viewDidUnload
{
	[self setMapImageView:nil];
	[self setScrollView:nil];
	[super viewDidUnload];
	// Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		self.title = NSLocalizedString(@"Map", @"Map");
    }
    return self;
}

#pragma mark - UIScrollViewDelegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
	return self.mapImageView;
}
		
@end
