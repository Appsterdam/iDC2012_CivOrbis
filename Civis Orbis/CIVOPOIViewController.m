//
//  CIVOPOIViewController.m
//  Civis Orbis
//
//  Created by Kris Markel on 7/21/12.
//  Copyright (c) 2012 Civis Orbis. All rights reserved.
//

#import "CIVOPOIViewController.h"

#import <QuartzCore/QuartzCore.h>

#import "POI.h"

@interface CIVOPOIViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (weak, nonatomic) IBOutlet UIButton *checkInButton;

- (void) configureView;

@end

@implementation CIVOPOIViewController
@synthesize textView;
@synthesize checkInButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	// Do any additional setup after loading the view from its nib.
	
	[self configureView];
	
	// Fancy up the button.
	self.checkInButton.layer.shadowColor = [[UIColor whiteColor] CGColor];
	self.checkInButton.layer.shadowOffset = CGSizeMake(0.0, 0.0);
	self.checkInButton.layer.shadowOpacity = 0.8;
	self.checkInButton.layer.shadowRadius = 10.0;
	
	self.checkInButton.titleLabel.font = [UIFont fontWithName:@"IM FELL English" size:20];

}

- (void) viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	
	[self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidUnload
{
	[self setTextView:nil];
	[self setCheckInButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Properties

- (void) setPOI:(POI *)newPOI
{
	if (_POI != newPOI) {
		_POI = newPOI;
		
		// Update the view.
		[self configureView];
	}
}

#pragma mark - Private

- (void) configureView
{
	self.title = self.POI.name;
	self.textView.text = self.POI.text;
}

@end
