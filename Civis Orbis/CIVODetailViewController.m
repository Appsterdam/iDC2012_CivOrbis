//
//  CIVODetailViewController.m
//  Civis Orbis
//
//  Created by Kris Markel on 7/21/12.
//  Copyright (c) 2012 Civis Orbis. All rights reserved.
//

#import "CIVODetailViewController.h"

#import "City.h"
#import "POI.h"

const float CIVOInitialMapZoomLevel = 0.2;

@interface CIVODetailViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *mapImageView;

- (void) configureView;
- (void) handlePinTap: (UIGestureRecognizer *)gestureRecognizer;

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

	// Place the pins:
	for (POI *poi in self.city.pois) {

		UIImage *pinImage = [UIImage imageNamed:@"pin.png"];
		UIImageView *pinView = [[UIImageView alloc] initWithImage:pinImage];
		pinView.userInteractionEnabled = YES;
		
		CGPoint pinPoint = CGPointFromString(poi.mapPoint);
		// The bottom left of the pin is the bit that belongs on the point.
		pinPoint = CGPointMake(pinPoint.x + (pinImage.size.width / 2), pinPoint.y - (pinImage.size.height / 2));
		pinView.center = pinPoint;
		[self.mapImageView addSubview:pinView];
		
		UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinTap:)];
		[pinView addGestureRecognizer:tapRecognizer];
	}
	
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
		
#pragma mark - Gesture recognizers

- (void) handlePinTap: (UIGestureRecognizer *)gestureRecognizer
{
}


@end
